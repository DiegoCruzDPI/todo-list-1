Rails.application.routes.draw do
  get("/:path_id", { :controller => "to_dos", :action => "index" })



  # Routes for the To do resource:

  # CREATE
  post("/insert_to_do", { :controller => "to_dos", :action => "create" })
          
  # READ
  get("/to_dos", { :controller => "to_dos", :action => "index" })
  
  get("/to_dos/:path_id", { :controller => "to_dos", :action => "show" })
  
  # UPDATE
  
  post("/modify_to_do/:path_id", { :controller => "to_dos", :action => "update" })
  
  # DELETE
  get("/delete_to_do/:path_id", { :controller => "to_dos", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
