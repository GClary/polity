class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description
      t.integer :upvote
      t.integer :downvote
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
