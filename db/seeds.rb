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
photoshop = Skill.new(name: "Adobe Photoshop", description: "Design graphics and make pictures pretty")
photoshop.subject = design
puts "Photoshop skill added" if photoshop.save
illustrator = Skill.new(name: "Adobe Illustrator", description: "Design website and books")
# binding.pr
illustrator.subject = design
puts "Illustrator skill added" if illustrator.save
andrew.skills << photoshop
andrew.skills << illustrator
andrew.save

#AV Skills
final_cut = Skill.new(name: "Final Cut Pro", description: "Edit Movies!")
final_cut.subject = av
puts "Final Cut Pro skill added" if final_cut.save
pro_logic = Skill.new(name: "Pro Logic", description: "Edit Sounds")
pro_logic.subject = av
puts "Pro Logic skill added" if pro_logic.save
adam.skills << final_cut
adam.skills << pro_logic
adam.save

#Finance Skills
turbo_tax = Skill.new(name: "Turbo Tax", description: "Learn to do your")
turbo_tax.subject = finance
puts "Turbo Tax skill added" if turbo_tax.save
quickbooks = Skill.new(name: "Quick Books", description: "Learn how to balance your checkbook")
quickbooks.subject = finance
puts "Quick Books skill added" if quickbooks.save
ruchi.skills << turbo_tax
ruchi.skills << quickbooks
ruchi.save
Skill.reindex

puts "Ending"
