class RemoveUserReferenceFromUser < ActiveRecord::Migration[8.0]
  def change
    remove_reference :users, :user, null: false, foreign_key: true
  end
end
