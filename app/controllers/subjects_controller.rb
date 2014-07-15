class SubjectsController < ApplicationController

  layout  "admin"
  def new
    @subject = Subject.new( :name => "Default")
    @subject_count = Subject.count + 1
  end



  def index
    @subjects = Subject.order("position ASC")
  end



  def create 
    #@subject = Subject.new(params[:subject])
    # Strong parameters
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'index')
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end



  def show
    @subject = Subject.find(params[:id])
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  
  end

  def update 
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params) 
      flash[:notice] = "Subject updated successfully."
       redirect_to(:action => 'show', :id => @subject.id)
    else
      @subject_count = Subject.count
      render('edit')
    end
  end


  def delete
    @subject = Subject.find(params[:id])

  end

  def destroy
    # the destroy action never display anything on the template
    # so there is no reason to use the instance variables
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' deleted  successfully."
    redirect_to(:action => 'index')
  end


  private 

   def subject_params
      # same as using "params[:subject]", except that it:
      # raises an error if :subject is not present
      # allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible, :created_at)
   end
end
