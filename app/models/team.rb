class Team < ActiveRecord::Base
  attr_accessible :eliminated, :name
  validates_presence_of :name
end
