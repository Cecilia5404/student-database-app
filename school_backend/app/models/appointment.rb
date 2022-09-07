class Appointment < ActiveRecord::Base
    belongs_to :student
    belongs_to :teacher

    def self.earliest
        self.all.pluck(:date).min
    end

    def self.latest
        self.all.pluck(:date).max
    end
end