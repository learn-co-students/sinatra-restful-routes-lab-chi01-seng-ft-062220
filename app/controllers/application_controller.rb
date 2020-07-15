require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/recipes'
  end  

  get '/recipes/new' do
    erb :new
  end

#   #index page
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end  

#   #show page
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end  

#   #edit page
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

#patch controller
patch '/recipes/:id' do 
  @recipe = Recipe.find(params[:id])
  @recipe.update(params[:recipe])

  redirect to "/recipes/#{@recipe.id}"
end

  
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end 


  delete '/recipes/:id' do #destroy action
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end