class CreateCheats < ActiveRecord::Migration[6.1]
  def change
    create_table :cheats do |t|
      t.string :name
      t.string :game_executable
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
