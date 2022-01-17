# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
inventories_list = [
    ["Hoodies", "Toronto", 40, DateTime.new(2021,12,29)],
    ["Jeans", "Toronto", 30, DateTime.new(2022,01,12)],
    ["Crewnecks", "Montreal", 200, DateTime.new(2022,01,01)],
    ["T-Shirts","Vancouver", 300, DateTime.new(2022,01,02)],
    ["Jackets", "Vancouver", 10, DateTime.new(2021,12,21)]
]

inventories_list.each do | name, location, quantity, date |
    Inventory.create(item_name: name, location_type: location, quantity: quantity, date_added: date)
end