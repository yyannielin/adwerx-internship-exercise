class CreatePostalCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :postal_codes do |t|
      t.string :postal_code
      t.string :state
      t.string :country
      t.string :longitude
      t.integer :latitude
      t.string :city

      t.timestamps
    end
  end
end
