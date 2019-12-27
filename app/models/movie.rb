class Movie < ApplicationRecord
  has_many :votes
  paginates_per 5
  ratyrate_rateable "rate"
end
