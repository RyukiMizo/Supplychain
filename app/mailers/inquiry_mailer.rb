class InquiryMailer < ApplicationMailer
    def send_mail(inquiry)
        @inquiry = inquiry
          mail(
          from: 'noreply@example.com',
          to:   'branding9872@gmail.com',
          subject: 'お問い合わせ通知'
          )
    end
end
