require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, './app/views'
  end

  get '/' do
    binding.pry
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    Post.create({name: params[":name"],content: params[":content"]})
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  patch '/posts/:id' do
    new_content = { name: params[":name"], content: params[":content"] }
    @post = Post.update(params[:id], new_content)
    @post.save
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/post/:id/delete' do
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :delete
  end


end
# @post = Post.create(params[:post])
