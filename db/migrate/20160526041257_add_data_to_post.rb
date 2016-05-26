class AddDataToPost < ActiveRecord::Migration
  def change
    add_column :posts, :source, :string
    add_column :posts, :description, :text
  end
end
