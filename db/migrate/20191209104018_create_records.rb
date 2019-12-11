class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :studentid
      t.string :sname
      t.text :dob
      t.string :father
      t.string :mother
      t.integer :phno
      t.text :email

      t.timestamps
    end
  end
end
