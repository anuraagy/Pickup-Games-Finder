100.times do |index|
  user_params = {
    :name               => Faker::Name.unique.name, 
    :email              => Faker::Internet.unique.email, 
    :password           => "password",
    :uname              => SecureRandom.urlsafe_base64(24),
  }

  user = User.create!(user_params)

  game_params = {
    :title               => Faker::Name.unique.name, 
    :description         => Faker::Internet.unique.email, 
    :creator_id          => 1,
    :address             => "#{Faker::Address.street_address} #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.zip}",
    :team_one_name       => Faker::Team.name,
    :team_two_name       => Faker::Team.name,
    :team_one_score      => rand(0..100),
    :team_two_score      => rand(0..100),
    :start_time          => Time.now.tomorrow,
    :latitude            => Faker::Address.latitude,
    :longitude           => Faker::Address.longitude
  }

  Game.create(game_params)
end