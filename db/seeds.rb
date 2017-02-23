# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: 'admin@docnect.com', user_group: 0, name: 'Julian (Super User)', password: 'password', password_confirmation: 'password', activated: true, activated_at: Time.zone.now)
User.create!(email: 'doctor@docnect.com', user_group: 2, name: 'Test Doctor', password: 'password', password_confirmation: 'password', activated: true, activated_at: Time.zone.now, specialization: 'Specialized in Testing', phone: '00000 000000', address: 'University of Warwick, Coventry, Warwickshire', bio: '')
User.create!(email: 'patient@docnect.com', user_group: 1, name: 'Test Patient', password: 'password', password_confirmation: 'password', activated: true, activated_at: Time.zone.now, dob: Time.zone.now, nationality: 'English', marital_status: 'Single', occupation: 'Student', hobbies: 'Computer Science, building & testing Docnect!', languages: 'English', height: 185, weight: 69.5, allergies: 'None.', smoke: 'No, never.', alcohol: 'Yes, a few pints several times a week.', tattoos: 'No, none.', history: 'Operation on my X back in YYYY, no further issues.', medication: 'No, none to note.', drugs: false, illness: 'None.')