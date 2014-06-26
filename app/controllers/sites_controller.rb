class SitesController < ApplicationController

  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def index
    @sites = Site.all
  end

  def show
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to sites_path, notice: "#{@site.title} was created"
    else
      flash[:error] = "Site was not created, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @site.update(site_params)
      redirect_to site_path, notice: "Site Updated"
    else
      flash[:error] = "Site did not update"
      render :edit
    end
  end

  def destroy
    if @site.destroy
      redirect_to sites_path, notice: "Site was removed"
    else
      flash[:error] = "There was an error, please try again"
      redirect_to sites_path
    end
  end

  private

  def site_params
    params.require(:site).permit!
  end

  def set_site
    @site = Site.find(params[:id])
  end

end