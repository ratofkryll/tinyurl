class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      # Postgres inet data type supports IPv4 & IPv6, as well as optional subnet - found this while looking to see if Postgres supports a URL/URI data type
      t.inet :ip_address, null: false
      t.references :url, foreign_key: true
      t.timestamps
    end
  end
end
