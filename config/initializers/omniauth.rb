Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret, skip_jwt: true
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   config = Rails.application.config.x.settings["oauth2"]
#
#   provider :google_oauth2, config["357084911495-mj6f3s4usktq4i9hsa0lbvggagete3jn.apps.googleusercontent.com"],
#                            config["sB2P4KUhXohuWOzZ8elD3cg8"],
#                            image_size: 150
# end

# project_id = "Your Google Cloud project ID"
