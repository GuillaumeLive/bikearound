class UpdatePriceColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :bikes, :price
    add_column :bikes, :price, :float
  end
end
