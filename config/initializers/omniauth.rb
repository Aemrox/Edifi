Rails.application.config.middleware.use OmniAuth::Builder do
provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']


end

OmniAuth.config.on_failure = Proc.new do |env|
  SessionsController.action(:auth_failure).call(env)
end