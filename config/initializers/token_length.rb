SimpleTokenAuthentication::TokenGenerator.class_eval do
  def generate_token
    Devise.friendly_token(64)
  end
end
