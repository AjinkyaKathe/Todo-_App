ActionMailer::Base.smtp_settings =  {

    address:              "smtp.gmail.com",
    port:                 587,
    user_name:            "ajinkya.kathe@cuelogic.co.in",
    password:             "9730855777",
    domain:               "mail.google.com",
    authentication:       :plain,
    enable_starttls_auto: true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"