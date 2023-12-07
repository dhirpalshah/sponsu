Rails.application.routes.draw do
  # Routes for the Company resource:

  # CREATE
  post("/insert_company", { :controller => "companies", :action => "create" })
          
  # READ
  get("/companies", { :controller => "companies", :action => "index" })
  
  get("/companies/:path_id", { :controller => "companies", :action => "show" })
  
  # UPDATE
  
  post("/modify_company/:path_id", { :controller => "companies", :action => "update" })
  
  # DELETE
  get("/delete_company/:path_id", { :controller => "companies", :action => "destroy" })

  #------------------------------

  devise_for :company_employees

  devise_scope :company_employee do
    get 'company_employees/login', to: 'company_employees/sessions#new', as: 'company_employee_login'
  end

  authenticated :company_employee do 
    root to: 'company_employees/employee_portal#dashboard', as: :authenticated_company_employee_root
  end  

  # todo: landing page for routes
  # get("/", {:controller => "home", :action => "show"})
  root to: "home#welcome"

  # create student dashboard page
  # todo: if student hasn't filled out their profile, prompt them to do so
  get '/student_dashboard/:id', :to => 'students#dashboard', :as => 'student_dashboard'


  # Routes for the University resource:

  # CREATE
  post("/insert_university", { :controller => "universities", :action => "create" })
          
  # READ
  get("/universities", { :controller => "universities", :action => "index" })
  
  get("/universities/:path_id", { :controller => "universities", :action => "show" })
  
  # UPDATE
  
  post("/modify_university/:path_id", { :controller => "universities", :action => "update" })
  
  # DELETE
  get("/delete_university/:path_id", { :controller => "universities", :action => "destroy" })

  #------------------------------

  # Routes for the University type resource:

  # CREATE
  post("/insert_university_type", { :controller => "university_types", :action => "create" })
          
  # READ
  get("/university_types", { :controller => "university_types", :action => "index" })
  
  get("/university_types/:path_id", { :controller => "university_types", :action => "show" })
  
  # UPDATE
  
  post("/modify_university_type/:path_id", { :controller => "university_types", :action => "update" })
  
  # DELETE
  get("/delete_university_type/:path_id", { :controller => "university_types", :action => "destroy" })

  #------------------------------

  # Routes for the University resource:

  # CREATE
  post("/insert_university_id", { :controller => "university_ids", :action => "create" })
          
  # READ
  get("/university_ids", { :controller => "university_ids", :action => "index" })
  
  get("/university_ids/:path_id", { :controller => "university_ids", :action => "show" })
  
  # UPDATE
  
  post("/modify_university_id/:path_id", { :controller => "university_ids", :action => "update" })
  
  # DELETE
  get("/delete_university_id/:path_id", { :controller => "university_ids", :action => "destroy" })

  #------------------------------

  # Routes for the Major resource:

  # CREATE
  post("/insert_major", { :controller => "majors", :action => "create" })
          
  # READ
  get("/majors", { :controller => "majors", :action => "index" })
  
  get("/majors/:path_id", { :controller => "majors", :action => "show" })
  
  # UPDATE
  
  post("/modify_major/:path_id", { :controller => "majors", :action => "update" })
  
  # DELETE
  get("/delete_major/:path_id", { :controller => "majors", :action => "destroy" })

  #------------------------------

  # Routes for the Students to major resource:

  # CREATE
  post("/insert_students_to_major", { :controller => "students_to_majors", :action => "create" })
          
  # READ
  get("/students_to_majors", { :controller => "students_to_majors", :action => "index" })
  
  get("/students_to_majors/:path_id", { :controller => "students_to_majors", :action => "show" })
  
  # UPDATE
  
  post("/modify_students_to_major/:path_id", { :controller => "students_to_majors", :action => "update" })
  
  # DELETE
  get("/delete_students_to_major/:path_id", { :controller => "students_to_majors", :action => "destroy" })

  #------------------------------

  # Routes for the Gender resource:

  # CREATE
  post("/insert_gender", { :controller => "genders", :action => "create" })
          
  # READ
  get("/genders", { :controller => "genders", :action => "index" })
  
  get("/genders/:path_id", { :controller => "genders", :action => "show" })
  
  # UPDATE
  
  post("/modify_gender/:path_id", { :controller => "genders", :action => "update" })
  
  # DELETE
  get("/delete_gender/:path_id", { :controller => "genders", :action => "destroy" })

  #------------------------------

  # Routes for the Socialmedium resource:

  # CREATE
  post("/insert_socialmedium", { :controller => "socialmedia", :action => "create" })
          
  # READ
  get("/socialmedia", { :controller => "socialmedia", :action => "index" })
  
  get("/socialmedia/:path_id", { :controller => "socialmedia", :action => "show" })
  
  # UPDATE
  
  post("/modify_socialmedium/:path_id", { :controller => "socialmedia", :action => "update" })
  
  # DELETE
  get("/delete_socialmedium/:path_id", { :controller => "socialmedia", :action => "destroy" })

  #------------------------------

  # Routes for the Students to social resource:

  # CREATE
  post("/insert_students_to_social", { :controller => "students_to_socials", :action => "create" })
          
  # READ
  get("/students_to_socials", { :controller => "students_to_socials", :action => "index" })
  
  get("/students_to_socials/:path_id", { :controller => "students_to_socials", :action => "show" })
  
  # UPDATE
  
  post("/modify_students_to_social/:path_id", { :controller => "students_to_socials", :action => "update" })
  
  # DELETE
  get("/delete_students_to_social/:path_id", { :controller => "students_to_socials", :action => "destroy" })

  #------------------------------

  # Routes for the Ethnicity resource:

  # CREATE
  post("/insert_ethnicity", { :controller => "ethnicities", :action => "create" })
          
  # READ
  get("/ethnicities", { :controller => "ethnicities", :action => "index" })
  
  get("/ethnicities/:path_id", { :controller => "ethnicities", :action => "show" })
  
  # UPDATE
  
  post("/modify_ethnicity/:path_id", { :controller => "ethnicities", :action => "update" })
  
  # DELETE
  get("/delete_ethnicity/:path_id", { :controller => "ethnicities", :action => "destroy" })

  #------------------------------

  # Routes for the Student to ethnicity resource:

  # CREATE
  post("/insert_student_to_ethnicity", { :controller => "student_to_ethnicities", :action => "create" })
          
  # READ
  get("/student_to_ethnicities", { :controller => "student_to_ethnicities", :action => "index" })
  
  get("/student_to_ethnicities/:path_id", { :controller => "student_to_ethnicities", :action => "show" })
  
  # UPDATE
  
  post("/modify_student_to_ethnicity/:path_id", { :controller => "student_to_ethnicities", :action => "update" })
  
  # DELETE
  get("/delete_student_to_ethnicity/:path_id", { :controller => "student_to_ethnicities", :action => "destroy" })

  #------------------------------

  # Routes for the Student to interest resource:

  # CREATE
  post("/insert_student_to_interest", { :controller => "student_to_interests", :action => "create" })
          
  # READ
  get("/student_to_interests", { :controller => "student_to_interests", :action => "index" })
  
  get("/student_to_interests/:path_id", { :controller => "student_to_interests", :action => "show" })
  
  # UPDATE
  
  post("/modify_student_to_interest/:path_id", { :controller => "student_to_interests", :action => "update" })
  
  # DELETE
  get("/delete_student_to_interest/:path_id", { :controller => "student_to_interests", :action => "destroy" })

  #------------------------------

  # Routes for the Interest resource:

  # CREATE
  post("/insert_interest", { :controller => "interests", :action => "create" })
          
  # READ
  get("/interests", { :controller => "interests", :action => "index" })
  
  get("/interests/:path_id", { :controller => "interests", :action => "show" })
  
  # UPDATE
  
  post("/modify_interest/:path_id", { :controller => "interests", :action => "update" })
  
  # DELETE
  get("/delete_interest/:path_id", { :controller => "interests", :action => "destroy" })

  #------------------------------

  devise_for :students, controllers: {registrations: 'students/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
