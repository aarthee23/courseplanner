class CoursePlansController < ApplicationController
  before_action :current_user_must_be_course_plan_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_course_plan_user
    course_plan = CoursePlan.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == course_plan.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @course_plans = CoursePlan.page(params[:page]).per(10)

    render("course_plan_templates/index.html.erb")
  end

  def show
    @user_course_selection = UserCourseSelection.new
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

    

    if @course_plan.valid?
      @course_plan.save

      redirect_to("/course_plans/#{@course_plan.id}", :notice => "Course plan updated successfully.")
    else
      render("course_plan_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @course_plan = CoursePlan.find(params.fetch("id_to_remove"))

    @course_plan.destroy

    redirect_to("/users/#{@course_plan.user_id}", notice: "CoursePlan deleted successfully.")
  end

  def destroy_row
    @course_plan = CoursePlan.find(params.fetch("id_to_remove"))

    @course_plan.destroy

    redirect_to("/course_plans", :notice => "Course plan deleted successfully.")
  end
end
