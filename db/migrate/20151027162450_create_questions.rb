class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :answer_one
      t.string :answer_two
      t.integer :votes_one
      t.integer :votes_two

      t.timestamps null: false
    end
  end
end
