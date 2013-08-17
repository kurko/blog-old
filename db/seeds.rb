# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  AdminUser.where(email: "admin@example.com").first_or_create(password: "123456")
end

Taxonomy::Persistence.where(name: "Personal").first_or_create
Taxonomy::Persistence.where(name: "Essays").first_or_create
Taxonomy::Persistence.where(name: "Software").first_or_create
