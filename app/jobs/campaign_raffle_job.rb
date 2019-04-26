class CampaignRaffleJob < ApplicationJob

  queue_as :emails

  def perform(campaign)
    begin
      results = RaffleService.new(campaign).perform

      if results.empty? and results.blank?
        send_error(campaign)
      else
        campaign.members.each{|m| m.set_pixel }

        results.each do |r|
          CampaignMailer.raffle(campaign, r.first, r.last).deliver_now
        end

        campaign.update(status: :finished)
      end
    rescue
      send_error(campaign)
    end
  end

  private

  def send_error(campaign)
    CampaignMailer.error(campaign).deliver_now
  end

end
