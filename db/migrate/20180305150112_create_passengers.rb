class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.string :line_user_id
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :primary_address
      t.string :secondary_address
      t.boolean :is_vip, default: false
      t.boolean :is_active, default: true
      t.string :note

      t.timestamps
    end
  end
end
