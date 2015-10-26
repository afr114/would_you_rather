class Post < ActiveRecord::Base
  acts_as_votable
  validates_presence_of :option_a_title, :option_b_title
  has_attached_file :image, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :comments
end
