class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user,
    presence: true

  validates :movie,
    presence: true

  validates :text,
    presence: true

  validates :rating_out_of_five, numericality: { only_integer: true, greater_than_or_equal_to: 1,  less_than_or_equal_to: 5} 
  # validates :rating_out_of_five, numericality: { greater_than_or_equal_to: 1 } 
  # validates :rating_out_of_five, numericality: { less_than_or_equal_to: 5 }
end
