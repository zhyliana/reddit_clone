class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    sub = Sub.find(params[:sub_id])
    @link = sub.links.new(link_params)
    if @link.save
      redirect_to sub_link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to subs_url
  end

  def index
    @links = Link.all
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to sub_link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :body, :url, :user_id)
  end
end
