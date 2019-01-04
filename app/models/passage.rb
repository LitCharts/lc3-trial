class Passage < ActiveRecord::Base
  belongs_to :book
  has_many :highlights, dependent: :destroy
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :literary_symbols

  validates :book, presence: true
end
