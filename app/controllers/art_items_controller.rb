class ArtItemsController < ApplicationController

  get '/artitems' do
    @art_items = ArtItem.where(author_id:(current_user.id))
    erb :'/art_items/index'
  end

  # --- CREATE route ---
  get '/artitems/new' do
    @artitem = ArtItem.new
    redirect_if_not_logged_in
    erb :'/art_items/new'
  end

  post '/artitems' do
    @artitem = current_user.art_items.build(name: params[:artitems][:name], description: params[:artitems][:description])

    redirect_if_not_authorized

    if @artitem.save
      redirect "/artitems"
    else
      erb :'/art_items/new'
    end

  end

  # --- SHOW or READ route ---
  get '/artitems/:id' do
    @art_items = ArtItem.find_by_id(params[:id])
    erb :'/art_items/show'
  end 

  # --- EDIT route --- note, instance variable name is different than above because it's being used in error form.
  get '/artitems/:id/edit' do
    @artitem = ArtItem.find_by_id(params[:id])
    redirect_if_not_authorized
    erb :'/art_items/edit'
  end

  # --- UPDATE route ---
  patch "/artitems/:id" do
    # binding.pry
    @artitem = ArtItem.find_by_id(params[:id])
    redirect_if_not_authorized
    if @artitem.update(name: params[:artitems][:name], description: params[:artitems][:description])
      redirect "/artitems/#{@artitem.id}"
    else
      erb :'/art_items/edit'
    end

  end

  # --- DELETE route ---
  delete "/artitems/:id" do
    @artitem = ArtItem.find_by_id(params[:id])
    redirect_if_not_authorized
    @artitem.delete
    redirect "/artitems"

  end




  private

  def authorize_item(artitem)
    current_user == artitem.author
  end

  def redirect_if_not_authorized
    redirect_if_not_logged_in
    if !authorize_item(@artitem)
      flash[:error] = "You don't have permission to do that action"
      redirect "/users/login"
    end
  end

  def no_items 
    @art_items.length == 0
  end



end