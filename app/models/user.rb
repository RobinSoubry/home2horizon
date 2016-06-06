require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :brands
  
  has_many :brand_requests, through: :brands, source: :requests
  has_many :project_requests, through: :projects, source: :requests

  has_many :likes, :as => :likeable

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
