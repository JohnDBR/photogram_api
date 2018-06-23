class AddProfilePictureToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :picture_id, :integer
  end
end
