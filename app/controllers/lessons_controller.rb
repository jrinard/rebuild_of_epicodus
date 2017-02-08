class LessonsController < ApplicationController

  def show
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id]) || Lesson.find_by_number(params[:number])
  end

  def new
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson Saved!"
      redirect_to section_path(@lesson.section)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = "Lesson Updated!"
      redirect_to section_path(@lesson.section)
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Lesson Deleted"
    redirect_to section_path(@lesson.section)
  end

  private
    def lesson_params
      params.require(:lesson).permit(:title, :content, :number)                               end
  end
