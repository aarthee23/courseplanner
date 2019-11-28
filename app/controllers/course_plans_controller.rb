class CoursePlansController < ApplicationController
  def index
    @course_plans = CoursePlan.all

    render("course_plan_templates/index.html.erb")
  end

  def show
    @course_plan = CoursePlan.find(params.fetch("id_to_display"))

    render("course_plan_templates/show.html.erb")
  end

  def new_form
    @course_plan = CoursePlan.new

    render("course_plan_templates/new_form.html.erb")
  end

  def create_row
    @course_plan = CoursePlan.new

    @course_plan.user_id = params.fetch("user_id")

    if @course_plan.valid?
      @course_plan.save

      redirect_back(:fallback_location => "/course_plans", :notice => "Course plan created successfully.")
    else
      render("course_plan_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @course_plan = CoursePlan.find(params.fetch("prefill_with_id"))

    render("course_plan_templates/edit_form.html.erb")
  end

  def update_row
    @course_plan = CoursePlan.find(params.fetch("id_to_modify"))

    @course_plan.user_id = params.fetch("user_id")

    if @course_plan.valid?
      @course_plan.save

      redirect_to("/course_plans/#{@course_plan.id}", :notice => "Course plan updated successfully.")
    else
      render("course_plan_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @course_plan = CoursePlan.find(params.fetch("id_to_remove"))

    @course_plan.destroy

    redirect_to("/course_plans", :notice => "Course plan deleted successfully.")
  end
end
