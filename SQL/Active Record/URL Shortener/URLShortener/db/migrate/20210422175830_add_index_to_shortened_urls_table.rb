class AddIndexToShortenedUrlsTable < ActiveRecord::Migration[5.2]
  def change
    add_index :shortened_urls, :user_id
    add_index :shortened_urls, :short_url, unique: true
  end
end
