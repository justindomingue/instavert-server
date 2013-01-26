class Comment < ActiveRecord::Base
  attr_accessible :name, :email, :comment, :status
  validates :status, :inclusion => { :in => ["Complete", "Ouvert"], :message => "deux choix : Complete ou  Ouvert" }  
  
  scope :ouvert, where(:status => 'Ouvert')
  scope :complete, where(:status => 'Complete')
end
