class AddUserIdToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :user_id, :bigint
  end
end
