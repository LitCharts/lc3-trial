class Theme < ActiveRecord::Base
  validates :name, presence: true
end
