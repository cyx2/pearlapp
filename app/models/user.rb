class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings
  has_many :cornell_classes, :through => :ratings

  # Validator requires these fields for a user.
  validates :name, presence: true
  validates :email, uniqueness: true
end
