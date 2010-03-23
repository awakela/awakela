class CreateWakeupRecords < ActiveRecord::Migration
  def self.up
    create_table :wakeup_records do |t|
      t.integer :user_id
      t.datetime :time
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :wakeup_records
  end
end
