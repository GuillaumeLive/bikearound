class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :description
      t.text :price
      t.string :localization

      t.timestamps
    end
  end
end
