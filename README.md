# Quotesy Rails API Project Setup

---

Quotesy has a Ruby on Rails backend and JavaScript frontend project. Two applications talking to each other means there will be a lot of moving parts! This document will walk you through setting up your project. The backend can be found [here](https://github.com/ShamelLakin/quotesy.git) & the frontend [here](https://github.com/ShamelLakin/quotesy_frontend.git)

Quotesy is built in two separate repositories for simplicity, the JS is in one repo and the API in another. This makes things _much easier_ to deploy if your frontend and backend are separated in two repos.

## Setting Up the Backend Rails API

Remember that when you create a new Rails application with `rails new <your_app>`, by default Rails will provide you with a ton of stuff that we will not need in order to build an API. Think of the entire ActionView library (all the view helper methods like `form_for`), ERB, the way sessions and cookies are handled, etc.

[Rails provides a way](http://edgeguides.rubyonrails.org/api_app.html) to set up a project that includes common tools needed for APIs and excludes some of the unnecessary extras. What you'll type is `rails new <your_app> --api`.

### Instructions

* In your terminal enter the following command:

```
rails new <my_app_name> --database=postgresql --api
```

_(Replace `<my_app_name>` with the actual name of your project)_

* This will generate a new rails project using Postgresql as the database. Postgresql is just a type of SQL database. **Make sure you are running Postgres on your computer**. Look for the elephant icon at the top of your screen. We'll want to use Postgres in case you want to push this application to production on Heroku (which does not support Sqlite databases).

You should have installed postgres when you initially setup your machine. If it's not on your computer, [you can download it here](http://postgresapp.com/)

* We specify the `--api` flag so rails knows to set this up as an API.

* `cd` into the new project folder you just created.

* Navigate to your Gemfile and uncomment `gem 'rack-cors'` This will allow us to setup Cross Origin Resource Sharing (CORS) in our API. You can read more about CORS [here](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing).

  * Basically, CORS is a security feature that prevents API calls from unknown origins. For example, if someone tried to use some malicious JavaScript to steal your bank information and your bank allowed API calls from anywhere, this could be a bad news bears™️ situation.
  * Let's say your bank is hosted on `https://bankofamerica.com` but a clever hacker tried to impersonate you and send a request with an *origin* of `https://couponvirus.org`. Ideally, your bank would reject requests from unknown *origins* such as `couponvirus.org` and only allow requests from trusted origins or domains like `bankofamerica.com`

- Make sure you add the `gem 'active_model_serializers'` to your Gemfile. Read [this](https://en.wikipedia.org/wiki/Serialization) if you're curious about serialization. Essentially, we need to convert our data into a format that can be easily transferred across a network as a string and reconstructed later. Remember, our frontend and backend live in different repositories and therefore have to make requests across the _interwebs_.

- We can use the serializer gem to specify the shape of our data when making requests. For example, if a `quote` instance `has_many` `categories`, we can tell our serializer to nest the data.

- Run `rails g serializer post` to generate a Serializer for our Post model. Edit the generated file to specify that each Post should be serialzed as a network response with its `quote` and `categories`.
