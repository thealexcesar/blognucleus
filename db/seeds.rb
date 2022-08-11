PASSWORD = "123123"
lorem_ipsum = "ontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical
 Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney
 College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and
 going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes
 from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero,
 written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.
 The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.

 The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32
 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form,
 accompanied by English versions from the 1914 translation by H. Rackham."

# Seed usuário ======================================================================================================
admin = User.new(name: "Admin Blog Nucleus", email: 'admin@droptoprint.com.br', password: PASSWORD, password_confirmation: PASSWORD, user_type: 1)
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
  title: "Post by Admin",
  body:  lorem_ipsum,
  user_id: 1
)
puts postAdm.save ? "Post de Admin criado." : "Erro ao criar \"Post de admin\" #{postAdm.errors.full_messages}."

postUser1 = Post.new(
  title: "Post by User",
  body: Faker::Lorem.sentence,
  user_id: 2
 )
postUser2 = Post.new(
  title: "Post by second User",
  body: Faker::Lorem.sentence,
  user_id: 3
)
postUser3 = Post.new(
  title: "Post by third user",
  body: Faker::Lorem.sentence,
  user_id: 4
)
postUser4 = Post.new(
  title: "Post by fourth user",
  body: Faker::Lorem.sentence,
  user_id: 5
)
puts postUser1.save && postUser2.save && postUser3.save && postUser4.save ? "Posts de Usuários criado." : "Erro ao criar \"Posts de usuários\"."
# ======================================================================================================================