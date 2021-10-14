class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      # Adding DB not-null validation to ensure a record is never saved with a blank URL
      t.string :long_url, null: false
      t.string :short_url, null: false
      t.timestamps
    end

    # DB-level validation to ensure that long and short URLs are unique
    add_index :urls, :long_url, unique: true
    add_index :urls, :short_url, unique: true
  end
end
