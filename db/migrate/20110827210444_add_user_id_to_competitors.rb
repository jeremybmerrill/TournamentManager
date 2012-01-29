class AddUserIdToCompetitors < ActiveRecord::Migration
  def self.up
    add_column :competitors, :user_id, :integer
  end

  def self.down
    remove_column :competitors, :user_id
  end
end
