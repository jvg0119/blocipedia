class Wiki < ApplicationRecord
  belongs_to :user#, optional: true
	validates :title,	presence: true, 
  					uniqueness: { case_sensitive: false } 
 	validates :body, 	presence: true, 
  					length: { minimum: 20 } 

  scope :public_wikis, -> { where(private: false) }  					
  scope :private_wikis, -> { where(private: true) }  					

  # after_initialize :set_default ## set default to false instead

  # def set_default
  # 	self.private = 'false'
  # end

end
