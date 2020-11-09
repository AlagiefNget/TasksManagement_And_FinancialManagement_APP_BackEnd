# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.create({"date": Date.today - 1,"scheduled_at": Time.now,"task": "Wash clothes","status": "Completed"})
Todo.create({"date": Date.today,"scheduled_at": Time.now,"task": "Coding practice","status": "In progress"})
Todo.create({"date": Date.today,"scheduled_at": Time.now,"task": "Cook dinner","status": "Completed"})
Todo.create({"date": 1.days.from_now,"scheduled_at": Time.now,"task": "Read dream board","status": "Not started"})
Todo.create({"date": Date.today + 2,"scheduled_at": Time.now,"task": "Istiqfarr","status": "Not started"})
Todo.create({"date": Date.today,"scheduled_at": Time.now,"task": "reading blogs","status": "Paused"})


