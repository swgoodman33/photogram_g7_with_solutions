Rails.application.routes.draw do
  # CREATE
  get("/photos/new", { :controller => "pictures", :action => "new_form" })
  get("/create_photo", { :controller => "pictures", :action => "create_row" })

  # READ
  get("/photos", { :controller => "pictures", :action => "index" })
  get("/photos/:the_id", { :controller => "pictures", :action => "show" })
  get("/", { :controller => "pictures", :action => "index" })

  # UPDATE
  get("/photos/:the_id/edit", { :controller => "pictures", :action => "edit_form" })
  get("/update_photo/:the_id", { :controller => "pictures", :action => "update_row" })

  # DELETE
  get("/delete_photo/:the_id", { :controller => "pictures", :action => "destroy_row" })
end
