class AddSpecifiedTimeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :specified_time, :time, default: Time.zone.parse("08:00")
  end
end
