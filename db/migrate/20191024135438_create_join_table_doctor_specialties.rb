class CreateJoinTableDoctorSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_doctor_specialties do |t|
      t.references :doctor, foreign_key: true, index: true
      t.references :specialty, foreign_key: true, index: true

      t.timestamps
    end
  end
end
