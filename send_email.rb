require 'net/smtp'

def send_email(smtp_address,
               smtp_port,
               smtp_domain,
               smtp_authentication,
               smtp_user_name,
               smtp_password,
               smtp_default_from_email,
               to_email)
  message = <<MESSAGE_END
From: #{smtp_default_from_email}
To: #{to_email}
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

  p message

  begin
    Net::SMTP.start(smtp_address,
                    smtp_port,
                    smtp_domain,
                    smtp_user_name,
                    smtp_password,
                    smtp_authentication) do |smtp|
      smtp.send_message message, smtp_default_from_email,
                        to_email
    end
  rescue => ex
    p ex
  end
end
