class AddAvatarToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :avatar, :string
  end
end
