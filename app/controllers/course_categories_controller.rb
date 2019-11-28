class CourseCategoriesController < ApplicationController
  def index
    @course_categories = CourseCategory.all

    render("course_category_templates/index.html.erb")
  end

  def show
    @course_category = CourseCategory.find(params.fetch("id_to_display"))

    render("course_category_templates/show.html.erb")
  end

  def new_form
    @course_category = CourseCategory.new

    render("course_category_templates/new_form.html.erb")
  end

  def create_row
    @course_category = CourseCategory.new

    @course_category.course_id = params.fetch("course_id")
    @course_category.category_id = params.fetch("category_id")

    if @course_category.valid?
      @course_category.save

      redirect_back(:fallback_location => "/course_categories", :notice => "Course category created successfully.")
    else
      render("course_category_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_course
    @course_category = CourseCategory.new

    @course_category.course_id = params.fetch("course_id")
    @course_category.category_id = params.fetch("category_id")

    if @course_category.valid?
      @course_category.save

      redirect_to("/courses/#{@course_category.course_id}", notice: "CourseCategory created successfully.")
    else
      render("course_category_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_category
    @course_category = CourseCategory.new

    @course_category.course_id = params.fetch("course_id")
    @course_category.category_id = params.fetch("category_id")

    if @course_category.valid?
      @course_category.save

      redirect_to("/categories/#{@course_category.category_id}", notice: "CourseCategory created successfully.")
    else
      render("course_category_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @course_category = CourseCategory.find(params.fetch("prefill_with_id"))

    render("course_category_templates/edit_form.html.erb")
  end

  def update_row
    @course_category = CourseCategory.find(params.fetch("id_to_modify"))

    @course_category.course_id = params.fetch("course_id")
    @course_category.category_id = params.fetch("category_id")

    if @course_category.valid?
      @course_category.save

      redirect_to("/course_categories/#{@course_category.id}", :notice => "Course category updated successfully.")
    else
      render("course_category_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_course
    @course_category = CourseCategory.find(params.fetch("id_to_remove"))

    @course_category.destroy

    redirect_to("/courses/#{@course_category.course_id}", notice: "CourseCategory deleted successfully.")
  end

  def destroy_row_from_category
    @course_category = CourseCategory.find(params.fetch("id_to_remove"))

    @course_category.destroy

    redirect_to("/categories/#{@course_category.category_id}", notice: "CourseCategory deleted successfully.")
  end

  def destroy_row
    @course_category = CourseCategory.find(params.fetch("id_to_remove"))

    @course_category.destroy

    redirect_to("/course_categories", :notice => "Course category deleted successfully.")
  end
end
