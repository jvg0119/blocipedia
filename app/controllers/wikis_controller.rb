class WikisController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  	#@user = current_user
    #@user = User.find(params[:id])
  	#@wikis = @user.wikis 
    @wikis = Wiki.paginate(page: params[:page], per_page: 10)
    authorize @wikis
  end

  def show
  	@wiki = Wiki.find(params[:id])
   # authorize @wiki
  end

  def new
  	#@user = User.find(params)
  	@wiki = Wiki.new
  end

  def create
  	@user = current_user
  	@wiki = @user.wikis.new(wiki_params)
  	if @wiki.save
  		flash[:success] = "Your wiki was created successfully!"
  		redirect_to wikis_path
  	else
  		flash[:danger] = "There was an error creating your wiki. Please try again."
  		render :new
  	end
  end

  def edit
  	#@user = current_user
    #@user = User.find(params[:user_id])
  	#@wiki = @user.wikis.find(params[:id]) 
    @wiki = Wiki.find(params[:id])
    authorize @wiki 	
  end

  def update
  	#@user = current_user
  	#@wiki = @user.wikis.find(params[:id]) 
    @wiki = Wiki.find(params[:id])
  	if @wiki.update_attributes(wiki_params)
  		flash[:success] = "Your wiki was updated successfully!"
   		redirect_to wiki_path(@wiki)
   	else
  		flash[:danger] = "There was an error updating your wiki. Please try again."
  		render :edit
  	end  		
  end

  def destroy
  	#@user = current_user
  	#@wiki = @user.wikis.find(params[:id])
    @wiki = Wiki.find(params[:id])
    authorize @wiki 
  	if @wiki.destroy
  		flash[:success] = "Your wiki was deleted!"
   		redirect_to wikis_path
   	else
  		flash[:danger] = "There was an error deleting your wiki. Please try again."
  		render :destroy
  	end  		  		
  end

private

	def wiki_params
		params.require(:wiki).permit(:title, :body)
	end

end
