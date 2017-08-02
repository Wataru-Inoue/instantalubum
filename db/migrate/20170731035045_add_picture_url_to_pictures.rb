class AddPictureUrlToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :picture_url, :string
  end
end
