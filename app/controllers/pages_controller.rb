class PagesController < ApplicationController

  layout "admin"

  def index
    @pages = Page.order("position ASC")
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => "Default"})
    @subjects = Subject.all
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully."
      redirect_to(:action => 'index')
    else
      @subjects = Subject.all
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.all
    @page_count = Page.count

  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show', :id => @page.id)
    else
       @subjects = Subject.all
       @page_count = Page.count

      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def page_params
      params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible, :created_at)
    end

end