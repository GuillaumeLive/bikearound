class AddBikeSizeToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :size, :string
  end
end
