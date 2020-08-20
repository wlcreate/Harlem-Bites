class User < ActiveRecord::Base
    has_many :reservations
    has_many :restaurants, through: :reservations 

    def self.log_in
        user_name = TTY::Prompt.new.ask("What is your username?")
        user_password = TTY::Prompt.new.mask("Enter your password")

        User.where(name: user_name, password: user_password)
    end

    def self.register
        user_name = TTY::Prompt.new.ask("What is your username?")
        user_phone_number = TTY::Prompt.new.ask("What is your phone number?")
        user_password = TTY::Prompt.new.mask("Create a password")

        if User.find_by(name: user_name)
            puts "Sorry, it looks like that username is taken."
        else
            User.create(name: user_name, phone_number: user_phone_number, password: user_password)
        end
    end

    #we need to store the guest and their ID 
    def self.user_id
        User.all.map do |user_info|
            # binding.pry
        #   {user_info.name => 
          user_info.id
        # }
        end
      end





end
