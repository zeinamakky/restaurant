# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tables = Table.create([ 
  {seats: 2}, 
  {seats: 4}, 
  {seats: 6},
  {seats: 2},
  {seats: 4},
  {seats: 6}
])