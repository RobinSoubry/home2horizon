class Like < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :likeable, polymorphic: :true

end
