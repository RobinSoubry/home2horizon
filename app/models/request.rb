class Request < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :project
  belongs_to :brand
  has_many :users, through: :project
end