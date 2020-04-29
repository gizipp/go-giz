class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :clicked, default: 0
      t.string :title
      t.string :description
      t.text :raw

      t.timestamps
    end
  end
end
