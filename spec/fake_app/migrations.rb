class SetupMigration < ActiveRecord::Migration
  def self.up
    create_table(:users) {|t| t.string :first_name; t.string :last_name}
    create_table(:trees) {|t| t.string :name }
  end
end