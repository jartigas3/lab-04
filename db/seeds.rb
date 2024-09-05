# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Comment.delete_all
Post.delete_all
User.delete_all



# Crear usuarios
10.times do |i|
  User.create!(
    email: "soy#{i}@jmail.com",
    first_name: "Pedro#{i}",
    last_name: "Moler#{i}"
  )
end

# Crear posts
10.times do |i|
  Post.create!(
    title: "Comida de ayer #{i}",
    content: "Ayer me comí un pan con mantequilla y jamón. Estaba muy rico :D #{i}. " * 10,
    published: [0, 1].sample,
    author: User.all.sample.email
  )
end

# Crear comentarios para cada post
Post.all.each do |post|
  3.times do |i|
    Comment.create!(
      content: "Cállate, a ti nadie te quiere. D: #{i + 1} para el post #{post.title}.",
      author: User.all.sample.email,
      post_id: post.id  
    )
  end
end
