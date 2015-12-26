class AddCommentAuthorAvatar < ActiveRecord::Migration
  def change
    add_column :comments, :avatar_url, :string
  end
end
