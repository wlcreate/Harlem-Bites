    #Sylwia's way
    #     all_choices = ["update", "cancel", "back"]
    #     choice = prompt.select("What do you want do?", all_choices)
    #     if choice == "update"
    #       update_reservation(chosen_reservation_instance)
    #     elsif choice == "cancel"
    #       delete_reservation(chosen_reservation_instance)
    #     elsif choice == "back"
    #         self.main_menu
    #     end



     #displays all of the restaurants
    #creates a new reservation
    #Note: I think that this can be refractored, perhaps can look at above to see where/how - Wave
    # def display_and_add_reservations_helper
    #     # Restaurant.all_names is defined in the Restaurant class and shows all restaurants => [{name => id}, {name => id}]
    #     chosen_restaurant_id = prompt.select("View all of our participating restaurants", Restaurant.all_names)

    #     #Need to display the "more information" about the chosen restaurant

    #     #after seeing more information about a restaurant, ask if user wants to make a reservation
    #     #if yes, create a new reservation
    #     #if no, bring back to see all restaurants or go to main menu
    #     if prompt.yes?("Do you want to make a reservation?")
    #         reservation_date = TTY::Prompt.new.ask("What date and time would you like to dine?") #haha I rhymed
    #         reservation_party_size = TTY::Prompt.new.ask("How many people?")
    #         new_reservation = Reservation.create(guest_id: self.user.id, restaurant_id: chosen_restaurant_id, date: reservation_date, party_size: reservation_party_size)
    #     else
    #         prompt.select("What would you like to do?") do |menu|
    #             menu.choice "Go back to all restaurants", -> {display_and_add_reservations_helper}
    #             menu.choice "Go back to main menu", -> { self.main_menu }
    #         end
    #     end
    # end
