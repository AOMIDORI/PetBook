class Pet < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :avatar, AvatarUploader
  validates :user_id, presence: true
  validates :name, presence:true, length: { maximum: 50 }
  validate :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if avatar.size > 5.megabytes
        errors.add(:avatar, "should be less than 5MB")
      end
    end


end
