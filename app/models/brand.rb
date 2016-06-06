class Brand < ActiveRecord::Base
  # Validations
  validates :brand_name, presence: true
  validate :has_users?

    def has_users?
      errors.add(:users, "A Brand must have at least one user.") if self.users.blank?
    end

  # Associations
  has_and_belongs_to_many :users
  has_many :likes, :as => :likeable
  has_many :requests
  has_many :projects, through: :requests
end
