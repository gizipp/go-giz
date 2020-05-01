class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string   :url
      t.integer  :url_clicked,  default: 0

      t.string   :slug
      t.integer  :slug_clicked, default: 0

      t.string   :title
      t.string   :description
      t.string   :author
      t.string   :image

      t.string   :status_code, limit: 3, default: 404
      t.string   :scheme
      t.string   :host
      t.datetime :checked_at

      t.jsonb    :custom_data

      t.timestamps
    end

    add_index :links, :url,    unique: true
    add_index :links, :slug,   unique: true
  end
end
