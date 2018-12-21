class Book < ActiveRecord::Base
  has_many :passages
  has_many :literary_symbols, through: :passages
  has_many :themes, through: :passages
  has_many :highlights, through: :passages

  validates :title, :author, presence: true
end
