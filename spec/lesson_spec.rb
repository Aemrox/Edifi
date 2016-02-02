require "spec_helper"

describe Lesson do
  before(:each) do
    User.destroy_all
    Subject.destroy_all
    Skill.destroy_all
    Connection.destroy_all
    Lesson.destroy_all
    @adam = User.create(user_name: "Adam", email: "Adam@may.com",
      password: "123", password_confirmation: "123")
    @mdawg = User.create(user_name: "Madeleine", email: "madeleine@rose.com",
      password: "123", password_confirmation: "123")
    @programming = Subject.create(name: "Programming", description: "Build Cool Shit")
    @ruby = Skill.create(name: "Ruby", description: "It's Amazing")
    @mdawg.skills << @ruby
    @mdawg.save

    @connection = Connection.create(skill: @ruby, teacher: @mdawg, student: @adam)
    @lesson = Lesson.new(connection: @connection, start_time: Time.now, end_time: Time.now + 3600, approved: true )
  end
  describe "test associations for the Lesson, " do

    it "can identify it's teacher" do
      expect(@lesson.connection.teacher).to equal(@mdawg)
    end

    it "can identify it's student" do
      expect(@lesson.connection.student).to equal(@adam)
    end

    it "student is aware of it's lessons" do
      @lesson.save
      @adam.save
      # binding.pry
      expect(@adam.lessons).to include(@lesson)
    end

    it "teacher is aware of it's appointments" do
      @lesson.save
      @mdawg.save
      expect(@mdawg.appointments).to include(@lesson)
    end
  end
  describe "Lesson has proper validations" do

    it "validates against schedule" do
      @lesson.save
      start_time = @lesson.start_time + 1000
      end_time = start_time + 3600
      @lesson2 = Lesson.new(connection: @connection, start_time: start_time, end_time: end_time)
      expect(@lesson2.valid?).to be false
    end
  end
end
