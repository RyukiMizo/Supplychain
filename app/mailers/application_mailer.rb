class ApplicationMailer < ActionMailer::Base
  default Branding: 'branding@example.com'
  layout 'mailer'
end
