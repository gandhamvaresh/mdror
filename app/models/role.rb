class Role < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :users
  
  def self.internal
    Role.where(:name => ['Admin', 'Staff'])
  end
  
  def self.external
    Role.where(:name => ['Doctor', 'FrontDesk'])
  end
end
