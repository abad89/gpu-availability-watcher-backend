class CreateGpus < ActiveRecord::Migration[6.1]
  def change
    create_table :gpus do |t|
      t.string :name
      t.decimal :salePrice
      t.boolean :onlineAvailability
      t.string :url
      t.string :largeImage
      t.integer :sku
      t.boolean :active

      t.timestamps
    end
  end
end
