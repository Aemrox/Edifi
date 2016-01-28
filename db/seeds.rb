puts "Starting"

adam = User.new(user_name: "Adam", email: "Adam@may.com",
  password: "123", password_confirmation: "123")
puts "User 1 confirmed" if adam.save
madeleine = User.new(user_name: "Madeleine", email: "madeleine@rose.com",
  password: "123", password_confirmation: "123")
puts "User 2 confirmed" if madeleine.save
ruchi = User.new(user_name: "Ruchi", email: "Ruchi@Ramanani.com",
  password: "123", password_confirmation: "123")
puts "User 3 confirmed" if ruchi.save
andrew = User.new(user_name: "Andrew", email: "Andrew@STEWART.com",
  password: "123", password_confirmation: "123")
puts "User 4 confirmed" if andrew.save


design = Subject.new(name: "Design", description: "Learn how to design stuff!")
puts "Design Created" if design.save
finance = Subject.new(name: "Finance", description: "Learn how to finance stuff!")
puts "Finance Created" if finance.save
av = Subject.new(name: "Audio Visual", description: "Learn how to edit stuff!")
puts "Audio/Visual Created" if av.save

#Design Skills
photoshop = andrew.skills.new(name: "Adobe Photoshop", description: "Design graphics and make pictures pretty")
photoshop.subject = design
puts "Photoshop skill added" if photoshop.save
illustrator = andrew.skills.new(name: "Adobe Illustrator", description: "Design website and books")
illustrator.subject = design
puts "Illustrator skill added" if illustrator.save

#AV Skills
final_cut = adam.skills.new(name: "Final Cut Pro", description: "Edit Movies!")
final_cut.subject = av
puts "Final Cut Pro skill added" if final_cut.save
pro_logic = adam.skills.new(name: "Pro Logic", description: "Edit Sounds")
pro_logic.subject = design
puts "Pro Logic skill added" if pro_logic.save

#Finance Skills
turbo_tax = ruchi.skills.new(name: "Turbo Tax", description: "Learn to do your")
turbo_tax.subject = av
puts "Turbo Tax skill added" if turbo_tax.save
quickbooks = ruchi.skills.new(name: "Quick Books", description: "Learn how to balance your checkbook")
quickbooks.subject = av
puts "Quick Books skill added" if quickbooks.save


puts "Ending"
