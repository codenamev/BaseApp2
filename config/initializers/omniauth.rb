Rails.application.config.middleware.use OmniAuth::Builder do
  require 'openid/store/filesystem'
  provider :facebook, "144624252302115", "7b7dc814eadedee2bc0f626ef29c5e96", {:scope => 'publish_stream,offline_access,email,user_photos'}
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp')
end
