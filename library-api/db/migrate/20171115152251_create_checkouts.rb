class CreateCheckouts < ActiveRecord::Migration[5.1]
  def change
    create_table :checkouts do |t|
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.datetime :pickup_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :dropoff_date

      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :deleted_at
    end
  end
end
