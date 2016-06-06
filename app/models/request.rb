class Request < ActiveRecord::Base
  # Validations
  validates :brand_id, :project_id, :status, presence: true

  # Associations
  belongs_to :project
  belongs_to :brand
  has_many :users, through: :project
end
