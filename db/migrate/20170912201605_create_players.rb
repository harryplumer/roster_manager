class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :position, null: false
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
