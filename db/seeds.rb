require 'faker'

User.delete_all
Brand.delete_all
Project.delete_all
Request.delete_all
Like.delete_all


# Create Users
seed_users = 75.times.map do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  sports = ["Climbing", "Sailing", "Snowboarding", "Paragliding", "Scuba Diving", "Kiteboarding", "Traveling", "Kayaking"]

  User.create!( :first_name => first_name,
                :last_name  => last_name,
                :email      => "#{first_name}.#{last_name}@gmail.com",
                :username   => "#{first_name}#{last_name}",
                :password   => '123',
                :personal_description => "Hi, my name is #{first_name} #{last_name} and I like #{sports.sample}",
                :profile_pic_url => Faker::Avatar.image
                )
end

# Create Projects
corsicat = Project.new(project_name: "CorsiCat",
                  project_description: "Circumnavigation of Corsica: 750 Miles of sailing with an 18' Hobiecat Tiger",
                  tags: ["Sailing","Catamaran","Corsica","France","Hobiecat"],
                  lat: 42.142527,
                  lng: 9.115410,
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/46076_590917034259217_1331710102_n.jpg?oh=645bfd77224fb5adee59140704402246&oe=57C88B98",
                  cover_img_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/1170784_722532904430962_73177735_n.jpg?oh=9daf187a85308c9e308cac9fdb7496e3&oe=57DA2296",
                  facebook_url: "https://www.facebook.com/corsicat.360"
                  )

socotra = Project.new(project_name: "Socotra, The forgotten Island",
                  project_description: "Paragliding in on the forgotten island of Socotra",
                  tags: ["Paragliding","Yemen","Socotra","Remote","Adventure"],
                  lat: 12.492308,
                  lng: 53.823677,
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/10622784_625164854265257_3194957668341073425_n.jpg?oh=64febaf5357603dad470a624eda656e4&oe=57CEB725",
                  cover_img_url: "https://s-media-cache-ak0.pinimg.com/564x/65/e0/a2/65e0a2a25ea588592a8c6847ae225645.jpg",
                  facebook_url: "https://www.facebook.com/Socotra-Island-paragliding-surfing-292182224230190/"
                  )

mongul_rally = Project.new(project_name: "Mongol Rally -Team TLP",
                  project_description: "Rally from Brussels to Mongolia",
                  tags: ["Rally","Race","Mongolia","Transasia","Travel"],
                  lat: 47.207093,
                  lng: 95.660595,
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11692801_1617744951827007_81233844116250992_n.jpg?oh=64ef7b22a4d24a9fd444c0e54174b775&oe=57C28744",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/"
                  )

talisker = Project.new(project_name: "Talisker Whiskey Atlantic Challenge",
                  project_description: "The Talisker Whisky Atlantic Challenge is billed as the world's toughest rowing race.",
                  tags: ["Rally","Race","Transatlantic","Rowing"],
                  lat: 29.322933,
                  lng: -40.854755,
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "http://ichef.bbci.co.uk/news/624/media/images/72474000/jpg/_72474788_1557678_501084753343163_1371455338_n.jpg",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/"
                  )

projects = [corsicat, socotra, mongul_rally, talisker]

# Populate projects with team members
corsicat_ids = [1,2,3,4,5,6]
corsicat.users << User.find(corsicat_ids)

socotra_ids = [11,23,35,46,59,61]
socotra.users << User.find(socotra_ids)

mongul_ids = [13,21,36,41,51,1]
mongul_rally.users << User.find(mongul_ids)

talisker_ids = [15,21]
talisker.users << User.find(talisker_ids)

# Save projects
corsicat.save
socotra.save
mongul_rally.save
talisker.save

# Create Brands
brands = ["The North Face", "Marmot ", "Ice Breaker", "Patagonia",
 "Petzl", "Salomon", "Sea To Summit", "Clif", "Merell", "Outdoor Research",
 "Millet", "Helly Hansen", "Ortlieb", "Smartwool", "Garmin", "GoPro", "Fitbit"].map do |name|
  Brand.new(:brand_name            => name,
                :brand_description   => Faker::Lorem.paragraph,
                :sponsorship_rules   => Faker::Lorem.paragraph)
end

# Create Brand Owners
brands.each do |brand|
  rand(1..3).times do
    brand.users << seed_users.sample
    brand.save
  end
end

# Create Requests
20.times do
  Request.create(
    brand_id: rand(1..brands.length),
    project_id: rand(1..projects.length),
    special_note: "I'm in test",
    status: rand(0..1)
    )
end
