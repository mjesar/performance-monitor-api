# README


**Overview**

[Google’s Page Speed Insights](https://developers.google.com/speed/docs/insights/v5/get-started "Google’s Page Speed Insights") is a web service that rates the performance of a website using Lighthouse. This project provides an API that checks if a given URL meets performance criteria specified by the user. 

The performance criteria to be evaluated are:

**Time to First Byte (TTFB)**
The time it takes for the web server to start responding with data

**Time to First Meaningful Paint (TTFP)**
The time it takes for the browser to paint the page on the screen

**Time to Interactive (TTI)**
The time it takes for all JavaScript to be downloaded, parsed, and executed

**Speed Index**
Google’s speed rating for the site

To application up and running.

**Things you may want to cover:**
* Ruby version: ruby 2.7.3p183 (2021-04-05 revision 6847ee089d) [x86_64-linux]

* Rails version: rails  5.0.0

1. Database creation
   *	database: postgresSql
   *	commands
		*	rails db:create
		* rails db:migrate

2. Configuration
 ```
bundle install 
rails s
```

3. How to run the test suite
``` 
rspec 
```

4. Services
	* To rerun PageSpeed Insights API test start scheduling in background using crono gem  
	 	* run: ```bundle exec crono  RAILS_ENV=development```
	 	* current time set at 08:55pm 
	* You can change time in cronotab.rb file


	To run rake task anytime resun test
	  run: ```rake rerun_test:run_test```

 

5. Recieve emails
	To recieve email using letter_opener 
	  vist: http://localhost:3000/letter_opener/
	  
6. Postman collection is attacted in repository please clone and import it in postman 
