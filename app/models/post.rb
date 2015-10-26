class Post < ActiveRecord::Base
  validates_presence_of :option_a_title, :option_b_title
end
