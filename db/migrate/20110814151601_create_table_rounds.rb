class CreateTableRounds < ActiveRecord::Migration
  def self.up
    drop_table :rounds
    create_table :rounds do |t|
      t.integer :index
    end
  end

  def self.down
    drop_table :rounds
  end
end
