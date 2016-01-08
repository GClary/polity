class AddAnswersCountToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :answers_count, :integer, :default => 0
    Question.find_each do |q|
      q.update_attribute(:answers_count, q.answers.length)
    end
  end

  def self.down
    remove_column :questions, :answers_count
  end
end
