class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy

  enum role: { standard: 0, premium: 1, admin: 2 } 
  # enum role: [ :standard, :premium, :admin ]

  after_initialize :set_default  
 # after_initialize { self.role ||= "standard" }

  def set_default
  	self.role ||= "standard"
  end

end
