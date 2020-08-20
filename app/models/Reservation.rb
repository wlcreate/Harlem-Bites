class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant


    # we need to store the reservation and their ID 
    def self.reservation_id
        Reservation.all.map do |reservation_info|
            binding.pry
        {reservation_info.name => reservation_info.id}
        end
      end
end
