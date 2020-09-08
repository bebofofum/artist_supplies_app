class ArtItemsController < ApplicationController

  get '/artitems' do
    # binding.pry
    @art_items = ArtItem.where(author_id:(current_user.id))
    erb :'/art_items/index'
  end

  # --- CREATE route ---
  get '/artitems/new' do
    redirect_if_not_authorized
    @artitem = ArtItem.new
    erb :'/art_items/new'
  end

  post '/artitems' do
    redirect_if_not_authorized
    # binding.pry
    @artitem = current_user.art_items.build(name: params[:artitems][:name], description: params[:artitems][:description])

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

  def authorize_item(item)
    current_user == item.author
  end

  def redirect_if_not_authorized
    redirect_if_not_logged_in
    if !authorize_item(@artitem)
      flash[:error] = "You don't have permission to do that action"
      redirect "/users/login"
    end
  end



end