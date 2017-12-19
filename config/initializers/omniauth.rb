Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['API_KEY'], ENV['API_SECRET']
end

# use ENV before the keys when retrieving variables from the .env file, omit for the heroku version