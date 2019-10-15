class EncryptedMemo < ApplicationRecord
  has_secure_token :uid
  attr_encrypted :body, key: Rails.application.credentials.dig(:encryption_key)
end
