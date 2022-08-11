# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "123123"
# Seed usuário ======================================================================================================
admin = User.new(name: "Admin Blog Nucleus", email: 'admin@droptoprint.com.br', password: PASSWORD, password_confirmation: '123123', user_type: 1)
puts admin.save ? "Admin criado." : "Erro ao criar \"admin\" #{admin.errors.full_messages}."

# Fake users
30.times do |i|
  user = User.create(
     name: Faker::Name.unique.name,
     email: Faker::Internet.email,
     password: PASSWORD,
     password_confirmation: PASSWORD
  )
  puts user.save ? "Usuário #{user.name} criado." : "Erro ao criar usuário \"comun\" #{user.errors.full_messages}."
end

# Seed Post =========================================================================================================
postAdm = Post.new(
  title: "First Post by Admin",
  body:  Faker::Lorem.sentence,
  user_id: 1
)
puts postAdm.save ? "Post de Admin criado." : "Erro ao criar \"Post de admin\" #{postAdm.errors.full_messages}."

postUser1 = Post.new(
  title: "First Post by User",
  body: Faker::Lorem.sentence,
  user_id: 2
 )
postUser2 = Post.new(
  title: "First Post by second User",
  body: Faker::Lorem.sentence,
  user_id: 3
)
postUser3 = Post.new(
  title: "First Post by second third",
  body: Faker::Lorem.sentence,
  user_id: 4
)
postUser4 = Post.new(
  title: "First Post by second fourth",
  body: Faker::Lorem.sentence,
  user_id: 5
)
puts postUser1.save && postUser2.save && postUser3.save && postUser4.save ? "Posts de Usuários criado." : "Erro ao criar \"Posts de usuários\"."
# ======================================================================================================================