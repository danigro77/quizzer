class School < ActiveRecord::Base
  attr_accessible :name, :address_1, :address_2, :city, :state, :zip, :country, :url, :email, :contact, :users
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  validates :name,      :presence => true
  validates :address_1, :presence => true
  validates :city,      :presence => true
  validates :zip,       :presence => true
  validates :url,       :presence => true,
                        :uniqueness => true, 
                         format: { with: VALID_URL_REGEX }
  validates :email,     :presence => true,
                        :uniqueness => true, 
                         format: { with: VALID_EMAIL_REGEX }
  validates :contact,   :presence => true
  
  has_many :users
end