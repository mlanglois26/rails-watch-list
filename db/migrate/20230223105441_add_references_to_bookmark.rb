class AddReferencesToBookmark < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :list_id, :integer
    remove_column :bookmarks, :movie_id, :integer
    add_reference :bookmarks, :list, foreign_key: true
    add_reference :bookmarks, :movie, foreign_key: true
  end
end
