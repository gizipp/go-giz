class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :url_clicked, default: 0
      t.string :slug
      t.integer :slug_clicked, default: 0

      t.timestamps
    end
  end
end
