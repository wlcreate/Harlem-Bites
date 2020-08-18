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

        prompt.select("Please make a selection:") do |menu|
            menu.choice "Log In", -> { log_returning_user_helper }
            menu.choice "Create a User", -> { create_user_helper }
        end

    end

    #this should ask for the user's name + password to find them in the User table of our database
    #once found, will bring them to the main menu
    def log_returning_user_helper
        user_log_in_info = User.log_in()
        self.user = user_log_in_info
        puts "Thanks for coming back #{self.user.name}!"
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
            menu.choice "Make a Reservation", -> { display_and_add_reservations_helper }
        end
    end

    #displays all of the user's reservations
    #Need help with making the user's reservations a choice so that they can either update or delete
    def display_user_reservations_helper
        # self.user <- User who is logged in
        # self.user.restaurants <- All of the restaurants associated with the User
        # self.user.reservations <- All of the reservation instances 
        puts "Here are all of your reservations"
        self.user.reservations.each do |user_reservation|
            puts "#{user_reservation.date} - #{user_reservation.restaurant.name}"
            puts "*******"
        end

        sleep 5 #after 5 seconds of inactivity
        self.main_menu #goes back to main menu
        # self.main_menu <- To take me back to the main_menu
    end

    #displays all of the restaurants
    #creates a new reservation
    def display_and_add_reservations_helper
        # Restaurant.all_names is defined in the Restaurant class and shows all restaurants => [{name => id}, {name => id}]

        chosen_restaurant_id = prompt.select("View all of our participating restaurants", Restaurant.all_names)

        #need to display the more information about the chosen restaurant

        #after seeing more information about a restaurant, ask if user wants to make a reservation
        #if yes, create a new reservation
        #if no, bring back to see all restaurants or go to main menu
        if prompt.yes?("Do you want to make a reservation?")
            reservation_date = TTY::Prompt.new.ask("What date and time would you like to reserve?")
            reservation_party_size = TTY::Prompt.new.ask("How many people?")
            new_reservation = Reservation.create(guest_id: self.user.id, restaurant_id: chosen_restaurant_id, date: reservation_date, party_size: reservation_party_size)
        else
            prompt.select("What would you like to do?") do |menu|
                menu.choice "Go back to all restaurants", -> {display_and_add_reservations_helper}
                menu.choice "Go back to main menu", -> { self.main_menu }
            end
        end
    end

end