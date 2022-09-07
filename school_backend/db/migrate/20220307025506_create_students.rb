class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :student_name
      t.integer :age
      t.string :gender
      t.string :phone
      t.boolean :active
      t.integer :school_id
      t.timestamps
    end
  end
end
