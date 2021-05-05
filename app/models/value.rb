class Value < ApplicationRecord
  belongs_to :user

  scope :user_valued_image, -> (current_user_id, image_id) { where(user_id: current_user_id, image_id: image_id) }

  def self.user_valued_exists(current_user_id, image_id)
    value_image = user_valued_image(current_user_id, image_id)
    if value_image.blank?
      res = 0
      value = 0
    else
      res = 1
      value = value_image[0].value
    end
    [res, value]
  end
end
