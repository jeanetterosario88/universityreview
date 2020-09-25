
Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOOK_SECRET']
end
