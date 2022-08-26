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
    categories = ["Gráfica","Tecnologia","Financeiro","Cultura"]
    15.times do |i|
      post = Post.find_or_create_by!(
        title: Faker::Lorem.sentence(nb=3),
        body: Faker::Lorem.sentence(nb=300),
        user_id: rand(1..13),
        status: rand(0..1),
        category: categories[rand(0..3)],
        top: rand(1..5)
      )
      puts post.save ? "Post ID:#{post.id} criado." : "Erro ao criar post: #{post.errors.full_messages}."
    end
  end
end