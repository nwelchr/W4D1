class AddUniquenessIndexToArtworks < ActiveRecord::Migration[5.1]
  def change

    add_index :artworks, [:title, :artist_id]

  end
end
