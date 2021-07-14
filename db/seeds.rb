# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Garden.destroy_all
Vegetable.destroy_all

@garden_1 = Garden.create!(created_at: '15-05-2021', name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
@garden_2 = Garden.create!(created_at: '03-05-2021', name: 'Shears Garden', weeded: true, hrs_of_sun: 10)
@garden_3 = Garden.create!(created_at: '13-05-2021', name: 'Maupin Garden', weeded: true, hrs_of_sun: 15)
@garden_4 = Garden.create!(created_at: '08-05-2021', name: 'Turing Garden', weeded: false, hrs_of_sun: 8)
@garden_5 = Garden.create!(created_at: '01-05-2021', name: '32nd Street Garden', weeded: true, hrs_of_sun: 12)
@garden_6 = Garden.create!(created_at: '23-05-2021', name: 'Perrine Street Garden', weeded: false, hrs_of_sun: 10)

@tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: false, min_hrs_sun: 8)
@onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: false, min_hrs_sun: 14)
@potato_1 = @garden_1.vegetables.create!(name: 'Yukon Gold', perennial: true, min_hrs_sun: 10)


@tomato_2 = @garden_2.vegetables.create!(name: 'Cherry Tomato', perennial: false, min_hrs_sun: 8)
@onion_2 = @garden_2.vegetables.create!(name: 'Red Onion', perennial: true, min_hrs_sun: 12)
@berry_2 = @garden_2.vegetables.create!(name: 'Raspberry', perennial: true, min_hrs_sun: 8)

@berry_3 = @garden_3.vegetables.create!(name: 'Strawberry', perennial: true, min_hrs_sun: 14)
@asparugus_3 = @garden_3.vegetables.create!(name: 'Asparugus', perennial: true, min_hrs_sun: 10)
@kale_3 = @garden_3.vegetables.create!(name: 'Kale', perennial: true, min_hrs_sun: 8)

@onion_4 = @garden_4.vegetables.create!(name: 'Sweet Yellow Onion', perennial: false, min_hrs_sun: 10)
@tomato_4 = @garden_4.vegetables.create!(name: 'Cherokee Purple', perennial: false, min_hrs_sun: 8)
@spinich_4 = @garden_4.vegetables.create!(name: 'Spinich', perennial: true, min_hrs_sun: 8)

@Strawberry_5 = @garden_5.vegetables.create!(name: 'Strawberry', perennial: true, min_hrs_sun: 12)
@raspberry_5 = @garden_5.vegetables.create!(name: 'Raspberry', perennial: true, min_hrs_sun: 12)
@blueberry_5 = @garden_5.vegetables.create!(name: 'Blueberry', perennial: true, min_hrs_sun: 12)

@tomato_6 = @garden_6.vegetables.create!(name: 'Cherokee Purple', perennial: false, min_hrs_sun: 10)
@cherry_tomato_6 = @garden_6.vegetables.create!(name: 'Cherry Tomato', perennial: false, min_hrs_sun: 10)
@basil_6 = @garden_6.vegetables.create!(name: 'Basil', perennial: false, min_hrs_sun: 8)
