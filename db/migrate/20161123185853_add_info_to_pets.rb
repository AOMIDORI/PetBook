class AddInfoToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :birthday, :date
    add_column :pets, :gender, :string
    add_column :pets, :animal_type, :string
    add_column :pets, :breed, :string
    add_column :pets, :bio, :text
  end
end
