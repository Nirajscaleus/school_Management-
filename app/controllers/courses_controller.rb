class CoursesController < ApplicationController
  def index
    if current_user.role == 'teacher' 
      @courses = current_user.courses
    else
      @courses = Course.all
    end
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
      @course.user_id = current_user.id
      if @course.save
      redirect_to @course
      else
        render :new
      end
  end

  def edit 
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to @course
    else  
      render :edit
    end  
  end

  def destroy
    @course  = Course.find(params[:id])
    @course.destroy

    redirect_to root_path notice: "contact has been deleted"
  end

  private
  def course_params
      params.require(:course).permit(:title, :description,:price)
  end
end
