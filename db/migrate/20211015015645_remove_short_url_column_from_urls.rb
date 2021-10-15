class RemoveShortUrlColumnFromUrls < ActiveRecord::Migration[6.1]
  def change
    remove_column :urls, :short_url, :string
  end
end
