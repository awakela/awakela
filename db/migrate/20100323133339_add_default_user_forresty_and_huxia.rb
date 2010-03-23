class AddDefaultUserForrestyAndHuxia < ActiveRecord::Migration
  def self.up
    User.create(
      :username => 'forresty',
      :email    => 'forresty@awake.la',
      :password => '123456')

    User.create(
      :username => 'huxia',
      :email    => 'huxia@awake.la',
      :password => '123456')
  end

  def self.down
    User.delete_all
  end
end
