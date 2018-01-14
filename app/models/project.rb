require 'net/http'
require 'json'
require 'awesome_print'

class Project < ActiveRecord::Base
  # Validations
  validates :project_name, presence: true
  validate :has_users?

    def has_users?
      errors.add(:users, "A project must have at least one user.") if self.users.blank?
    end

  # Associations
  has_and_belongs_to_many :users
  has_many :likes, :as => :likeable
  has_many :pleas

  def set_default_user(creator)
    self.users << User.find(creator)
  end

  def set_tags(tag_string)
    self.tags = tag_string.split(" ")
  end

  def set_cover_img(filename, tempfile)
    filename = "hh_#{self.project_name}#{File.extname(tempfile)}".split(" ").join("_")
    File.open(File.join(APP_ROOT, 'public', 'assets', 'projects' , filename), "w") do |f|
      f.write(tempfile.read)
    end
    base_path = "/assets/projects"
    path = [base_path, filename]
    self.cover_img_url = path.join('/')
  end

  def set_location(location_string)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location_string}&key=AIzaSyD-I2nzQcvXC-iqKxHBgKa18_wI4QMcZHQ"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @location = JSON.parse(response)
    p @location

    self.lat = @location['results'][0]['geometry']['location']['lat']
    self.lng = @location['results'][0]['geometry']['location']['lng']
  end

end
