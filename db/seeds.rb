puts "Starting"

adam = User.new(user_name: "Adam", email: "Adam@may.com",
  password: "123", password_confirmation: "123")
if adam.save {puts "User 1 confirmed"}
madeleine = User.new(user_name: "Madeleine", email: "madeleine@rose.com",
  password: "123", password_confirmation: "123")
if madeleine.save {puts "User 2 confirmed"}
ruchi = User.new(user_name: "Ruchi", email: "Ruchi@Ramanani.com",
  password: "123", password_confirmation: "123")
if ruchi.save {puts "User 3 confirmed"}
andrew = User.new(user_name: "Andrew", email: "Andrew@STEWART.com",
  password: "123", password_confirmation: "123")
if andrew.save {puts "User 4 confirmed"}


design = Subject.new(name: "Design", decription: "Learn how to design stuff!")
puts "Design Created" if design.save
finance = Subject.new(name: "Finance", decription: "Learn how to finance stuff!")
puts "Finance Created" if finance.save

photoshop = Skill.new(name: "Adobe Photoshop", description: "Design graphics and make pictures pretty")
photoshop.subject = design
photoshop.


puts "Ending"
