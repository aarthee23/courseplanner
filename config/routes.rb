Rails.application.routes.draw do
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
