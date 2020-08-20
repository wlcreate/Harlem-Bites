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
        






       
        ██╗  ██╗ █████╗ ██████╗ ██╗     ███████╗███╗   ███╗    ██████╗ ██╗████████╗███████╗███████╗
        ██║  ██║██╔══██╗██╔══██╗██║     ██╔════╝████╗ ████║    ██╔══██╗██║╚══██╔══╝██╔════╝██╔════╝
        ███████║███████║██████╔╝██║     █████╗  ██╔████╔██║    ██████╔╝██║   ██║   █████╗  ███████╗
        ██╔══██║██╔══██║██╔══██╗██║     ██╔══╝  ██║╚██╔╝██║    ██╔══██╗██║   ██║   ██╔══╝  ╚════██║
        ██║  ██║██║  ██║██║  ██║███████╗███████╗██║ ╚═╝ ██║    ██████╔╝██║   ██║   ███████╗███████║
        ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝    ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚══════╝\n".colorize(:white)

        puts "

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
       puts "Successfully Created! 🥳🥳🥳"
       self.user = user_register_return_value #the user associated with the user instance just created (attr_accessor :user -> should we rename?)
       self.main_menu
    end


    def main_menu
        user.reload #makes sure that we get the most up to date info
        system "clear" #pushes this to the top of the terminal
        
        puts ###################################################################################################
        puts "🍕🍕🍕 Welcome to Harlem Bites! 🍕🍕🍕" #our app will change to our app name when we come up with it
        
         puts ###################################################################################################
         puts ###################################################################################################
         
        
        
        
        prompt.select("What would you like to do? ") do |menu|
            menu.choice "See my Reservations", -> {display_user_reservations_helper}
            menu.choice "Make a Reservation", -> { display_all_restaurants_helper }
            menu.choice "My Account", -> { my_account }

        end
    end

    def my_account

    
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Update account details", -> {my_details}
            menu.choice "Delete account", -> { my_delete }
            menu.choice "Back", -> {self.main_menu}
        end
    end


    def my_details
        prompt.select("What detail would you like to update?") do |menu|
            menu.choice "Username", -> {update_my_name}
            menu.choice "Password", -> {update_my_password}
            menu.choice "Phone Number", -> {update_my_phone}
            menu.choice "Back", -> {self.main_menu}
        end


    end

    def my_delete
        #deleting entire account
        response = prompt.yes?("Do you want to delete your account? This is final") do |q|
            q.suffix "Yes / No"
        end
        if response == true
            my_account_delete = self.user
            my_account_delete.destroy
            puts "I can't believe this happened 😭🥺"
            sleep 5
            self.welcome
        else
            puts "Phew! We got worried! 😅"
            sleep 5
            self.main_menu
        end
       
    end

    def update_my_name
        new_name = TTY::Prompt.new.ask("What is your new username? =>")
        #my_rez_party = self.user.reservations.find(chosen_reservation_id)
        # binding.pry
        
        this_is_me = self.user
        # binding.pry
        this_is_me.update(name: new_name)
        
        puts "New name #{this_is_me.name} is confirmed!"
        sleep 3
        self.main_menu

    end

    def update_my_password
        new_password = TTY::Prompt.new.mask("What is your new password? =>")
        #my_rez_party = self.user.reservations.find(chosen_reservation_id)
        # binding.pry
        
        this_is_password = self.user
        # binding.pry
        this_is_password.update(password: new_password)
        
        puts "This will only be shown once: new password #{new_password}!"
        sleep 3
        self.main_menu

    end

    def update_my_phone
        new_phone_number = TTY::Prompt.new.ask("What is your new phone number? =>")
        #my_rez_party = self.user.reservations.find(chosen_reservation_id)
        # binding.pry
        
        this_is_phone = self.user
        # binding.pry
        this_is_phone.update(phone_number: new_phone_number)
        
        puts "Your saved number is now #{new_phone_number}!"
        sleep 3
        self.main_menu
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
        
        if self.user.reservations.count > 0
        my_rez = self.user.reservations.reservation_id
        # binding.pry
        choice_id = prompt.select("What reservation do you want to see?", my_rez)
            # binding.pry
        see_chosen_reservation(choice_id)

        # sleep 5 #after 5 seconds of inactivity
        # self.main_menu #goes back to main menu
        # # self.main_menu <- To take me back to the main_menu
        else 
            puts "You don't have any reservations! Let's dine somewhere"
            sleep 2
            display_all_restaurants_helper()
        end
    end

    #displays the chosen reservation
    #asks if the user want to update or cancel the chosen reservation
    #do we want to display the chosen restaurant's more info again? - YES Stretch Goal
     def see_chosen_reservation(choice_id)
        user.reload
        #name of the restaurant they will be dining at 
        restaurant_chosen = Reservation.all.find(choice_id).restaurant.name
        restaurant_date = Reservation.all.find(choice_id).date
        restaurant_party_size = Reservation.all.find(choice_id).party_size
        puts " 🥂 You have a reservation for #{restaurant_party_size} at #{restaurant_chosen} on #{restaurant_date} 🥂"

        prompt.select("What would you like to do?") do |menu|
                menu.choice "Update", -> {update_reservation(choice_id)}
                menu.choice "Cancel reservation", -> { delete_reservation(choice_id) }
                menu.choice "Back", -> {self.main_menu}
        end
        # binding.pry
     end

     #updates the chosen reservation
     #can choose to update the date and/or the party_size
     def update_reservation(chosen_reservation_id)
        #code for updating
        prompt.select("What would you like to update?") do |menu|
            menu.choice "Date", -> {choose_new_date(chosen_reservation_id)}
            menu.choice "Party Size", -> {choose_new_party(chosen_reservation_id)}
            menu.choice "Back", -> {self.main_menu}
        end
    end

    #updates the reservation date/time
    #reservation instance is no longer the instance it is the ID

    def choose_new_date(chosen_reservation_id)
        new_date = TTY::Prompt.new.ask("Which date? *Please note that you can only change this once* =>")
        #we are looking specifically for this ID, you may have multiple reservations
        my_rez_date = self.user.reservations.find(chosen_reservation_id)
        # binding.pry


        #How can we restrict a user from only updating something ONE time?
        my_rez_date.update(date: new_date)
        puts #############################################################
        puts "New date confirmed! on #{new_date}🗓"

        puts "🦠 Please arrive 15 minutes prior"
        puts "🦠 There is a 2 hour window on dining"
        sleep 8
        self.main_menu
    end

    #updates the reservation party_size
    def choose_new_party(chosen_reservation_id)
        new_party = TTY::Prompt.new.ask("How many for dinner? *Please note that you can only change this once* =>")
        my_rez_party = self.user.reservations.find(chosen_reservation_id)
        # binding.pry
        my_rez_party.update(party_size: new_party)
        puts "New party size confirmed! 🕺"
        sleep 3
        self.main_menu
    end

    #deletes the chosen reservation
    def delete_reservation(chosen_reservation_id)
        #code for deleting
        response = prompt.yes?("Do you want to cancel this reservation?") do |q|
            q.suffix "Yes / No"
            end
        if response == true
            my_rez_delete = self.user.reservations.find(chosen_reservation_id)
            my_rez_delete.destroy
            puts "Your reservation is cancelled 😭🥺"
            sleep 5
            self.main_menu
        else
            puts "Phew! We can't wait to see you! 😅"
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

        choice_restaurant = prompt.select("What restaurant do you want to see? 👀 ", Restaurant.all_names)
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
        

        puts "❗️😷❗️ Tables available due to COVID-19: #{highlighted_restaurant.seating_capacity} ❗️😷❗️" 

        puts #################################################################################
       

        prompt.select("What would you like to do? ") do |menu|
            menu.choice "Make a reservation", -> {reservation_confirmation(highlighted_restaurant, user_num)}
            menu.choice "See Restaurants", -> {display_all_restaurants_helper}
            menu.choice "Main Menu", -> {self.main_menu}
        end
    end

    def reservation_confirmation(dinner_reservation, user_num)
        
        dinner_party = TTY::Prompt.new.ask("How many guests? (5 guests limit per NYC Health Standards) => ")
        dinner_date = TTY::Prompt.new.ask("Please enter a date and time in the following format: MM/DD/YYYY - HH:MM PM => ")
        # binding.pry
        # guest_saved = guest.user_id
        Reservation.create(party_size: dinner_party, date: dinner_date, user_id: user_num, restaurant_id: dinner_reservation.id  )
        #  binding.pry
        puts #####################################################################################
        puts "COVID-19 RESTAURANT SAFETY PRECAUTIONS"
        puts #################################################################################
        puts "Cleaning and Sanitizing"
        puts #################################################################################
        puts "✅ Surfaces sanitized between seatings"
        puts "✅ Common areas deep cleaned daily"
        puts "✅ Digital, disposable or sanitized menu provided"
        puts "✅ Sanitizer or wipes provided for customers"
        puts "✅ Contactless payment available"
        puts "✅ Sealed or wrapped utensils used"

        
        puts######################################################################################
        puts "Social Distancing" 
        puts #################################################################################
        puts "✅ Limited number of seated diners"
        puts "✅ Distancing mantained in common areas"
        puts "✅ Extra space between tables"
        puts "✅ Sick staff prohibited in the workplace"
        
        puts #####################################################################################
        puts "Personal Protective Equipment (PPE)" 
        puts #################################################################################
        puts "✅ Waitstaff wear masks"
        puts "✅ Diners must wear masks unless eating or drinking"
        
        puts #####################################################################################
        # binding.pry
        # self.main_menu
        # binding.pry
        prompt.select("We can't wait to see you 🥳") do |menu|
            menu.choice "Go back", -> {self.main_menu}
        end
        
    end

        




end