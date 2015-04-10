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

use Rack::Session::Pool, :expire_after => 2592000

get "/" do
  "hello world"
end

before '/api/student/*' do
  if session[:user].nil?
    halt 401, "session is not valid"
  else
    @user = session[:user]
    halt 401, "API is not valid for role:#{@user[:role]}" if @user[:role] !~ /Student/
  end
end


post "/api/session" do
  params = JSON.parse request.body.read.to_s
  user_role = params["role"].capitalize

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
    json msg: "Success", name: user.name
  else
    status 404 
    json msg: "Not found or password mismatch"
  end
end

delete "/api/session" do
  session[:user] = nil
  json msg: "Success"
end


get "/api/student/resume" do
  student_id = @user[:id]
  student = Student.find student_id
  if student
    res = {
      :name => student.name,
      :tel => student.tel,
      :email => student.email,
      :resume => student.resume.body
    }
    json res
  else
    status 404
    json msg: "Student not found: #{student_id}"
  end
end

put "/api/student/resume" do
  params = JSON.parse request.body.read.to_s

  student_id = @user[:id]
  student = Student.find(student_id)
  if student
    student.resume.body = params["body"]
    student.save
  else
    status 404
    json msg: "Student not found: #{student_id}"
  end
end
