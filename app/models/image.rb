class Image < ApplicationRecord
  belongs_to :book
  has_attached_file :image, 
    styles: { medium: "300x300>", thumb: "100x100>" }, 
    default_url: "https://s3.eu-central-1.amazonaws.com/bookstore-kiselyow/:class/:attachment/default/:style/no_image.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_attributes=(attributes)
    image.clear if has_destroy_flag?(attributes) && !image.dirty?
  end
end
