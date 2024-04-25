require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require_relative 'cookbook'
require_relative 'recipe'

cookbook = Cookbook.new

get "/" do
  @recipes = cookbook.all || []
  erb :index
end

get "/new" do
  erb :new
end

post "/recipes" do
  name = params[:name]
  description = params[:description]
  cookbook.create(Recipe.new(name, description))
  redirect "/"
end

get "/delete/:index" do
  index = params[:index].to_i
  cookbook.destroy(index)
  redirect "/"
end

get "/team/:username" do
  puts params[:username]
  "The username is #{params[:username]}"
end



get "/about" do
  erb :about
end
