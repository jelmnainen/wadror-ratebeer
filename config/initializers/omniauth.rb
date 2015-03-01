Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['1776a8785c9d24965520'], ENV['df6bab4abee33dcb95bdb367041cc3bbc034d337']
end
