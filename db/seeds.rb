require 'faker'

User.delete_all
Brand.delete_all
Project.delete_all
Request.delete_all
Like.delete_all

users = 100.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :username   => Faker::Internet.user_name,
                :password   => '123',
                :personal_description => Faker::Lorem.paragraph,
                :profile_pic_url => Faker::Avatar.image
                )
end

# Create Brands
brands = ["The North Face", "Marmot ", "Ice Breaker", "Patagonia",
 "Petzl", "Salomon", "Sea To Summit", "Clif", "Merell", "Outdoor Research", 
 "Millet", "Helly Hansen", "Ortlieb", "Smartwool", "Garmin", "GoPro", "Fitbit"].map do |name|
  Brand.create!(:brand_name            => name,
                  :brand_description   => Faker::Lorem.paragraph,
                  :sponsorship_rules   => Faker::Lorem.paragraph)
end

# Create Projects
projects = [corsicat, socotra, mongul_rally]

corsicat = Project.create!(project_name: "CorsiCat",
                  project_description: "Circumnavigation of Corsica: 750 Miles of sailing with an 18' Hobiecat Tiger"
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/46076_590917034259217_1331710102_n.jpg?oh=645bfd77224fb5adee59140704402246&oe=57C88B98",
                  cover_img_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/1170784_722532904430962_73177735_n.jpg?oh=9daf187a85308c9e308cac9fdb7496e3&oe=57DA2296",
                  facebook_url: "https://www.facebook.com/corsicat.360"
                  )

socotra = Project.create!(project_name: "Socotra, The forgotten Island",
                  project_description: "Paragliding in on the forgotten island of Socotra"
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/10622784_625164854265257_3194957668341073425_n.jpg?oh=64febaf5357603dad470a624eda656e4&oe=57CEB725",
                  cover_img_url: "https://s-media-cache-ak0.pinimg.com/564x/65/e0/a2/65e0a2a25ea588592a8c6847ae225645.jpg",
                  facebook_url: "https://www.facebook.com/Socotra-Island-paragliding-surfing-292182224230190/"
                  )

mongul_rally = Project.create!(project_name: "Mongol Rally -Team TLP",
                  project_description: "Paragliding in on the forgotten island of Socotra"
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11692801_1617744951827007_81233844116250992_n.jpg?oh=64ef7b22a4d24a9fd444c0e54174b775&oe=57C28744",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/"
                  )

# # Create Projects_Teams
# projects.each do |project|
#   (rand(2..4).times do
#     Subscription.create!(user_id: users.sample.id,
#                          project_id: project.id)
#   end
# end

# # Create Brand Owners
# brands.each do |brand|
#   (rand(1..3).times do
#     Subscription.create!(user_id: users.sample.id,
#                          project_id: project.id)
#   end
# end
