# Harlem Bites

## Table of Contents
1. About
2. Features
3. Getting Started
4. Stack
5. Contributors
6. Next Steps

### About

🥂 Harlem Bites is a CLI-based app that allows users to choose different restaurants located in [Harlem, New York City](https://en.wikipedia.org/wiki/Harlem). This app was created with three models using object relationship mapping and have CRUD (create read update delete) abilities.

### Features
🗽 Users are able to shop local and support restaurants that vary in cuisines as NYC navigates reopening during the COVID-19 pandemic.

🗽 When restaurants are selected users will be able to view a snapshot of information detailing the restaurant's name, address, telephone number, general price, hours of operation, cuisine served, how many tables are available, and how many stars it has received.

🗽 Users are able to make a reservation complying with outdoor dining with COVID-19.
  Users are able to update their reservation's
  * party size 
  * date/time
  * cancel their reservation

🗽 Users will be able to see the precautions categorized by cleaning, socially distancing, and PPE that taken by the restaurant to keep diners healthy as they make a reservation for dinner.

🗽 Users are able to update their account details
  * username
  * phone number
  * password
  * delete their account

### Getting Started
To use our CLI app, users will open their terminal and run the following commands:

              ```
              bundle install
              rake db:seed
              rake start
              ```

### Stack
1. Ruby
2. Active Record
3. TTY Prompt
4. Rake
5. SQLite3



### Contributors

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/nunnyr">
        <img src="https://avatars2.githubusercontent.com/u/22527547?s=460&u=ad9c2d830938168f717cd28941b2f104c6677598&v=4" width="200px;" alt=""/><br/><sub><b>Nunny Reyes</b></sub>
      </a><br />
      <a href="https://github.com/wlcreate/Mod1_Restaurant_Reservation_App" title="Code">👩🏻‍💻</a> 
      <a href="https://github.com/wlcreate/Mod1_Restaurant_Reservation_App" title="Documentation">📚</a> 
      <a href="#ideas-nunny" title="Ideas, Planning, & Feedback">💡</a>            
    </td>

  <td align="center">
      <a href="https://github.com/wlcreate">
        <img src="https://avatars0.githubusercontent.com/u/62153993?s=460&v=4" width="200px;" alt=""/><br/><sub><b>Waverley Leung</b></sub>
      </a><br />
      <a href="https://github.com/wlcreate/Mod1_Restaurant_Reservation_App" title="Code">👩🏻‍💻</a> 
      <a href="https://github.com/wlcreate/Mod1_Restaurant_Reservation_App" title="Documentation">📚</a> 
      <a href="#ideas-waverley" title="Ideas, Planning, & Feedback">💡</a>            
    </td>


  </tr>
</table>


<!-- 
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/wlcreate">
        <img src="https://avatars0.githubusercontent.com/u/62153993?s=460&v=4" width="200px;" alt=""/><br/><sub><b>Waverley Leung</b></sub>
      </a><br />
      <a href="https://github.com/wlcreate/Mod1_Restaurant_Reservation_App" title="Code">👩🏻‍💻</a> 
      <a href="https://github.com/wlcreate/Mod1_Restaurant_Reservation_App" title="Documentation">📚</a> 
      <a href="#ideas-waverley" title="Ideas, Planning, & Feedback">💡</a>            
    </td>
  </tr>
</table> -->




### Next Steps
1. We would like to include scraping data from yelp to add a bigger database of restaurants in Harlem. This would lead to more options for users to make a reservation for. 

2. Work on making this model accessible using accessibility tools.

3. Incorporate a 4th model.

4. Create rspec files to test our CLI model.

5. Create migrations/add more columns to our User table to add more account details (pronoun name, email, credit card).

6. Add more additional validation for prompts, music, and animation.

7. Continue to add CLI resources to our README


### Acknowledgements
We would like to thank:
* Sylwia Vargas
* Eric Kim
* Annie Zheng
* Isabel K. Lee
* the Code Bender Cohort for their positivity
 

### Resources
1. [Sylwia Vargas' Article on Ruby CLI Art](https://medium.com/@sylwiavargas/adding-pictures-to-your-ruby-cli-4252b89823a)
2. [TTY Github for Documentation](https://github.com/piotrmurach/tty)
3. [ASCII Font Creator](http://patorjk.com/software/taag/#p=display&f=Flower%20Power&t=Welcome!)
