class AddProfilePropertiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_image_filename, :string
    add_column :users, :profile_image_size, :integer
    add_column :users, :profile_image_content_type, :string
    add_column :users, :role, :integer, default: 1
  end
end
