class Order < ApplicationRecord
  validates :rating_number,
  :inclusion  => { :in => ["in progress", "complited", "shipped"],
  :message    => "%{value} is not in_progress/complited/shipped" }
end
