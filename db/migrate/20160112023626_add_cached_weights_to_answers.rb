class AddCachedWeightsToAnswers < ActiveRecord::Migration
  def self.up
  	add_column :answers, :cached_weighted_score, :integer, :default => 0
    add_column :answers, :cached_weighted_total, :integer, :default => 0
    add_column :answers, :cached_weighted_average, :float, :default => 0.0
  	add_index  :answers, :cached_weighted_score
    add_index  :answers, :cached_weighted_total
    add_index  :answers, :cached_weighted_average
  end

  def self.down
  	remove_column :answers, :cached_weighted_score
    remove_column :answers, :cached_weighted_total
    remove_column :answers, :cached_weighted_average
  end
end

