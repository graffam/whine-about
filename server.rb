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
