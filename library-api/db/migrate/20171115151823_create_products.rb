class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :author
      t.string :publisher
      t.string :genre
      t.datetime :published_date
      t.string :description
      t.boolean :in_library, default: true
      t.references :product_type, foreign_key: true

      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :deleted_at
    end
  end
end
