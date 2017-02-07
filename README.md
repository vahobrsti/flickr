# README

I used Ruby on Rails 5.0 as the main framework and postgres as the database engines. Ruby on rails is a robust and very powerful web framework out there with great community and support.

Also, in case one needs to take advantage of advanced concepts in programming like concurrency, this framework still is good and mature enough.

As for database engine, I have choosen to use postgres although in this special case MySQL and or even Sqlite is enough because this application is a very small application. Likewise to ROR, the community support and its robustness is my reason to choose postgres.



# How to run it:

Perquisites: 

You need to have Ruby,Postgres and needless to say git installed and configured. The suitable machine to install and get these two up and running is a linux (unix-based) environment.

 1) <code> git clone https://github.com/vahobrsti/flickr.git </code>

 2) <code> cd flickr </code>

 3) <code> bundle install </code>

 4) Open "<code>config/</code>" apply DB configuration for both test and development environments.
 

 5) open up terminal and enter <code> rails db:migrate</code> 

 6) <code> rails s</code>

 7) open up your browser and enter<code>localhost:3000</code>

Note that nothing has been mentioned about writing tests and caching. Howver, I used file caching in ROR. Also, there is a gem called <code>flickraw-cached</code> which I have used to
connect to flickr API and do the caching for requests. Also, for code styling I tried to follow <code> rubocop </code> which you can find <a href="https://github.com/bbatsov/ruby-style-guide#syntax">here</a>

As for TDD, there is a small scenario which Fails and it is incomplete. 

# possible improvements 

1) Caching using RAM instead of file. Redis and Memcached are good candidates. 

2) Having a complete set of TDD tests which is a great help while you are doing refactoring; It's a great documentation for your code.
 
 3) Flickr is applying some restriction on the non-commercial api and sometimes, I ran into the problem that they would not pass the url to large size. If this were to be used in production, it is required to have a commercial api with Flickr. 
 