class Member < ApplicationRecord

  belongs_to :campaign

  validates :name, :email, :campaign, presence: true

  after_destroy :set_campaign_pending
  after_create  :set_campaign_pending

  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        render json: { member: @member }, status: 200
      else
        render json: { message: @member.errors }, status: :unprocessable_entity
      end
    end
  end

  def set_pixel
    self.open  = false
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Member.exists?(token: random_token)
    end

    self.save
  end

  protected

  def set_campaign_pending
    self.campaign.update(status: :pending)
  end

end
