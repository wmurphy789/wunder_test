# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ContestType.seed(:name) do |s|
  s.name = 'Strength Test'
end

ContestType.seed(:name) do |s|
  s.name = 'Intelligence Test'
end
