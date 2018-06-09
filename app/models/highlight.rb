class Highlight < ActiveRecord::Base
  belongs_to :lit_guide

  validates :quote, :start_position, :end_position, :lit_guide_id, presence: true
end
