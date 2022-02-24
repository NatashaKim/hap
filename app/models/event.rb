class Event < ApplicationRecord
  validates :name, :presence => true
  has_many :votes, :dependent => :destroy
  belongs_to :user
end
