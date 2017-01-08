class WikisController < ApplicationController

  def index
  	@user = current_user
  	@wikis = @user.wikis  	
  end

  def show
  	@wiki = Wiki.find(params[:id])

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
  	@user = current_user
  	@wiki = @user.wikis.find(params[:id])  	
  end

  def update
  	@user = current_user
  	@wiki = @user.wikis.find(params[:id]) 
  	if @wiki.update_attributes(wiki_params)
  		flash[:success] = "Your wiki was updated successfully!"
   		redirect_to wiki_path(@wiki)
   	else
  		flash[:danger] = "There was an error updating your wiki. Please try again."
  		render :edit
  	end  		
  end

  def destroy
  	@user = current_user
  	@wiki = @user.wikis.find(params[:id]) 
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
