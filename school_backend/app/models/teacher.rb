class Teacher < ActiveRecord::Base
    has_many :appointments, dependent: :destroy
    has_many :students, through: :appointments
end