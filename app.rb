require File.expand_path(File.dirname(__FILE__)) + "/config/load"

require "resque"
require "sinatra"
require "sinatra/base"
require "sinatra/json"

require "will_paginate"
require "will_paginate/active_record" 

set :database, { 
  adapter: CONFIG[:adapter],
  database: CONFIG[:database]
}

enable :sessions

get "/" do
  "hello world"
end

post "/api/session" do
  params = JSON.parse request.body.read.to_s
  user_role = params["role"]

  model_class = Object.const_get user_role
  user = model_class.find_by_email(params["email"])
  if user and user.authenticate(params["password"])
    token = {
      :id => user.id,
      :role => user_role 
    }
    token[:company] = user.company.name if user_role == "Employee"

    session[:user] = token

    status 200
    json msg: "Success"
  else
    status 404 
    json msg: "Not found or password mismatch"
  end
end
