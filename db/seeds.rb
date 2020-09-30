# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
width_array = [["30mm", 30], ["35mm", 35], ["40mm", 40], ["45mm", 45], ["50mm", 50], ["55mm", 55], ["60mm", 60], ["65mm", 65], ["70mm", 70], ["75mm", 75], ["80mm", 80], ["85mm", 85], ["90mm", 90]]
5.times do
    Worker.create!(name: Faker::Name.name)
end
50.times do
    Customer.create!(name: Faker::Name.name)
end
1000.times do
date = Faker::Date.between(from: '2015-09-25', to: '2020-10-10')
deliver_date = Faker::Date.between(from: date + 1.days, to: '2020-12-20')
@customer = Customer.find(Faker::Number.between(from: 1, to: Customer.count))
Gt.create!(order_date: date, deliver_date: deliver_date, customer_id: @customer.id, customer_name: @customer.name, ref_num: Faker::Number.number(digits: 10),
          length: Faker::Number.number(digits: 2), degree: Faker::Number.number(digits: 2), amount: Faker::Number.number(digits: 3), width: width_array[Faker::Number.between(from: 0, to: 12)][1], rivet: Faker::Boolean.boolean,
          under_steel: Faker::Boolean.boolean, precut_gt: Faker::Boolean.boolean, precut_extra_steel: Faker::Number.number(digits: 2),
          etching: "Standard", pipe: Faker::Boolean.boolean, packing: Faker::Boolean.boolean, gt_tool: Faker::Boolean.boolean, gt_flexo: Faker::Boolean.boolean,
          gt_engraving: Faker::Boolean.boolean, worker_id: Faker::Number.between(from: 1, to: 5), approver_id: Faker::Number.between(from: 1, to: 5), priority: Faker::Number.between(from: 1, to: 3),
          under_bool: Faker::Boolean.boolean, precut_gt_bool: Faker::Boolean.boolean, precut_extra_bool: Faker::Boolean.boolean)
end