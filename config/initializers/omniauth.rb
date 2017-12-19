Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, 'API_KEY', 'API_SECRET'
end