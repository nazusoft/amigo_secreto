class CampaignMailer < ApplicationMailer

  def raffle(campaign, member, friend)
    @campaign = campaign
    @member   = member
    @friend   = friend

    mail(to: @member.email, subject: "Amigo Secreto: #{@campaign.title}")
  end

  def error(campaign)
    @campaign = campaign

    mail(to: @campaign.user.email, subject: "Amigo Secreto: ERRO - #{@campaign.title}")
  end

end
