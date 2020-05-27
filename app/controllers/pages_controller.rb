class PagesController < ApplicationController
  def index
    # Return array pages
    @pages = Page.all
    # Renders index.html.erb
  end

  def show
    # Return single page with a certain ID
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    # Creates only in memory
  end

  def edit

  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  private
  def pages_params
    # {page: {title: 'post', author: 'you', body: 'asdfasdf'}}
    params.require(:page).permit(:title, :author, :body)
  end
end
