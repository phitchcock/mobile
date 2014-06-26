class PagesController < ApplicationController
  
  layout 'mobile', only: [:index, :show]

  before_action :set_site
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = @site.pages.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = @site.pages.build(page_params)

    if @page.save
      redirect_to site_pages_path, notice: 'Page created'
    else
      flash[:error] = 'Page was not created'
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to site_page_path, notice: 'updated page'
    else
      flash[:error] = 'page not updated'
      render :edit
    end
  end

  def destroy
    if @page.destroy
      redirect_to site_pages_path, notice: 'destroyed page'
    else
      flash[:error] = 'page not destroyed'
      redirect_to @site, @page
    end
  end

  private

  def set_site
    @site = Site.find(params[:site_id])
  end

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit!
  end


end