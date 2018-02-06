class Rating < ApplicationRecord
  validates :rating_number,
    :inclusion  => { :in => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
    :message    => "%{value} is not in range 1..10" }
end
