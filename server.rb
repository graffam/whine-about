require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require 'CSV'

def open_csv
  file = CSV.read("whines.csv")
end



get '/' do

  @file = open_csv

  erb :index
end

get '/new' do
  @file = open_csv

  erb :new
end

post '/whine' do
  if !params["title"] == "" && !params["whine"] == ""
    @complaint = "#{params["title"]},#{params["whine"]},1\n"
    File.open("whines.csv","a") do |f|
      f.write(@complaint)
    end
    redirect '/'
  else
    @message = "You need to fill both fields"
    erb :new
  end
end
