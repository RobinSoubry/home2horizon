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
                  location: "Corsica, France",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/46076_590917034259217_1331710102_n.jpg?oh=645bfd77224fb5adee59140704402246&oe=57C88B98",
                  cover_img_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/1170784_722532904430962_73177735_n.jpg?oh=9daf187a85308c9e308cac9fdb7496e3&oe=57DA2296",
                  facebook_url: "https://www.facebook.com/corsicat.360",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

socotra = Project.new(project_name: "Socotra, The forgotten Island",
                  project_description: "Paragliding in on the forgotten island of Socotra",
                  tags: ["Paragliding","Yemen","Socotra","Remote","Adventure"],
                  location: "Socotra, Yemen",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/10622784_625164854265257_3194957668341073425_n.jpg?oh=64febaf5357603dad470a624eda656e4&oe=57CEB725",
                  cover_img_url: "https://s-media-cache-ak0.pinimg.com/564x/65/e0/a2/65e0a2a25ea588592a8c6847ae225645.jpg",
                  facebook_url: "https://www.facebook.com/Socotra-Island-paragliding-surfing-292182224230190/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

mongul_rally = Project.new(project_name: "Mongol Rally -Team TLP",
                  project_description: "Rally from Brussels to Mongolia",
                  tags: ["Rally","Race","Mongolia","Transasia","Travel"],
                  location: "Mongolia",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11692801_1617744951827007_81233844116250992_n.jpg?oh=64ef7b22a4d24a9fd444c0e54174b775&oe=57C28744",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 0
                  )

talisker = Project.new(project_name: "Talisker Whiskey Atlantic Challenge",
                  project_description: "The Talisker Whisky Atlantic Challenge is billed as the world's toughest rowing race.",
                  tags: ["Rally","Race","Transatlantic","Rowing"],
                  location: "Atlatic Ocean",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "http://ichef.bbci.co.uk/news/624/media/images/72474000/jpg/_72474788_1557678_501084753343163_1371455338_n.jpg",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

kayak_blind = Project.new(project_name: "Kayaking Blind",
                  project_description: "277 Miles of kayaking blind. 1 Million Barriers broken",
                  tags: ["Rally","Race","Transatlantic","Rowing"],
                  location: "Grand Canyon, United States",
                  website_url: "http://kayakingblind.nobarriersnetwork.org/",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "http://ichef.bbci.co.uk/news/624/media/images/72474000/jpg/_72474788_1557678_501084753343163_1371455338_n.jpg",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

qajaqtuqtut = Project.new(project_name: "Qajaqtuqtut - Traditional kayaking",
                  project_description: "Qajaqtuqtut” is an expedition that combines history, culture, and adventure.
                                        Our team will build traditional Inuit kayaks, and put them to the test on a two month long expedition.
                                        'Qajaqtuqtut' is an Inuit word, meaning they kayak.
                                        Kayaking traditions in northern Canada, extend back over 4,000 years, but have been in serious decline during the past century.
                                        Our aim is to learn and document the skills of traditional kayak building in the hopes of aiding the revival of this diminishing tradition.
                                        Working closely with young people in Nunavut, we will handcraft our kayaks in an open forum allowing for interactive workshops and hands-on learning for the local community.
                                        Once our kayaks are constructed, the adventure will begin.
                                        We will put our newly built boats to the test and embark on a 1,000 km journey across the 5th largest island in the world; Baffin.
                                        Setting out in 24 hour sunlight from Qikiqtarjuaq we will travel through Auyuittuq National Park, home of the worlds tallest uninterrupted cliff face.
                                        From here, our team will follow traditional hunting routes linking lakes and wild rivers through the interior of Baffin Island leading us back to the Arctic Ocean, and eventually to the small hamlet of Cape Dorset.

                                        Shifting sea ice, tides, polar bears, and the harsh arctic environment will put our team and our handcrafted traditional kayaks to the ultimate test.",
                  tags: ["Traditions","Expedition","Kayaking","Canada"],
                  location: "Baffin, Canada",
                  website_url: "http://www.pittarak.com/",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "http://ichef.bbci.co.uk/news/624/media/images/72474000/jpg/_72474788_1557678_501084753343163_1371455338_n.jpg",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

hanuman_airlines = Project.new(project_name: "Hanuman Airlines",
                  project_description: "From summit to sea: 2 Nepali sherpa's climb the Mount Everest with a paraglide and kayak the ganges down to the Indian Ocean",
                  tags: ["Expedition","Kayak","Mt Everest","Paragliding"],
                  location: "Mount Everest",
                  website_url: "http://www.theultimatedescent.com/",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "http://ichef.bbci.co.uk/news/624/media/images/72474000/jpg/_72474788_1557678_501084753343163_1371455338_n.jpg",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

projects = [corsicat, socotra, mongul_rally, talisker, kayak_blind, qajaqtuqtut, hanuman_airlines]

# Populate projects with team members
corsicat_ids = [1,2,3,4,5,6]
corsicat.users << User.find(corsicat_ids)

socotra_ids = [1,23,35,46,59,61]
socotra.users << User.find(socotra_ids)

mongul_ids = [13,21,36,41,51,1]
mongul_rally.users << User.find(mongul_ids)

talisker_ids = [15,21,1]
talisker.users << User.find(talisker_ids)

kayak_blind_ids = [45, 21, 9]
kayak_blind.users << User.find(kayak_blind_ids)

qajaqtuqtut_ids = [5, 51, 17, 18]
qajaqtuqtut.users << User.find(qajaqtuqtut_ids)

hanuman_airlines_ids = [7, 11]
hanuman_airlines.users << User.find(hanuman_airlines_ids)

# Save projects
corsicat.save
socotra.save
mongul_rally.save
talisker.save
kayak_blind.save
qajaqtuqtut.save
hanuman_airlines.save

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
50.times do
  Request.create(
    brand_id: rand(1..brands.length),
    project_id: rand(1..projects.length),
    special_note: "I'm in test",
    status: rand(0..1)
    )
end
