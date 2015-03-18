class Rant < ActiveRecord::Base

  belongs_to :user
  validates_length_of :body, minimum: 144, :allow_blank => false #wont allow blank
  validates :body, presence: :true


end
