class ChangeNameOfTypColumnToTypeOfCompetition < ActiveRecord::Migration
  def self.up
    rename_column :tournaments, :type, :type_of_competition
  end

  def self.down
    rename_column :tournaments, :type_of_competition, :type
  end
end
