class Quiz < ActiveRecord::Base
  attr_accessible :name, :num_answers, :active, :users
  
  before_safe :default_values
  
  validates :name, :presence => true
  validates :num_answers, :presence => true
  
  private
    def default_values
      self.active ||= false
    end
end