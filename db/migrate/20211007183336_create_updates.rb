class CreateUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :updates do |t|
      t.integer :count

      t.timestamps
    end
  end
end
