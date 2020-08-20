class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant


    # we need to store the reservation and their ID 
    def self.reservation_id
        name_and_id = Reservation.all.map do |reservation_info|
            {reservation_info.restaurant.name => reservation_info.id}
        end
      end
end
