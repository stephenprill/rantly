class Rant < ActiveRecord::Base

  belongs_to :user
  validates_length_of :body, minimum: 144, :allow_blank => false #wont allow blank
  validates :body, presence: :true
  validates :title, presence: :true

  def self.search(search)
    where("body ILIKE ? or title ILIKE ?", "%#{search}%", "%#{search}%")
  end


end
