class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :upvote
      t.integer :downvote
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
