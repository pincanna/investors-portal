class Document < ApplicationRecord
  resourcify
  belongs_to :attachable, polymorphic: true, optional: true
  has_secure_token
  has_one_attached :download
  before_create :set_default_attachable
  after_create :set_viewers

  attribute :viewers, :string, array: true

  private

  def set_default_attachable
    self.attachable_id ||= 0
    self.attachable_type ||= 'User'
  end

  def set_viewers
    if viewers.size > 0
      viewers.each do |viewer|
        next if viewer.empty?
        user = User.find(viewer)
        user.add_role(:viewer, self)
      end
    end
  end
end
