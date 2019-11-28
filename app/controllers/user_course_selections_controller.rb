class UserCourseSelectionsController < ApplicationController
  def index
    @user_course_selections = UserCourseSelection.page(params[:page]).per(10)

    render("user_course_selection_templates/index.html.erb")
  end

  def show
    @user_course_selection = UserCourseSelection.find(params.fetch("id_to_display"))

    render("user_course_selection_templates/show.html.erb")
  end

  def new_form
    @user_course_selection = UserCourseSelection.new

    render("user_course_selection_templates/new_form.html.erb")
  end

  def create_row
    @user_course_selection = UserCourseSelection.new

    @user_course_selection.course_plan_id = params.fetch("course_plan_id")
    @user_course_selection.course_id = params.fetch("course_id")
    @user_course_selection.professor = params.fetch("professor")
    @user_course_selection.quarter = params.fetch("quarter")
    @user_course_selection.day = params.fetch("day")
    @user_course_selection.hours_of_preparation = params.fetch("hours_of_preparation")
    @user_course_selection.rating = params.fetch("rating")
    @user_course_selection.bid_points = params.fetch("bid_points")
    @user_course_selection.pre_req = params.fetch("pre_req")

    if @user_course_selection.valid?
      @user_course_selection.save

      redirect_back(:fallback_location => "/user_course_selections", :notice => "User course selection created successfully.")
    else
      render("user_course_selection_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_course
    @user_course_selection = UserCourseSelection.new

    @user_course_selection.course_plan_id = params.fetch("course_plan_id")
    @user_course_selection.course_id = params.fetch("course_id")
    @user_course_selection.professor = params.fetch("professor")
    @user_course_selection.quarter = params.fetch("quarter")
    @user_course_selection.day = params.fetch("day")
    @user_course_selection.hours_of_preparation = params.fetch("hours_of_preparation")
    @user_course_selection.rating = params.fetch("rating")
    @user_course_selection.bid_points = params.fetch("bid_points")
    @user_course_selection.pre_req = params.fetch("pre_req")

    if @user_course_selection.valid?
      @user_course_selection.save

      redirect_to("/courses/#{@user_course_selection.course_id}", notice: "UserCourseSelection created successfully.")
    else
      render("user_course_selection_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_course_plan
    @user_course_selection = UserCourseSelection.new

    @user_course_selection.course_plan_id = params.fetch("course_plan_id")
    @user_course_selection.course_id = params.fetch("course_id")
    @user_course_selection.professor = params.fetch("professor")
    @user_course_selection.quarter = params.fetch("quarter")
    @user_course_selection.day = params.fetch("day")
    @user_course_selection.hours_of_preparation = params.fetch("hours_of_preparation")
    @user_course_selection.rating = params.fetch("rating")
    @user_course_selection.bid_points = params.fetch("bid_points")
    @user_course_selection.pre_req = params.fetch("pre_req")

    if @user_course_selection.valid?
      @user_course_selection.save

      redirect_to("/course_plans/#{@user_course_selection.course_plan_id}", notice: "UserCourseSelection created successfully.")
    else
      render("user_course_selection_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @user_course_selection = UserCourseSelection.find(params.fetch("prefill_with_id"))

    render("user_course_selection_templates/edit_form.html.erb")
  end

  def update_row
    @user_course_selection = UserCourseSelection.find(params.fetch("id_to_modify"))

    @user_course_selection.course_plan_id = params.fetch("course_plan_id")
    @user_course_selection.course_id = params.fetch("course_id")
    @user_course_selection.professor = params.fetch("professor")
    @user_course_selection.quarter = params.fetch("quarter")
    @user_course_selection.day = params.fetch("day")
    @user_course_selection.hours_of_preparation = params.fetch("hours_of_preparation")
    @user_course_selection.rating = params.fetch("rating")
    @user_course_selection.bid_points = params.fetch("bid_points")
    @user_course_selection.pre_req = params.fetch("pre_req")

    if @user_course_selection.valid?
      @user_course_selection.save

      redirect_to("/user_course_selections/#{@user_course_selection.id}", :notice => "User course selection updated successfully.")
    else
      render("user_course_selection_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_course
    @user_course_selection = UserCourseSelection.find(params.fetch("id_to_remove"))

    @user_course_selection.destroy

    redirect_to("/courses/#{@user_course_selection.course_id}", notice: "UserCourseSelection deleted successfully.")
  end

  def destroy_row_from_course_plan
    @user_course_selection = UserCourseSelection.find(params.fetch("id_to_remove"))

    @user_course_selection.destroy

    redirect_to("/course_plans/#{@user_course_selection.course_plan_id}", notice: "UserCourseSelection deleted successfully.")
  end

  def destroy_row
    @user_course_selection = UserCourseSelection.find(params.fetch("id_to_remove"))

    @user_course_selection.destroy

    redirect_to("/user_course_selections", :notice => "User course selection deleted successfully.")
  end
end
