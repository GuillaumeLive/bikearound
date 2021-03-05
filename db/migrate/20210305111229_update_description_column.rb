class UpdateDescriptionColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :bikes, :description, :text
  end
end
