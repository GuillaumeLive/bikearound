class AddBikeCategoryToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :category, :string
  end
end
