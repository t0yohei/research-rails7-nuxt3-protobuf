class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :name, null: false
      t.string :detail, null: false, default: ''
      t.boolean :completed, null: false, default: 0
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end
end
