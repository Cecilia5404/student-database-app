class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :teacher
      t.references :student
      t.date :date
    end
  end
end
