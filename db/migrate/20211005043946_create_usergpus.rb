class CreateUsergpus < ActiveRecord::Migration[6.1]
  def change
    create_table :usergpus do |t|
      t.integer :user_id
      t.integer :gpu_id

      t.timestamps
    end
  end
end
