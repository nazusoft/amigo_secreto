module CampaignsHelper

  def visibility(campaign)
    qtd_opened = campaign.count_opened
    qtd_total  = campaign.members.count
    klass      = qtd_opened == qtd_total ? 'green-text' : ''

    icon = "<i class='material-icons visibility-icon' style='margin-right:10px'>visibility</i>"

    "<h6 class='visibility-text m-0 #{klass} valign-wrapper'>#{icon} Vistos #{qtd_opened}/#{qtd_total}</h6>".html_safe
  end

  def format_event_date(event_date)
    event_date ? event_date.strftime("%d.%m.%y") : '--------'
  end

end
