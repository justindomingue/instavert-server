class Comment < ActiveRecord::Base
  attr_accessible :name, :email, :comment, :status
  validates :status, :inclusion => { :in => ["Complete", "Opened"] }  
  
  scope :opened, where(:status => 'Opened')
  scope :complete, where(:status => 'Complete')
end
