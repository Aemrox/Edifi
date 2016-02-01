require "spec_helper"

describe Lesson do
  describe "test associations for the Lesson" do
    before do
      @adam = User.create(user_name: "Adam", email: "Adam@may.com",
        password: "123", password_confirmation: "123")
      @mdawg = User.new(user_name: "Madeleine", email: "madeleine@rose.com",
        password: "123", password_confirmation: "123")
      @programming = Subject.create(name: "Programming", description: "Build Cool Shit")
      @ruby = Skill.create(name: "Ruby", description: "It's Amazing")
      @mdawg.skills << @ruby
      @mdawg.save

      @connection = Connection.create(skill: @ruby, teacher: @mdawg, student: @adam)
      @lesson = Lesson.new(connection: @connection, start_time: Time.now, end_time: Time.now + 3600 )
    end

    it "can identify it's teacher" do
      expect(@lesson.connection.teacher).to equal(@mdawg)
    end

    it "can identify it's student" do
      expect(@lesson.connection.student).to equal(@adam)
    end
  end
  describe "Lesson has proper validations" do

    it "validates against schedule" do
      start_time = @lesson.start_time + 1000
      end_time = start_time + 3600
      @lesson2 = Lesson.new(connection: @connection, start_time: start_time, end_time: end_time)
      @lesson2.save
      expect(@lesson.valid?).to be_false
    end
  end
end
