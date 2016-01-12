class Answer < ActiveRecord::Base
  belongs_to :question, :counter_cache => true
  acts_as_votable
end
