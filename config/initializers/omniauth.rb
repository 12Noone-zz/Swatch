OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1623266214592881', '3ce8468f620291a728df55ba9a87df5f', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end