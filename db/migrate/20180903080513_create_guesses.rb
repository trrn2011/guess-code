class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.string :csv
      t.string :code

      t.timestamps
    end
  end
end
