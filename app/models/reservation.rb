class Reservation < ApplicationRecord
  belongs_to :customer, optional: true
end
