class User < ActiveRecord::Base
    has_many :reservations
    has_many :restaurants, through: :reservations 

    def self.log_in
        user_name = TTY::Prompt.new.ask("What is your username? 💫")
        user_password = TTY::Prompt.new.mask("Enter your password 🔑")
        found_diner = User.find_by(name: user_name, password: user_password)
        if found_diner
            puts "✨✨ Thanks for coming back ✨✨"
            return found_diner
        else
            puts "Sorry we couldn't find you. Let's get to know each other! 🥳"
            User.register()
        end 
    end

    def self.register
        user_name = TTY::Prompt.new.ask("What is your username?")
        user_phone_number = TTY::Prompt.new.ask("What is your phone number? Ex: 212-222-2222")
        user_password = TTY::Prompt.new.mask("Create a password. Min 6 characters 🔑")
        find_user = User.find_by(name: user_name)
        if find_user
            puts "Sorry, it looks like that username is taken."
        else
            User.create(name: user_name, phone_number: user_phone_number, password: user_password)
            
        end
    end

end
