class Document < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  has_secure_token
  has_one_attached :download
end
