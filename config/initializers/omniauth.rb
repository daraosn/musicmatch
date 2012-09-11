Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '227346317390840', '304ff4a7b7e6e036125476cdfc9cf8cf'
end
