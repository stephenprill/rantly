class User < ActiveRecord::Base
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

  has_many :rants

  include Gravtastic
 gravtastic

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

end
