PASS = "123123"
admin = User.new(
  name: "Admin",
  email: 'admin@droptoprint.com.br',
  password: PASS,
  password_confirmation: PASS,
  user_type: 1
)
puts admin.save ? "Admin criado." : "Erro ao criar \"admin\" #{admin.errors.full_messages}."

# Check: lib/tasks/create.rake
puts "Criar Usuários e Posts: $ rails create:user create:post"

