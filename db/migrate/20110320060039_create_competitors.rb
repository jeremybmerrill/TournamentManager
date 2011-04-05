class CreateCompetitors < ActiveRecord::Migration
  def self.up
    create_table :competitors do |t|
      t.string :name
      t.string :contactemail
      t.string :contactphone

      t.timestamps
    end
  end

  def self.down
    drop_table :competitors
  end
end
