class AddBasicTimeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :basic_time, :time
  end
end
