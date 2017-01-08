class Wiki < ApplicationRecord
  belongs_to :user#, optional: true
	validates :title,	presence: true, 
  					uniqueness: { case_sensitive: false } 
 	validates :body, 	presence: true, 
  					length: { minimum: 20 } 

end
