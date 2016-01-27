class User < ActiveRecord::Base
  has_many :skills, foreign_key: 'teacher_id'

end
