# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.delete_all
Post.delete_all
Comment.delete_all

# Crear usuarios
10.times do |i|
  User.create!(
    email: "user#{i}@example.com",
    first_name: "FirstName#{i}",
    last_name: "LastName#{i}"
  )
end

# Crear posts
10.times do |i|
  Post.create!(
    title: "Post Title #{i}",
    content: "This is the content of post number #{i}. " * 10,
    published: [0, 1].sample,
    author: User.all.sample.email
  )
end

# Crear comentarios
10.times do |i|
  Comment.create!(
    content: "This is the content of comment number #{i}.",
    author: User.all.sample.email
  )
end