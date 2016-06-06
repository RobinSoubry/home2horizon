class Brand < ActiveRecord::Base
  # Remember to create a migration!

  has_and_belongs_to_many :users

  has_many :likes, :as => :likeable

  has_many :requests

  has_many :projects, through: :requests

end
