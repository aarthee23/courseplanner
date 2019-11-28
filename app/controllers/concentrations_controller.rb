class ConcentrationsController < ApplicationController
  def index
    @q = Concentration.ransack(params[:q])
    @concentrations = @q.result(:distinct => true).includes(:course_concentrations).page(params[:page]).per(10)

    render("concentration_templates/index.html.erb")
  end

  def show
    @course_concentration = CourseConcentration.new
    @concentration = Concentration.find(params.fetch("id_to_display"))

    render("concentration_templates/show.html.erb")
  end

  def new_form
    @concentration = Concentration.new

    render("concentration_templates/new_form.html.erb")
  end

  def create_row
    @concentration = Concentration.new

    @concentration.name = params.fetch("name")
    @concentration.req_unit = params.fetch("req_unit")

    if @concentration.valid?
      @concentration.save

      redirect_back(:fallback_location => "/concentrations", :notice => "Concentration created successfully.")
    else
      render("concentration_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @concentration = Concentration.find(params.fetch("prefill_with_id"))

    render("concentration_templates/edit_form.html.erb")
  end

  def update_row
    @concentration = Concentration.find(params.fetch("id_to_modify"))

    @concentration.name = params.fetch("name")
    @concentration.req_unit = params.fetch("req_unit")

    if @concentration.valid?
      @concentration.save

      redirect_to("/concentrations/#{@concentration.id}", :notice => "Concentration updated successfully.")
    else
      render("concentration_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @concentration = Concentration.find(params.fetch("id_to_remove"))

    @concentration.destroy

    redirect_to("/concentrations", :notice => "Concentration deleted successfully.")
  end
end
