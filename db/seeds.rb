# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Todo.create({"date": Date.today - 1,"scheduled_at": Time.now,"task": "Wash clothes","status": "Completed"})
# Todo.create({"date": Date.today,"scheduled_at": Time.now,"task": "Coding practice","status": "In progress"})
# Todo.create({"date": Date.today,"scheduled_at": Time.now,"task": "Cook dinner","status": "Completed"})
# Todo.create({"date": 1.days.from_now,"scheduled_at": Time.now,"task": "Read dream board","status": "Not started"})
# Todo.create({"date": Date.today + 2,"scheduled_at": Time.now,"task": "Istiqfarr","status": "Not started"})
# Todo.create({"date": Date.today,"scheduled_at": Time.now,"task": "reading blogs","status": "Paused"})


# 5.times do
#         Client.create!(
#                 name: Faker::Name.name, phone_number: Faker::PhoneNumber.phone_number, 
#                 email: Faker::Internet.email, address: Faker::Address.city, user_id: 2
#         )
# end

# 3.times do
#         Client.create!(
#                 name: Faker::Name.name, phone_number: Faker::PhoneNumber.phone_number, 
#                 email: Faker::Internet.email, address: Faker::Address.city, user_id: 1
#         )
# end

client1 = Client.find(1)
client2 = Client.find(2)
client3 = Client.find(3)
client6 = Client.find(6)
client7 = Client.find(7)

# 1.times do
#         Project.create({
#                 name: 'Payroll System', due_date: Faker::Date.between(from: '2018-09-23', to: '2020-09-25'),client_name: client1.name, status: 'Active', description: '',
#                 client_id: client1.id, user_id: 2, amount: 250000.0, balance: 250000.0
#         })
# end

# 1.times do
#         Project.create({
#                 name: 'Expense Manager App', due_date: Faker::Date.between(from: '2018-09-23', to: '2020-09-25'),client_name: client1.name, status: 'Active', description: '',
#                 client_id: client1.id, user_id: 2, amount: 150000.0, balance: 150000.0
#         })
# end

# 1.times do
#         Project.create({
#                 name: 'Account tool', due_date: Faker::Date.between(from: '2018-09-23', to: '2020-09-25'),
#                 client_name: client2.name, status: 'Completed', description: '',client_id: client2.id, user_id: 2,
#                 amount: 50000.0, balance: 50000.0
#         })
# end

1.times do
        Project.create({
                name: 'Laundry Management System', due_date: Faker::Date.between(from: '2018-09-23', to: '2020-09-25'),
                client_name: client3.name,status: 'Active', description: '', client_id: client3.id, user_id: 1, amount: 150000.0, balance: 150000.0
        })
end

1.times do
        Project.create({
                name: 'website Creation', due_date: Faker::Date.between(from: '2018-09-23', to: '2020-09-25'),client_name: client6.name, status: 'Completed', description: '',
                client_id: client6.id, user_id: 1, amount: 150000.0, balance: 150000.0
        })
end

1.times do
        Project.create({
                name: 'Tailoring Mobile App', due_date: Faker::Date.between(from: '2018-09-23', to: '2020-09-25'),client_name: client7.name, status: 'Active', description: '',
                client_id: client7.id, user_id: 1, amount: 50000.0, balance: 50000.0
        })
end