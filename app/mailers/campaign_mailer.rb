class CampaignMailer < ApplicationMailer

  def raffle
    @greeting = "Hi"

    mail to: "to@example.org"
  end

end
