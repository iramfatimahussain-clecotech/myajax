class SearchesController < ApplicationController
  def index
    @searches =  Search.all
  end

  def show
    @search = Search.find(params[:id])
    respond_to do |format|
      format.js { flash[:info] = "The article with an ID of #{@search.id} has had their admin attribute toggled!" }
  end
    
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      respond_to do |format|
        format.js { flash[:info] = "The article with an ID of #{@search.id} has had their admin attribute toggled!" }
    end
      
    else
        render :edit, status: :unprocessable_entity
    end
  end

private
    def search_params
      params.require(:search).permit(:name,:type)
    end
end