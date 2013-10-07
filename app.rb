require 'sinatra'
require 'erb'
require_relative 'models/coach'

enable :sessions

get '/' do
	p session
	@current_user = session[:user]
	@fname = @current_user[:fname]
	@lname = @current_user[:lname]
	@coaches = Coach.all
	erb :index
end

get '/login' do  
	erb :login
end

post '/login' do
	session[:user] = {fname: params[:fname], lname: params[:lname]}
	redirect '/'
end

#post request changes information in the database, when you create a user you're putting new data into the database.  When you updated a user
#and change their age, name.  When you delete the verb, the verb is delete.  When you delete a route it'll generally be a delete

get '/logout' do 
	puts "BEFORE"
	p session
	session.clear
	puts "AFTER" 
	p session
	redirect '/'
end

#Get Request it's a get request because you're saying "get me this page." Links typically are get request

