class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.integer :amtaid
      t.string :school
      t.string :teamabcd
      t.string :contactemail
      t.string :contactphone

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
