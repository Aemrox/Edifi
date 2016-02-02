class Scheduler

  def self.top_five_options(params, connection)
    options = self.parsed_params(params)
    lesson_array = self.generate_time_slots(options[:date], options[:length], connection)
    lesson_array = self.remove_conflicts(lesson_array)
    lesson_array = self.sort_by_time_choice(options[:requested_time],lesson_array)
    lesson_array[0..4]
  end

  private
  def self.sort_by_time_choice(requested_slot, lesson_array)
    lesson_array.sort_by{|lesson| (lesson.start_time - requested_slot).abs}
  end

  def self.random_sample(lesson_array, slot)
    new_array = [lesson_array[0]]
    new_array << lesson_array[-1]
    new_array << lesson_array.find{|lesson| lesson.start_time == slot}
  end

  def self.remove_conflicts(lesson_array)
    lesson_array.reject{|lesson| !lesson.valid?}
  end

  def self.generate_time_slots(date, length, connection)
    start_time, end_time = work_hours(date)
    lesson_slots = []
    while (start_time + length) < end_time do
      lesson_slots << Lesson.new(connection: connection, start_time: start_time, end_time: (start_time + length))
      start_time += 15.minutes
    end
    lesson_slots
  end

  def self.work_hours(date)
    #this defines work hours, eventually this will be editable
    start_time = Time.new(date.year, date.month, date.day, 8)
    end_time = Time.new(date.year, date.month, date.day, 22)
    return start_time, end_time
  end

  def self.parsed_params(params)
    date = params["lesson"]["date"].to_date
    hour = params["lesson"]["time(4i)"]
    minute = params["length"]["time(5i)"]
    {
      date: date,
      length: params["length"].to_i.minutes,
      requested_time: Time.new(date.year, date.month, date.day, hour, minute)
    }
  end

end
