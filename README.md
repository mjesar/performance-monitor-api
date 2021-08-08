# README


To application up and running.

Things you may want to cover:

* Ruby version: ruby 2.7.3p183 (2021-04-05 revision 6847ee089d) [x86_64-linux]

* Rails version: rails  5.0.0

* Database creation
   *	database: postgresSql
   *	commands
		*	rails db:create
		* rails db:migrate

* Configuration
	* bundle install 
	* rails s


* How to run the test suite
	* Rspec 

* Services
	* To rerun test start scheduling in background using crono gem  
	 	* run: bundle exec crono  RAILS_ENV=development
	 	* current time set at 08:55pm 
	* You can change time in cronotab.rb file


	To run rake task anytime resun test
	  run: rake rerun_test:run_test

 

* Recieve emails 
	To recieve email using letter_opener 
	  vist: http://localhost:3000/letter_opener/

* ...
