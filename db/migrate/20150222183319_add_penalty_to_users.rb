class AddPenaltyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :penalty, :boolean
  end
end
