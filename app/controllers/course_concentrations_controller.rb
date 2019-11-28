class CourseConcentrationsController < ApplicationController
  def index
    @course_concentrations = CourseConcentration.all

    render("course_concentration_templates/index.html.erb")
  end

  def show
    @course_concentration = CourseConcentration.find(params.fetch("id_to_display"))

    render("course_concentration_templates/show.html.erb")
  end

  def new_form
    @course_concentration = CourseConcentration.new

    render("course_concentration_templates/new_form.html.erb")
  end

  def create_row
    @course_concentration = CourseConcentration.new

    @course_concentration.course_id = params.fetch("course_id")
    @course_concentration.concentration_id = params.fetch("concentration_id")

    if @course_concentration.valid?
      @course_concentration.save

      redirect_back(:fallback_location => "/course_concentrations", :notice => "Course concentration created successfully.")
    else
      render("course_concentration_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_course
    @course_concentration = CourseConcentration.new

    @course_concentration.course_id = params.fetch("course_id")
    @course_concentration.concentration_id = params.fetch("concentration_id")

    if @course_concentration.valid?
      @course_concentration.save

      redirect_to("/courses/#{@course_concentration.course_id}", notice: "CourseConcentration created successfully.")
    else
      render("course_concentration_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_concentration
    @course_concentration = CourseConcentration.new

    @course_concentration.course_id = params.fetch("course_id")
    @course_concentration.concentration_id = params.fetch("concentration_id")

    if @course_concentration.valid?
      @course_concentration.save

      redirect_to("/concentrations/#{@course_concentration.concentration_id}", notice: "CourseConcentration created successfully.")
    else
      render("course_concentration_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @course_concentration = CourseConcentration.find(params.fetch("prefill_with_id"))

    render("course_concentration_templates/edit_form.html.erb")
  end

  def update_row
    @course_concentration = CourseConcentration.find(params.fetch("id_to_modify"))

    @course_concentration.course_id = params.fetch("course_id")
    @course_concentration.concentration_id = params.fetch("concentration_id")

    if @course_concentration.valid?
      @course_concentration.save

      redirect_to("/course_concentrations/#{@course_concentration.id}", :notice => "Course concentration updated successfully.")
    else
      render("course_concentration_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_course
    @course_concentration = CourseConcentration.find(params.fetch("id_to_remove"))

    @course_concentration.destroy

    redirect_to("/courses/#{@course_concentration.course_id}", notice: "CourseConcentration deleted successfully.")
  end

  def destroy_row_from_concentration
    @course_concentration = CourseConcentration.find(params.fetch("id_to_remove"))

    @course_concentration.destroy

    redirect_to("/concentrations/#{@course_concentration.concentration_id}", notice: "CourseConcentration deleted successfully.")
  end

  def destroy_row
    @course_concentration = CourseConcentration.find(params.fetch("id_to_remove"))

    @course_concentration.destroy

    redirect_to("/course_concentrations", :notice => "Course concentration deleted successfully.")
  end
end
