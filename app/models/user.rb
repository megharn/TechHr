class User < ApplicationRecord
	has_many :tasks
	has_many :comments
  has_many :task_reasons
  has_many :user_logs
  
	validates_length_of :mobile_no, :minimum => 10, :maximum => 10
	validates_numericality_of :mobile_no
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
  	"#{first_name} #{last_name}"
  end

end
