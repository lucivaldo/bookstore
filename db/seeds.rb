# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Geração de autores"

10.times do
  created_at = Faker::Date.between(from: 1.month.ago, to: DateTime.current)
  updated_at = Faker::Date.between(from: created_at, to: DateTime.current)

  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Name.prefix,
    created_at:,
    updated_at:
  )
end

puts "Geração de fornecedores"

15.times do
  created_at = Faker::Date.between(from: 1.month.ago, to: DateTime.current)
  updated_at = Faker::Date.between(from: created_at, to: DateTime.current)

  Supplier.create(
    name: Faker::Company.name,
    created_at:,
    updated_at:
  )
end

puts "Geração de clientes"

30.times do
  created_at = Faker::Date.between(from: 1.month.ago, to: DateTime.current)
  updated_at = Faker::Date.between(from: created_at, to: DateTime.current)

  Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Name.prefix,
    email: Faker::Internet.email,
    visits: Faker::Number.between(from: 1, to: 100),
    orders_count: Faker::Number.between(from: 1, to: 20),
    lock_version: Faker::Number.between(from: 0, to: 10),
    created_at:,
    updated_at:
  )
end

puts "Geração de livros"

50.times do
  author = Author.order('RANDOM()').first
  supplier = Supplier.order('RANDOM()').first
  created_at = Faker::Date.between(from: 1.month.ago, to: DateTime.current)
  updated_at = Faker::Date.between(from: created_at, to: DateTime.current)

  Book.create(
    title: Faker::Book.title,
    year_published: Faker::Number.between(from: 1900, to: 2022),
    isbn: Faker::Code.unique.isbn,
    price: Faker::Commerce.price(range: 10..1000, as_string: false),
    out_of_print: Faker::Boolean.boolean(true_ratio: 0.2),
    views: Faker::Number.between(from: 1, to: 1000),
    author_id: author.id,
    supplier_id: supplier.id,
    created_at:,
    updated_at:
  )
end

puts "Geração de pedidos"

100.times do
  customer = Customer.order('RANDOM()').first
  created_at = Faker::Date.between(from: 1.month.ago, to: DateTime.current)
  updated_at = Faker::Date.between(from: created_at, to: DateTime.current)

  Order.create(
    date_submitted: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    status: Faker::Number.between(from: 0, to: 3),
    subtotal: Faker::Commerce.price(range: 10..1000, as_string: false),
    shipping: Faker::Commerce.price(range: 1..100, as_string: false),
    tax: Faker::Commerce.price(range: 1..100, as_string: false),
    total: Faker::Commerce.price(range: 100..2000, as_string: false),
    customer_id: customer.id,
    created_at:,
    updated_at:
  )
end

puts "Geração de avaliações"

100.times do
  customer = Customer.order('RANDOM()').first
  book = Book.order('RANDOM()').first
  created_at = Faker::Date.between(from: 1.month.ago, to: DateTime.current)
  updated_at = Faker::Date.between(from: created_at, to: DateTime.current)

  Review.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    rating: Faker::Number.between(from: 1, to: 5),
    state: Faker::Number.between(from: 0, to: 2),
    customer_id: customer.id,
    book_id: book.id,
    created_at:,
    updated_at:
  )
end
