class AddTimezoneColumnToWakeupRecord < ActiveRecord::Migration
  def self.up
	add_column :wakeup_records, :timezone, :string
  end

  def self.down
	remove_column :wakeup_records, :timezone
  end
end
