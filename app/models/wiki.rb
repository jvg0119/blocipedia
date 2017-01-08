class Wiki < ApplicationRecord
  belongs_to :user#, optional: true
	validates :title,	presence: true, 
  					uniqueness: { case_sensitive: false } 
 	validates :body, 	presence: true, 
  					length: { minimum: 20 } 

  after_initialize :set_default 

  def set_default
  	self.private = 'false'
  end

end
