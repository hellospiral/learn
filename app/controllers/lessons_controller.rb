class LessonsController < ApplicationController
  def show
    @lessons = Lesson.all
    @lesson = Lesson.find(params[:id])
  end

  def new
    @section = Section.find(params[:section_id])
    if @section.lessons.any?
      @lessonNumber = @section.lessons.last.number + 1
    else
      @lessonNumber = 1
    end
    @lesson = @section.lessons.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      redirect_to section_path(@lesson.section)
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    @section = Section.find(params[:section_id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @section = @lesson.section
    if @lesson.update(lesson_params)
      redirect_to section_path(@lesson.section)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to section_lessons_path(@lesson.section)
  end

  private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :number, :dumb)
  end
end
