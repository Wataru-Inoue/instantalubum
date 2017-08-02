class Picture < ActiveRecord::Base

  default_scope -> { order(updated_at: :desc) }

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  mount_uploader :picture_url, PhotoUploader
end
