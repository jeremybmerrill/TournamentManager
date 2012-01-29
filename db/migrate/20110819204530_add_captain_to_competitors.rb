class AddCaptainToCompetitors < ActiveRecord::Migration
  def self.up
    add_column :competitors, :captain, :boolean
  end

  def self.down
    remove_column :competitors, :captain
  end
end
