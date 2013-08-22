class SetupMigration < ActiveRecord::Migration
  def self.up
    create_table(:users) {|t| t.string :first_name; t.string :last_name}
  end
end