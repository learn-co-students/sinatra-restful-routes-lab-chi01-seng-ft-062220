class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  #INDEX action
  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  #NEW action
  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #SHOW action
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  #EDIT action
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    Recipe.update(params[:recipe])
    reditect to "/recipes/#{@recipe.id}"
  end

  #DELETE action
  delete "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy()
    redirect to "/recipes"
  end
end
