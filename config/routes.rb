Rails.application.routes.draw do
  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Concentration resource:

  # CREATE
  get("/concentrations/new", { :controller => "concentrations", :action => "new_form" })
  post("/create_concentration", { :controller => "concentrations", :action => "create_row" })

  # READ
  get("/concentrations", { :controller => "concentrations", :action => "index" })
  get("/concentrations/:id_to_display", { :controller => "concentrations", :action => "show" })

  # UPDATE
  get("/concentrations/:prefill_with_id/edit", { :controller => "concentrations", :action => "edit_form" })
  post("/update_concentration/:id_to_modify", { :controller => "concentrations", :action => "update_row" })

  # DELETE
  get("/delete_concentration/:id_to_remove", { :controller => "concentrations", :action => "destroy_row" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  get("/categories/new", { :controller => "categories", :action => "new_form" })
  post("/create_category", { :controller => "categories", :action => "create_row" })

  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  get("/categories/:id_to_display", { :controller => "categories", :action => "show" })

  # UPDATE
  get("/categories/:prefill_with_id/edit", { :controller => "categories", :action => "edit_form" })
  post("/update_category/:id_to_modify", { :controller => "categories", :action => "update_row" })

  # DELETE
  get("/delete_category/:id_to_remove", { :controller => "categories", :action => "destroy_row" })

  #------------------------------

  # Routes for the Course resource:

  # CREATE
  get("/courses/new", { :controller => "courses", :action => "new_form" })
  post("/create_course", { :controller => "courses", :action => "create_row" })

  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  get("/courses/:id_to_display", { :controller => "courses", :action => "show" })

  # UPDATE
  get("/courses/:prefill_with_id/edit", { :controller => "courses", :action => "edit_form" })
  post("/update_course/:id_to_modify", { :controller => "courses", :action => "update_row" })

  # DELETE
  get("/delete_course/:id_to_remove", { :controller => "courses", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
