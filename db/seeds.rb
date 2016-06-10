require 'faker'

User.delete_all
Brand.delete_all
Project.delete_all
Plea.delete_all
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
                  cover_img_url: "/assets/projects/hh_corsicat.jpg",
                  facebook_url: "https://www.facebook.com/corsicat.360",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

socotra = Project.new(project_name: "Socotra, The forgotten Island",
                  project_description: "Paragliding in on the forgotten island of Socotra",
                  tags: ["Paragliding","Yemen","Socotra","Remote","Adventure"],
                  lat: 12.492308,
                  lng: 53.823677,
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
                  lat: 47.207093,
                  lng: 95.660595,
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "/assets/projects/hh_mongul_race.jpg",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 0
                  )

talisker = Project.new(project_name: "Talisker Whiskey Atlantic Challenge",
                  project_description: "The Talisker Whisky Atlantic Challenge is billed as the world's toughest rowing race.",
                  tags: ["Rally","Race","Transatlantic","Rowing"],
                  lat: 19.952900,
                  lng: -38.677790,
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "/assets/projects/hh_talisker.jpg",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

kayak_blind = Project.new(project_name: "Kayaking Blind",
                  project_description: "277 Miles of kayaking blind. 1 Million Barriers broken",
                  tags: ["Rally","Race","Transatlantic","Rowing"],
                  lat: 36.091090,
                  lng: -112.062067,
                  website_url: "http://kayakingblind.nobarriersnetwork.org/",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "/assets/projects/hh_kayak_blind.jpg",
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
                  lat: 65.936975,
                  lng: -70.987937,
                  website_url: "http://www.pittarak.com/",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "/assets/projects/hh_qajaqtuqtut.jpg",
                  facebook_url: "https://www.facebook.com/mongolrallytlp/",
                  target_audience: "Many fans of your brand",
                  sponsorship_format: "We are looking equipment or financial aid",
                  status: 1
                  )

hanuman_airlines = Project.new(project_name: "Hanuman Airlines - The ultimate descent",
                  project_description: "From summit to sea: 2 Nepali sherpa's climb the Mount Everest with a paraglide and kayak the ganges down to the Indian Ocean",
                  tags: ["Expedition","Kayak","Mt Everest","Paragliding"],
                  lat: 27.987925,
                  lng: 86.924425,
                  website_url: "http://www.theultimatedescent.com/",
                  logo_url: "https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/11667376_1617745395160296_6159456086922707907_n.jpg?oh=aa35f70a53eb17bec5c054955cbb0035&oe=57D62F12",
                  cover_img_url: "/assets/projects/hh_hanuman_airlines.jpg",
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
brands = []
brands_h = {
  "The North Face" => "assets/logos/hh_the_north_face.png",
  "Marmot" => "assets/logos/hh_marmot.png",
  "Ice Breaker" => "assets/logos/hh_icebreaker.png",
  "Patagonia" => "assets/logos/hh_patagonia.png",
  "Petzl" => "assets/logos/hh_petzl.png",
  "Salomon" => "assets/logos/hh_salomon.png",
  "Sea To Summit" => "assets/logos/hh_sea_to_summit.png",
  "Cliff" => "assets/logos/hh_cliff.png",
  "Merell" => "assets/logos/hh_merrell.png",
  "Outdoor Research" => "assets/logos/hh_outdoor_research.png",
  "Millet" => "assets/logos/hh_millet.png",
  "Helly Hansen" => "assets/logos/hh_helly_hansen.png",
  "Smartwool" => "assets/logos/hh_smartwool.png",
  "Garmin" => "assets/logos/hh_garmin.png",
  "GoPro" => "assets/logos/hh_gopro.png",
  "Fitbit" => "assets/logos/hh_fitbit.png"
}

brands_h.each do |brandname, logo_path|
    brands << Brand.new(
      :brand_name => brandname,
      :logo => logo_path,
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

# Create Pleas
50.times do
  Plea.create(
    brand_id: rand(1..brands.length),
    project_id: rand(1..projects.length),
    special_note: "I'm in test",
    status: rand(0..1)
    )
end
