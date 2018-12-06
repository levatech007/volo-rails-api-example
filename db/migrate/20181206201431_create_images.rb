class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :avatar
      t.boolean :active

      t.timestamps
    end
  end
end
