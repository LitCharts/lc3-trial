class Book < ActiveRecord::Base
  belongs_to :author
  has_many :themes
end
