class Document < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true
  has_secure_token
  has_one_attached :download
  before_create :set_default_attachable

  private

  def set_default_attachable
    self.attachable_id ||= 0
    self.attachable_type ||= 'User'
  end
end
