LcaToGo::Application.routes.draw do

  resources :transport_repair_datas

  resources :pc_data_qualities do
    get 'intro'   
  end

  resources :pc_transport_datas

  resources :pc_basics

  resources :mt_end_of_life_datas

  resources :mt_user_supplier_datas

  resources :mt_supplier_part_datas

  resources :mt_use_machine_subsystem_datas

  resources :mt_use_operating_resource_datas

  resources :mt_use_additional_energy_datas

  resources :mt_distribution_packaging_datas

  resources :mt_distribution_transport_datas

  resources :mt_manufacturing_main_datas

  resources :mt_manufacturing_resource_datas

  resources :mt_waste_energy_datas

  resources :mt_overhead_energy_datas

  resources :mt_predefined_supplier_datas

  resources  :pc_assessment_method, only: [:show]

  resources :pc_basic_data_entry, only: [:show]
  #get "pc_basic_data_entry/show"

  #get "pc_production/init"
  #
  #get "pc_production/intro"

  resources :pc_production do
    get 'intro'
    get 'init'
  end


  resources :mt_data_qualities do
    get 'intro'   
  end

  resources :mt_end_of_lives

  resources :mt_uses

  resources :mt_distributions

  resources :mt_energy_datas

  resources :mt_manufacturings

  resources :mt_assessments

  resources :mt_supplier_datas

  resources :mt_raw_materials

  resources :mt_material_datas

  resources :st_data_qualities do
    get 'intro'   
  end

  resources :st_end_of_life_datas

  resources :st_end_of_lives

  resources :st_consumable_datas

  resources :st_consumption_datas

  resources :st_uses

  resources :st_transport_datas

  resources :st_packaging_datas

  resources :st_process_datas

  resources :st_energy_datas

  resources :st_material_datas

  resources  :st_material_details

  match 'st_production/:st_product_id/init', to: 'st_production#init', via: [:get], as: 'st_production_init'
  match 'st_production/:st_product_id/intro', to: 'st_production#intro', via: [:get], as: 'st_production_intro'

  resources :se_data_qualities do
    get 'intro'   
  end

  resources :bp_data_qualities do
    get 'intro'   
  end
    
  resources :se_use_consumption_utility_datas

  resources :se_use_consumption_consumable_datas

  resources :bp_packaging_datas

  resources :se_use_consumption_datas


  resources :se_use_product_datas

  resources :se_use_production_datas

  resources :bp_electronic_economics

  resources :bp_economics

  resources :bp_compound_material_datas

  resources :bp_product
  #get "bp_indicators/show"
  resources :bp_indicators, :only => :show

  resources :se_recycling_datas

  resources :se_recyclings

  resources :se_use_costs
  resources :bp_manufacturing_transport_datas


  resources :se_use_consumptions

  resources :se_use_products

  resources :se_use_productions

  resources :se_manufacturing_datas


  resources :data_qualities do
    get 'intro'   
  end

  resources :ph_data_qualities do
    get 'intro'   
  end

  resources :bp_end_of_life_datas

  #get "bp_end_of_life/show"

  resources :bp_end_of_life
  #get "bp_distribution_user_value/update_values"

  #get "bp_manufacturing_process_user_variable/update_values"

  resources :ph_maintenances

  resources :ph_electric_components

  resources :ph_intermediate_results

  resources :ph_specifieds

  resources :ph_basic_informations

  resources :ph_results do
    get 'summary'
    get 'graphic'  
    get 'optimisation'
    get 'pdf'
    collection do
       get 'compare'
    end
  end

  resources :bp_manufacturing_datas

  resources :bp_finishing_datas

  resources :bp_transport_to_customer_datas

  resources :bp_transport_to_converter_datas

  resources :bp_manufacturing

  resources :bp_material_datas

  resources :bp_units

  resources :manufacturing_datas

  resources :product_results do
    get 'graphic'
    get 'pdf'
    collection do
      get 'compare'
    end
  end


  resources :electronic_economics

  resources :economics

  resources :indicators

  resources :reuse_end_of_lives

  resources :recycling_end_of_lives

  resources :consumption_uses

  resources :repair_uses

  resources :consumable_uses

  resources :transport_distributions

  resources :packaging_distributions

  resources :process_datas

  resources :material_datas
  
  resources :repair_datas
  
  resources :recycling_datas  
  
  resources :reuse_datas  
  
  resources :component_datas  

  resources :products

  match 'graphics/generate_pdf'

  resources :graphics
  
  resources :economic_graphics
  resources :bp_economic_graphics  

  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"    
  end  

  resources :production do
    get 'intro'
    get 'init'
  end

  resources :scenarios
  
  resources :bp_production do
    get 'intro'
    get 'init'
  end

  resources :ph_production do
    get 'intro'
    get 'init'
  end

  resources :se_production do
    get 'intro'
    get 'init'
  end

  resources :mt_production do
    get 'intro'
    get 'init'
    get 'improvement'    
  end

  resources :users do
    get 'confirmation_alert'
  end 
  
  resources :bp_transport_to_converter

  resources :bp_transport_to_customer

  resources :manufacturing
 
  resources :distribution
  
  resources :comparison 
  
  resources :summary 
  
  resources :ph_comparison
  
  resources :bp_comparison

  resources :st_comparison  

  resources :mt_comparison  
  
  resources :pc_comparison
  
  resources :use

  resources :end_of_life

  resources :ajax_helpers, :only => [:index], :as => 'ajax_helpers'

  resources :managements

  resources :se_manufacturing
 
  resources :se_results do
    get 'graphic'
    get 'pdf'
  end
    
  resources :bp_results do
    get 'graphic'  
    get 'pdf'
    collection do
      get 'compare'
    end
  end

  resources :mt_results do
    get 'graphic'  
    get 'pdf'
    collection do
      get 'compare'
    end
  end

  resources :pc_results do
    get 'graphic'  
    get 'pdf'
    collection do
      get 'compare'
    end
  end

  resources :st_manufacturings
  resources :st_distributions  
  resources :st_results  do
    get 'graphic'
    get 'pdf'
    collection do
      get 'compare'
    end
  end 

  resources :pc_indicators, :only => :show

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  match 'intros/index' => 'intros#index'
  match 'products/duplicate'  
  match 'production/next_step'  
  match 'manufacturing/next_step'  
  match 'production/next_intro_step'
  match 'distribution/next_step'
  match 'use/next_step'
  match 'end_of_life/next_step'
  match 'material_datas/update_values'

  match 'repair_datas/update_quantity'
  match 'repair_datas/update_upgrade'
  match 'repair_datas/update_overhead'
  match 'recycling_datas/update_value'
  match 'recycling_datas/update_ssd_storage'  
  match 'reuse_datas/update_values'  
  match 'manufacturing_datas/update_values'  
  match 'manufacturing_datas/update_component_age'
  match 'manufacturing_datas/update_component_total_lifetime'  
  match 'consumption_uses/update_consumption'
  match 'consumption_uses/update_timemode'  
  match 'repair_uses/update_values'
  match 'recycling_end_of_lives/update_values'
  match 'reuse_end_of_lives/update_values'  
  match 'managements/update_values'  
  match 'graphics/do_graphics'
  match 'comparison/next_step'
  match 'product_results/next_step'  
  match 'product_results/generate_csv'  
  match 'product_results/compare'
  match 'product_results/pdf'  
  match 'product_results/pdf_compare'  
  match 'bp_results/generate_csv'
  match 'bp_results/generate_csv_economic'
  match 'bp_results/pdf'  
  match 'bp_results/pdf_compare'  
  match 'products/update_comments'
  match 'end_of_life/update_collection_rate'

  match 'bp_production/next_intro_step'
  match 'bp_production/next_step'
  match 'bp_production/update_functional_unit'  
  match 'bp_transport_to_converter/next_step'
  match 'bp_transport_to_converter/previous_step'  
  match 'bp_manufacturing/next_step'
  match 'bp_manufacturing/previous_step'  
  match 'bp_transport_to_customer/next_step'
  match 'bp_transport_to_customer/previous_step'  
  match 'bp_material_datas/update_values'
  match 'bp_compound_material_datas/update_values'
  match 'bp_transport_to_converter_datas/update_values'
  match 'bp_transport_to_customer_datas/update_values'     
  match 'bp_manufacturing_datas/update_values'
  match 'bp_finishing_datas/update_values'  
  match 'bp_manufacturing_process_user_variable/update_values'
  match 'bp_finishing_process_user_variable/update_values'  
  match 'bp_manufacturing_transport_datas/update_values'
  match 'bp_distribution_user_value/update_values'
  match 'bp_end_of_life/next_step'
  match 'bp_end_of_life/previous_step'  
  match 'bp_indicator/previous_step'  
  match 'bp_results/next_step'  
  match 'ph_production/next_intro_step' 
  match 'ph_results/compare' => 'ph_results#compare'
  match 'bp_results/compare'  

  match 'se_production/next_intro_step'
  match 'se_manufacturing_datas/update_values'
  match 'se_use_consumption_consumable_datas/update_values'
  match 'se_use_product_datas/update_values'
  match 'se_manufacturing/next_step'
  match 'se_use_productions/next_step'
  match 'se_use_productions/previous_step'
  match 'se_use_products/next_step'
  match 'se_use_products/previous_step'
  match 'se_use_consumptions/next_step'
  match 'se_use_consumptions/previous_step'
  match 'se_use_costs/next_step'
  match 'se_use_costs/previous_step'
  match 'se_recyclings/next_step'
  match 'se_recyclings/previous_step'
  match 'se_use_consumptions/update_sensor_system_with'
  match 'se_results/generate_csv'

  match 'st_manufacturings/next_step'
  match 'st_manufacturings/previous_step'
  match 'st_distributions/next_step'
  match 'st_distributions/previous_step'
  match 'st_end_of_lives/update_quantity_incineration'
  match 'st_end_of_lives/update_quantity_recycling'  
  match 'st_results/compare'
  match 'st_results/pdf'
  match 'st_results/generate_csv'  
  #match 'se_use_consumption_consumable_datas/update_cost' , :as => 'se_consumable_datas_update_cost'

  match 'mt_raw_materials/next_step'
  match 'mt_manufacturings/next_step'  
  match 'mt_distributions/next_step'  
  match 'mt_results/compare'
  match 'mt_results/generate_csv'
  match 'mt_results/pdf'
  match 'mt_material_datas/update_values'
  match 'mt_predefined_supplier_datas/update_values'  
  match 'mt_predefined_supplier_datas/update_distance'  
  match 'mt_supplier_part_datas/update_distance'  
  match 'mt_user_supplier_datas/update_values'
  match 'mt_user_supplier_datas/update_process'
  match 'mt_energy_datas/update_values'    
  match 'mt_manufacturing_main_datas/update_values'
  match 'mt_overhead_energy_datas/update_values'  
  match 'mt_manufacturing_resource_datas/update_values'
  match 'mt_waste_energy_datas/update_values'  
  match 'mt_distribution_transport_datas/update_distance'
  match 'mt_distribution_packaging_datas/update_values'
  match 'mt_use_additional_energy_datas/update_processing'
  match 'mt_use_additional_energy_datas/update_ready'
  match 'mt_use_additional_energy_datas/update_standby'  
  match 'mt_use_operating_resource_datas/update_processing'
  match 'mt_use_operating_resource_datas/update_ready'
  match 'mt_use_operating_resource_datas/update_standby'  
  match 'mt_use_machine_subsystem_datas/update_processing'
  match 'mt_use_machine_subsystem_datas/update_ready'
  match 'mt_use_machine_subsystem_datas/update_standby'  
  
  
  match 'pc_results/compare'
  match 'pc_results/pdf'
  match 'ph_results/pdf'  
  match 'se_results/pdf'  
  match 'bp_results/pdf'  
  match 'st_results/pdf'  
  match 'pc_results/pdf_compare'
  match 'ph_results/pdf_compare'

  match 'users/generate_excel'  
  match 'intros/confirmation_alert'
  match 'intros/error_duplicated_email'
  match 'packaging_distributions/update_values'
  match 'transport_distributions/update_distance'
  match 'transport_distributions/update_quantity'

  root :to => "products#index"
  
end
