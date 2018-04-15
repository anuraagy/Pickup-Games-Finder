1000.times do |index|
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
    :creator_id          => user.id,
    :address             => Faker::Address.zip,
    :team_one_name       => Faker::Team.name,
    :team_two_name       => Faker::Team.name,
    :team_one_score      => rand(0..100),
    :team_two_score      => rand(0..100),
    :start_time          => Time.now.tomorrow
  }

  Game.create!(game_params)
end