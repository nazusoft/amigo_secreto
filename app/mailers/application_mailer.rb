class ApplicationMailer < Devise::Mailer

  helper :application

  include Devise::Controllers::UrlHelpers

  default from: 'from@example.com'
  layout 'mailer'

end
