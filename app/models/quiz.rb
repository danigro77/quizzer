class Quiz < ActiveRecord::Base
  attr_accessible :name, :num_answers, :active, :users
  
  before_save :default_values
  
  validates :name, :presence => true
  validates :num_answers, :presence => true

  belongs_to :user        # ONLY role=teachers
  
  private
    def default_values
      self.active ||= false
    end
end