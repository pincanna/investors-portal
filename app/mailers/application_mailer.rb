class ApplicationMailer < ActionMailer::Base
  register_interceptor Shortener::ShortenUrlInterceptor.new
  default from: 'from@example.com'
  layout 'mailer'
end
