require 'bcrypt'

class User < ActiveRecord::Base
  # Validations
  validates :first_name, :last_name, :email, :username, :password_hash, presence: true
  validates :email, :username, uniqueness: true

  # Associations
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :brands
  has_many :brand_requests, through: :brands, source: :pleas
  has_many :project_requests, through: :projects, source: :pleas
  has_many :likes, :as => :likeable

  # User authentication
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def set_profile_pic(filename, tempfile)
    filename = "hh_#{self.username}#{File.extname(tempfile)}".split(" ").join("_")
    File.open(File.join(APP_ROOT, 'public', 'assets', 'users' , filename), "w") do |f|
      f.write(tempfile.read)
    end
    base_path = "/assets/users"
    path = [base_path, filename]
    self.profile_pic_url = path.join('/')
  end

end
