
Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :facebook, '598905427455025', '92d550fc2fad03101d2d1e1a5da64c17'
end
