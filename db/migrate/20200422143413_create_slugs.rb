class CreateSlugs < ActiveRecord::Migration[6.0]
  def change
    create_table :slugs do |t|
      t.integer :link_id
      t.string :path
      t.integer :clicked, default: 0

      t.timestamps
    end

    add_index :slugs, :link_id
  end
end
