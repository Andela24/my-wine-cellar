# Virtual Wine Cellar

## About Product

Welcome to your online Wine Cellar. This CRUD application allows a user to keep track of their wine collection. 
This app allows for the consumer to not only keep track of what wines they have, but also provide them with the source of which winery came from. This app allows for the consumer to keep track of the vintage, type of wine, and the source for the winery.

## System Dependencies

* gem 'rack-cors'
* gem 'pry'
* gem 'active_model_serializers', '~> 0.10.2'
* gem "bcrypt", "~> 0.1.7"
* gem "puma", "~> 5.0"
* gem 'dotenv-rails'

## Supporting Tech 

* Ruby "2.7.4"
* sqlite3 "~> 1.4"
* React "^18.2.0"
* React-bootstrap "^2.6.0"
* React-router-dom "^6.4.4"
* Semantic-ui-react "^2.1.4"

# Installation
Check above for the supporting tech. Make sure you have those versions installed on your local machine.

* Clone this repo: 
    git@github.com:Andela24/my-wine-cellar.git
* cd my-wine-cellar 
* bundle install
* rails db:create
* rails db:migrate 
* rails db:seed
* rails server or rails s

to install the required gems

By default, the server will run on port http://localhost:3001 (the frontend will run on port 3000)

Follow directions for installation of frontend [https://github.com/Andela24/my-wine-cellar-ui]

## Technologies

This system uses Ruby on Rails with a postgres server for the backend as well as React with React Router on the frontend.

## Demo Video
If you would like to see this project in action, check out this demo video:
https://youtu.be/TTbTg1AlB3k

## Licensing (MIT, optional)
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.