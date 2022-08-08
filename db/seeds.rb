# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Criando usuário ======================================================================================================
admin = User.new(name: "Alex", email: 'admin@droptoprint.com.br', password: '123123', password_confirmation: '123123', user_type: 1)
puts admin.save ? "Admin criado." : "Erro ao criar \"admin\" #{admin.errors.full_messages}."

user = User.new(name: "Ana", email: 'user@droptoprint.com.br', password: '123123', password_confirmation: '123123')
puts user.save ? "Usuário criado." : "Erro ao criar usuário \"comun\" #{user.errors.full_messages}."
# Criando Post =========================================================================================================
postAdm = Post.new(
  title: "First Post by Admin",
  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
    industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and
    scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap
    into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the
    release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing
    software like Aldus PageMaker including versions of Lorem Ipsum.",
  user_id: 1
)
puts postAdm.save ? "Post de Admin criado." : "Erro ao criar \"Post de admin\" #{postAdm.errors.full_messages}."

postUsr = Post.new(
  title: "First Post by User",
  body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
    industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and
    scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap
    into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the
    release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing
    software like Aldus PageMaker including versions of Lorem Ipsum.",
  user_id: 2
 )
puts postUsr.save ? "Post de Usuário criado." : "Erro ao criar \"Post de usuário\" #{postUsr.errors.full_messages}."
# ======================================================================================================================