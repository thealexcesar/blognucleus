namespace :create do
  # ====================================================================================================================
  desc "Seed users"
  task user: :environment do
    PASSWORD = "123123"
    12.times do |i|
      user = User.create(
        name: Faker::Name.unique.name,
        email: Faker::Internet.email,
        password: PASSWORD,
        password_confirmation: PASSWORD
      )
      puts user.save ? "Usuário #{user.name} criado." : "Erro ao criar usuário \"comun\" #{user.errors.full_messages}."
    end
  end
  # ====================================================================================================================
  desc "Seed Post"
  task post: :environment do
    fake_title = Faker::Lorem.sentence(nb=3)
    fake_body = Faker::Lorem.sentence(nb=300)
    12.times do |i|
      posts = Post.create(
        title: fake_title,
        body: fake_body,
        user_id: rand(1..13),
        status: rand(0..1),
        top: rand(1..10)
      )
      posts.save ? "Post criado com sucesso." : "Erro ao criar post: #{posts.errors.full_messages}."
    end
  end
end