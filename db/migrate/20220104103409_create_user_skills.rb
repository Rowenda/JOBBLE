class CreateUserSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :user_skills do |t|
      t.integer :level
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
