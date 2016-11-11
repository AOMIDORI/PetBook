class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :pets, [:user_id, :created_at]
  end
end
