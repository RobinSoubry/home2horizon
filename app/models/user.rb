class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many_and_belongs_to_many :projects
  has_many_and_belongs_to_many :brands
  
  has_many :brand_sp_requests, through: :brands, source: :brand
  has_many :project_sp_requests, through: :projects, source: :project

  has_many :likes, :as => :likeable
end
