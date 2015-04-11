class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Article"
  belongs_to :rateable, :polymorphic => true
end
