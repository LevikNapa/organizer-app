Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'e57148341c6cbe86f9a3', 'fb6b9835a2377669959c09d9353c32da8817c51c'
end
