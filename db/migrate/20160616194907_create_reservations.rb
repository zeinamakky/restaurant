class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.date :date
      t.integer :timeslot
      t.integer :table_id

      t.timestamps null: false
    end
  end
end
