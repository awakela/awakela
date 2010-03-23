class WakeupRecord < ActiveRecord::Base
  belongs_to :user

  def self.recorded_today?(user)
    last = user.wakeup_records.last
    !last.nil? and last.recorded_today?
  end

private
  def recorded_today?
    # TODO to be implemented
  end
end
