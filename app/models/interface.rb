class Interface
    attr_reader :prompt
    attr_accessor :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        # self -> instance of the Interface
        # choice = prompt.select("Welcome to our Application. What would you like to do?", ["See All Plants", "See All Categories", "Create A User"])
        # if choice == "See All Plants" 
        # elsif choice == "See All Categories"
        # end
        system "clear"
        welcome_image()
        prompt.select("Please make a selection:") do |menu|
            menu.choice "Log In", -> { log_returning_user_helper }
            menu.choice "Create a User", -> { create_user_helper }
        end

    end

    def welcome_image
        puts "
        
    _______________                        |*\_/*|________
    |  ___________  |     .-.     .-.      ||_/-\_|______  |
    | |           | |    .****. .****.     | |           | |
    | |   0   0   | |    .*****.*****.     | |   0   0   | |
    | |     -     | |     .*********.      | |     -     | |
    | |   \___/   | |      .*******.       | |   \___/   | |
    | |___     ___| |       .*****.        | |___________| |
    |_____|\_/|_____|        .***.         |_______________|
      _|__|/ \|_|_.............*.............._|________|_
     / ********** \                          / ********** \
   /  ************  \                      /  ************  \
  --------------------                    --------------------

CREATED BY NUNNY REYES & WAVERLEY LEUNG
        "
    end

    #this should ask for the user's name + password to find them in the User table of our database
    #once found, will bring them to the main menu
    def log_returning_user_helper
        user_log_in_info = User.log_in()
        self.user = user_log_in_info
        # binding.pry
        sleep 3
        self.main_menu
    end

    #this will create a user (make a user instance) by getting info from them
    #until they create a user name that is not taken, the .register method in the User class will continue
    #once they successfully create a user, will be guided towards the main menu
    def create_user_helper
       user_register_return_value = User.register()
       until user_register_return_value
        user_register_return_value = User.register()
       end
       puts "Successfully Created!"
       self.user = user_register_return_value #the user associated with the user instance just created (attr_accessor :user -> should we rename?)
       self.main_menu
    end


    def main_menu
        user.reload #makes sure that we get the most up to date info
        system "clear" #pushes this to the top of the terminal
        puts "Welcome to our app!" #our app will change to our app name when we come up with it
        prompt.select("What would you like to do?") do |menu|
            menu.choice "See my Reservations", -> {display_user_reservations_helper}
            menu.choice "Make a Reservation", -> { display_all_restaurants_helper }
        end
    end

    #displays all of the user's reservations
    #user chooses one of their reservations
    #Need help with making the user's reservations a choice so that they can either update or delete - Wave did with Sylwia!
    def display_user_reservations_helper
        # self.user <- User who is logged in
        # self.user.restaurants <- All of the restaurants associated with the User
        # self.user.reservations <- All of the reservation instances
        # refer to Eric's video around 1:22:55 for more info on getting specific info out of objects! 
        # all_choices = []
        #need to pull up Reservation.all
        #need to .find_by restaurant id && matches the self.user.id
        # self.user.reservations.each do |user_reservation|
        #     binding.pry
        #     all_choices << user_reservation.reservation_id
        #     # "#{user_reservation.date} - #{user_reservation.restaurant.name}"
        #     # Reservation.all.find(user_reservation.id)
        #     binding.pry
        # end
        choice_id = prompt.select("What reservation do you want to see?", Reservation.reservation_id)
            binding.pry
        see_chosen_reservation(choice_id)

        # sleep 5 #after 5 seconds of inactivity
        # self.main_menu #goes back to main menu
        # # self.main_menu <- To take me back to the main_menu
    end

    #displays the chosen reservation
    #asks if the user want to update or cancel the chosen reservation
    #do we want to display the chosen restaurant's more info again? - YES Stretch Goal
     def see_chosen_reservation(choice_id)
        binding.pry
        puts "You have a reservation at #{chosen_reservation_instance.restaurant.name} on #{chosen_reservation_instance.date}"
            prompt.select("What would you like to do?") do |menu|
                menu.choice "update", -> {update_reservation(chosen_reservation_instance)}
                menu.choice "cancel", -> { delete_reservation(chosen_reservation_instance) }
                menu.choice "back", -> {self.main_menu}
        end
    
     end

     #updates the chosen reservation
     #can choose to update the date and/or the party_size
     def update_reservation(chosen_reservation_instance)
        #code for updating
        prompt.select("What would you like to update?") do |menu|
            menu.choice "date", -> {choose_new_date(chosen_reservation_instance)}
            menu.choice "party size", -> {choose_new_party(chosen_reservation_instance)}
            menu.choice "back", -> {self.main_menu}
        end
    end

    #updates the reservation date/time
    def choose_new_date(chosen_reservation_instance)
        new_date = TTY::Prompt.new.ask("Which date? Please note that you can only change this once")
        #How can we restrict a user from only updating something ONE time?
        chosen_reservation_instance.update(date: new_date)
        puts "New date confirmed!"
        puts "Please arrive 15 minutes prior and due to COVID-19 there is a 2 hour window on dining"
        sleep 3
        self.main_menu
    end

    #updates the reservation party_size
    def choose_new_party(chosen_reservation_instance)
        new_party = TTY::Prompt.new.ask("How many for dinner? Please note that you can only change this once")
        chosen_reservation_instance.update(party_size: new_party)
        puts "New party size confirmed!"
        sleep 3
        self.main_menu
    end

    #deletes the chosen reservation
    def delete_reservation(chosen_reservation_instance)
        #code for deleting
        response = prompt.yes?("Do you want to cancel this reservation?")
        if response == true
            chosen_reservation_instance.destroy
            puts "Your reservation is cancelled 😭"
            sleep 5
            self.main_menu
        else
            puts "Phew! We can't wait to see you!"
            sleep 5
            self.main_menu
        end
    end
   
    #show the listing of the restaurants to the user
    #save the user's choice to then bring to display_restaurant_info
    def display_all_restaurants_helper
        #all_choices should be an array of all of the Restaurant names
        #Restaurant.all => all the restaurants
        #to just get the name we need to map(?) restaurant_instance.name

        choice_restaurant = prompt.select("What restaurant do you want to see?", Restaurant.all_names)
        display_restaurant_info(choice_restaurant)
        
    end

    #show the user more information about the restaurant they chose
    #then ask the user if they want to make a reservation
    #options: show all info, make res, or go back
    def display_restaurant_info(choice)
        #our choice is only returning the name of the restaurant. not the instance created
        #we are now going to do Restaurant.find_by(name: choice) and save this to a variable
        highlighted_restaurant = Restaurant.find_by(name: choice)
        # binding.pry
        user_num = self.user.id
        # guest_num = self.user.user_id[0]
        #  binding.pry

       

        puts ###############################################################################
        puts "#{highlighted_restaurant.name}"
        puts "#{highlighted_restaurant.stars}"
        puts ###############################################################################
        puts "🗽: #{highlighted_restaurant.address}"
        puts "🥂: #{highlighted_restaurant.telephone}"
        puts "🌃: #{highlighted_restaurant.hours_open}"
        puts "🍽:  #{highlighted_restaurant.cuisine}"
        puts "💸: #{highlighted_restaurant.pricey}"
        

        puts "❗️❗️ Tables available due to COVID-19: #{highlighted_restaurant.seating_capacity} ❗️❗️" 

        puts #################################################################################
       

        prompt.select("What would you like to do?") do |menu|
            menu.choice "Make a reservation", -> {reservation_confirmation(highlighted_restaurant, user_num)}
            menu.choice "Go back", -> {self.main_menu}
        end
    end

    def reservation_confirmation(dinner_reservation, user_num)
        
        dinner_party = TTY::Prompt.new.ask("How many guests? (including yourself no more than 5 guests - NYC Health Standards) 🐰🐰")
        dinner_date = TTY::Prompt.new.ask("Please enter a date and time in the following format: MM/DD/YY - HH:MM PM 🐰🐰")
        # binding.pry
        # guest_saved = guest.user_id
        Reservation.create(party_size: dinner_party, date: dinner_date, user_id: user_num, restaurant_id: dinner_reservation.id  )
        #  binding.pry
        puts #####################################################################################
        puts "Cleaning and Sanitizing"
        puts "✅Surfaces sanitized between seatings"
        puts "✅Common areas deep cleaned daily"
        puts "✅Digital, disposable or sanitized menu provided"
        puts "✅Sanitizer or wipes provided for customers"
        puts "✅Contactless payment available"
        puts "✅Sealed or wrapped utensils used"

        
        puts######################################################################################
        puts "Social Distancing"
        puts "✅Limited number of seated diners"
        puts "✅Distancing mantained in common areas"
        puts "✅Extra space between tables"
        puts "✅Sick staff prohibited in the workplace"
        
        puts #####################################################################################
        puts "PPE"
        puts "✅Waitstaff wear masks"
        puts "✅Diners must wear masks unless eating or drinking"
        
        puts #####################################################################################
        # binding.pry
        # self.main_menu
        # binding.pry
        prompt.select("We can't wait to see you") do |menu|
            menu.choice "Go back", -> {self.main_menu}
        end
        
    end

        




end