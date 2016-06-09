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
  has_many :requests

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

end
