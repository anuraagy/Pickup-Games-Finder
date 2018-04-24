user_params = {
    :name               => "Anuraag Yachamaneni", 
    :email              => "ayachama@purdue.edu", 
    :password           => "password",
    :uname              => "anuraagy"
  }

user = User.create(user_params)

5.times do |index|  
  game_params = {
    :title               => "Game #{index}", 
    :description         => Faker::Lorem.paragraph, 
    :creator_id          => 1,
    :address             => "#{Faker::Address.street_address} #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.zip}",
    :team_one_name       => Faker::Team.name,
    :team_two_name       => Faker::Team.name,
    :team_one_score      => rand(0..100),
    :team_two_score      => rand(0..100),
    :start_time          => Time.now.tomorrow,
    :latitude            => rand(30.50139...64.85694),
    :longitude           => rand(-115.75583..-80.01197)
  }

  Game.create(game_params)
end