# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
add to db: rails generate migration add_pickupday_dropoffday_to_cars pickup:datetime dropoff:datetime
run local host server: rails s
reset db: rails db:reset
migrate db: rails db:migrate

Gắn thư mục hiện tại vào project đã tạo trên heroku
Gõ: heroku git:remote -a ten_website
$ git push heroku
$ heroku pg:reset DATABASE
$ heroku run rails db:migrate
$ heroku run rails db:seed

tao chu mo :
<div class="field">
	<%= f.text_area :content, placeholder: "Compost new micropost..." %>
</div>