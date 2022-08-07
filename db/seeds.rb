# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new(name: "Admin", email: 'admin@nucleus.com.br', password: '123123', password_confirmation: '123123', user_type: 1)
puts admin.save ? "admin criado." : "Erro ao criar adminreload #{admin.errors.full_messages}"