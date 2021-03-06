puts "Starting"

Conversation.destroy_all
Lesson.destroy_all
Connection.destroy_all
TeacherSkill.destroy_all
Skill.destroy_all
Subject.destroy_all
User.destroy_all





adam = User.new(user_name: "Adam", email: "Adam@may.com",
  password: "123", password_confirmation: "123")
puts "User 1 confirmed" if adam.save
madeleine = User.new(user_name: "Madeleine", email: "madeleine@rose.com",
  password: "123", password_confirmation: "123")
puts "User 2 confirmed" if madeleine.save
ruchi = User.new(user_name: "Ruchi", email: "ruchi@ramani.com",
  password: "123", password_confirmation: "123")
puts "User 3 confirmed" if ruchi.save
andrew = User.new(user_name: "Andrew", email: "Andrew@STEWART.com",
  password: "123", password_confirmation: "123")
puts "User 4 confirmed" if andrew.save

design = Subject.new(name: "Design", description: "Learn how to design things using the latest software! Design everything from jewelery to to brand logos")
puts "Design Created" if design.save
finance = Subject.new(name: "Finance", description: "Learn all the latest finance software, and do your own damn taxes for once!")
puts "Finance Created" if finance.save
av = Subject.new(name: "Audio Visual", description: "Cutting edge audio visual editing software will now be a breeze for you with our amazing teachers!")
puts "Audio/Visual Created" if av.save
programming = Subject.new(name: "Programming", description: "Learn how to build stuff! And directly compete with Learn")
puts "Programming Created" if programming.save

#Design Skills
photoshop = Skill.new(name: "Adobe Photoshop", description: "Design graphics and make pictures pretty")
photoshop.subject = design
puts "Photoshop skill added" if photoshop.save
illustrator = Skill.new(name: "Adobe Illustrator", description: "Design websites and books")
illustrator.subject = design
puts "Illustrator skill added" if illustrator.save
andrew.skills << photoshop
andrew.skills << illustrator
andrew.save

#AV Skills
final_cut = Skill.new(name: "Final Cut Pro", description: "Edit Movies and add explosions! Be better than Michael Bay")
final_cut.subject = av
puts "Final Cut Pro skill added" if final_cut.save
pro_logic = Skill.new(name: "Pro Logic", description: "Edit Sounds, make things louder and softer and then louder again")
pro_logic.subject = av
puts "Pro Logic skill added" if pro_logic.save
adam.skills << final_cut
adam.skills << pro_logic
adam.save

#Finance Skills
turbo_tax = Skill.new(name: "Turbo Tax", description: "Learn to do your own damn taxes for once")
turbo_tax.subject = finance
puts "Turbo Tax skill added" if turbo_tax.save
quickbooks = Skill.new(name: "Quick Books", description: "Balance your checkbook, and live like a true Republican")
quickbooks.subject = finance
puts "Quick Books skill added" if quickbooks.save
ruchi.skills << turbo_tax
ruchi.skills << quickbooks
ruchi.save

#connections
adam_madeleine = Connection.new(teacher: adam, student: madeleine, approved: true)
puts "adam_madeleine connection added" if adam_madeleine.save
andrew_ruchi = Connection.new(teacher: andrew, student: ruchi, approved: true)
puts "andrew_ruchi connection added" if andrew_ruchi.save

#lessons
adam_final_cut = Lesson.new(connection: adam_madeleine, skill: final_cut, start_time: Time.now, end_time: Time.now + 1.hour)
puts "final_cut lesson added" if adam_final_cut.save
andrew_photoshop = Lesson.new(connection: andrew_ruchi, skill: photoshop, start_time: Time.now, end_time: Time.now + 1.hour)
puts "photoshop lesson added" if andrew_photoshop.save

Skill.reindex

puts "Ending"
