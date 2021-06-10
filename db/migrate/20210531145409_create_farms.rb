class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :form_of_rearing
      t.string :country
      t.string :laying_farm
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
