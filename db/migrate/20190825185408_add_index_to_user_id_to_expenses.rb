class AddIndexToUserIdToExpenses < ActiveRecord::Migration[5.0]
  def change
  	add_index :expenses, :user_id
  end
end
