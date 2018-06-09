class LitGuide < ActiveRecord::Base
  has_many :highlights

  def position_of_phrase(phrase)
    text.index phrase
  end
end
