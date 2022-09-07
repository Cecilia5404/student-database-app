class Student < ActiveRecord::Base
    belongs_to :school
    has_many :appointments
    has_many :teachers, through: :appointments

    def returnNameAndAge
        "#{self.student_name}-#{self.age}"
    end


    def print 
        puts "Name: #{self.student_name}"
        puts "Age: #{self.age}"
        puts "Gender: #{self.gender}"
        puts "Phone number #{self.phone}"
        self.student_name
    end 

    newValue = print()
end