class Highlight < ActiveRecord::Base
  belongs_to :passage
  has_one :book, through: :passage

  validates :passage, presence: true
end
