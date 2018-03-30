class AddAasmStateToPassengers < ActiveRecord::Migration[5.1]
  def change
    add_column :passengers, :aasm_state, :string
  end
end
