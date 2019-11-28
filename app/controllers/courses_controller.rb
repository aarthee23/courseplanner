class CoursesController < ApplicationController
  def index
    @courses = Course.all

    render("course_templates/index.html.erb")
  end

  def show
    @user_course_selection = UserCourseSelection.new
    @course_concentration = CourseConcentration.new
    @course_category = CourseCategory.new
    @course = Course.find(params.fetch("id_to_display"))

    render("course_templates/show.html.erb")
  end

  def new_form
    @course = Course.new

    render("course_templates/new_form.html.erb")
  end

  def create_row
    @course = Course.new

    @course.title = params.fetch("title")
    @course.number = params.fetch("number")
    @course.unit = params.fetch("unit")

    if @course.valid?
      @course.save

      redirect_back(:fallback_location => "/courses", :notice => "Course created successfully.")
    else
      render("course_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @course = Course.find(params.fetch("prefill_with_id"))

    render("course_templates/edit_form.html.erb")
  end

  def update_row
    @course = Course.find(params.fetch("id_to_modify"))

    @course.title = params.fetch("title")
    @course.number = params.fetch("number")
    @course.unit = params.fetch("unit")

    if @course.valid?
      @course.save

      redirect_to("/courses/#{@course.id}", :notice => "Course updated successfully.")
    else
      render("course_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @course = Course.find(params.fetch("id_to_remove"))

    @course.destroy

    redirect_to("/courses", :notice => "Course deleted successfully.")
  end
end
