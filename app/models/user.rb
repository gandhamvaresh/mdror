class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :role_id, :client_id, :digital_signature
  
  has_secure_password
  
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  
  validates :email, :presence => true, 
                    :uniqueness => true, 
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  belongs_to :role
  belongs_to :client
  
  has_attached_file :digital_signature, :styles => { :short => "200x30>" }
  validates_attachment_content_type :digital_signature, :content_type => /\Aimage\/.*\Z/
    
  def admin?
    self.role.name == 'Admin'
  end
  
  def staff?
    self.role.name == 'Staff'
  end
  
  def front_desk?
    self.role.name == 'FrontDesk'
  end
  
  def doctor?
    self.role.name == 'Doctor'
  end
  
  def in_house_user?
    self.admin? || self.staff?
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
