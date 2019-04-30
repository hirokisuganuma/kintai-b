class AddSpecifiedTimeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :specified_time, :time
  end
end
