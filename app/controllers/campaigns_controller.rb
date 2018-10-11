class CampaignsController < ApplicationController

  respond_to :html, :json

  before_action :set_campaign, only: [:show, :destroy, :update, :raffle]
  before_action :is_owner?,    only: [:show, :destroy, :update, :raffle]

  def show
  end

  def index
    @campaigns = current_user.campaigns
  end

  def create
    @campaign = Campaign.new(user: current_user, title: 'Nova Campanha', description: 'Descreva sua campanha...')

    if @campaign.save
      redirect_to "/campaigns/#{@campaign.id}"
    else
      redirect_to root_path, notice: @campaign.errors
    end
  end

  def update
    if @campaign.update(campaign_params)
      render json: { message: 'Campanha atualizada com sucesso' }, status: 200
    else
      render json: { message: @campaign.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @campaign.destroy

      render json: { message: 'Campanha removida com sucesso!' }, status: 200
    rescue
      render json: { message: 'Problema na remoção da Campanha' }, status: :unprocessable_entity
    end
  end

  def raffle
    if @campaign.status != "pending"
      render json: { message: 'Já foi sorteada' }, status: :unprocessable_entity
    elsif @campaign.members.count < 3
      render json: { message: 'A campanha precisa de pelo menos 3 pessoas' }, status: :unprocessable_entity
    else
      CampaignRaffleJob.perform_later(@campaign)

      render json: { message: 'Tudo certo, em breve os participantes receberão um email!' }, status: 200
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :description, :event_date, :event_hour, :location).merge(user: current_user)
  end

  def is_owner?
    unless current_user == @campaign.user
      redirect_to root_path
    end
  end

end
