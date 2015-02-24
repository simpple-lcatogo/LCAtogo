# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141001120732) do

  create_table "bp_compound_families", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_compound_family_translations", :force => true do |t|
    t.integer  "bp_compound_family_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_compound_family_translations", ["bp_compound_family_id"], :name => "index_716e3725cc585ef6e60bfc7c0ba064f34e503230"
  add_index "bp_compound_family_translations", ["locale"], :name => "index_bp_compound_family_translations_on_locale"

  create_table "bp_compound_material_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.float    "amount"
    t.integer  "bp_unit_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bp_compound_material_id"
    t.integer  "bp_compound_family_id"
  end

  create_table "bp_compound_material_translations", :force => true do |t|
    t.integer  "bp_compound_material_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_compound_material_translations", ["bp_compound_material_id"], :name => "index_8fa5da98bcf6a3da034fa4b1d0d6b9f4efe12060"
  add_index "bp_compound_material_translations", ["locale"], :name => "index_bp_compound_material_translations_on_locale"

  create_table "bp_compound_materials", :force => true do |t|
    t.string   "name"
    t.integer  "bp_compound_family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "based_type"
  end

  create_table "bp_country_infos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_data_qualities", :force => true do |t|
    t.integer  "bp_product_id"
    t.string   "materials"
    t.string   "transport"
    t.string   "processing"
    t.string   "distribution"
    t.string   "end_of_life"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_distribution_default_value_translations", :force => true do |t|
    t.integer  "bp_distribution_default_value_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_distribution_default_value_translations", ["bp_distribution_default_value_id"], :name => "index_c59d7cd56b1a41790d29495505e15141344c6672"
  add_index "bp_distribution_default_value_translations", ["locale"], :name => "index_bp_distribution_default_value_translations_on_locale"

  create_table "bp_distribution_default_values", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_distribution_user_values", :force => true do |t|
    t.integer  "bp_product_id"
    t.integer  "bp_distribution_default_value_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_economical_families", :force => true do |t|
    t.string   "name"
    t.integer  "bp_economical_phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_economical_flows", :force => true do |t|
    t.string   "name"
    t.integer  "bp_economical_family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_economical_phases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_economics", :force => true do |t|
    t.integer  "bp_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_electronic_economics", :force => true do |t|
    t.integer  "bp_economical_phase_id"
    t.integer  "bp_economical_family_id"
    t.integer  "bp_economical_flow_id"
    t.integer  "bp_material_id"
    t.integer  "bp_compound_material_id"
    t.integer  "bp_vehicle_id"
    t.integer  "bp_manufacturing_process_id"
    t.integer  "bp_distribution_user_value_id"
    t.float    "quantity"
    t.integer  "bp_economic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bp_distribution_default_value_id"
  end

  create_table "bp_end_of_life_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.integer  "bp_end_of_life_default_scenario_id"
    t.float    "custom_landfill"
    t.float    "custom_incineration"
    t.float    "custom_composting"
    t.float    "custom_recycling"
    t.float    "default_transport_distance"
    t.float    "custom_transport_distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_end_of_life_default_scenario_translations", :force => true do |t|
    t.integer  "bp_end_of_life_default_scenario_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_end_of_life_default_scenario_translations", ["bp_end_of_life_default_scenario_id"], :name => "index_2dc560145390e6b916b028c131eef681ad39057b"
  add_index "bp_end_of_life_default_scenario_translations", ["locale"], :name => "index_bp_end_of_life_default_scenario_translations_on_locale"

  create_table "bp_end_of_life_default_scenarios", :force => true do |t|
    t.string   "name"
    t.float    "landfill"
    t.float    "incineration"
    t.float    "composting"
    t.float    "recycling"
    t.boolean  "custom_scenario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section"
  end

  create_table "bp_excel_values", :force => true do |t|
    t.integer  "indicator_id"
    t.string   "flow_name"
    t.string   "functional_unit"
    t.string   "local_name"
    t.string   "life_cycle_phase"
    t.string   "category"
    t.string   "family"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "value",            :precision => 30, :scale => 20
  end

  create_table "bp_finishing_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.integer  "bp_manufacturing_process_id"
    t.float    "quantity"
    t.integer  "bp_unit_id"
    t.text     "comment"
    t.integer  "bp_material_id"
    t.integer  "bp_country_info_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_finishing_process_user_variables", :force => true do |t|
    t.integer  "bp_manufacturing_process_variable_id"
    t.float    "value"
    t.integer  "bp_finishing_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_manufacturing_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.integer  "bp_manufacturing_process_id"
    t.float    "quantity"
    t.integer  "bp_unit_id"
    t.text     "comment",                     :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bp_material_id"
    t.integer  "bp_country_info_id"
  end

  create_table "bp_manufacturing_process_translations", :force => true do |t|
    t.integer  "bp_manufacturing_process_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_manufacturing_process_translations", ["bp_manufacturing_process_id"], :name => "index_614c725071ed0518988c4bbc797ff55ed2f13c24"
  add_index "bp_manufacturing_process_translations", ["locale"], :name => "index_bp_manufacturing_process_translations_on_locale"

  create_table "bp_manufacturing_process_user_variables", :force => true do |t|
    t.integer  "bp_manufacturing_process_variable_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bp_manufacturing_data_id"
  end

  create_table "bp_manufacturing_process_variable_translations", :force => true do |t|
    t.integer  "bp_manufacturing_process_variable_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_manufacturing_process_variable_translations", ["bp_manufacturing_process_variable_id"], :name => "index_03654616f543fa75dcf5fec650f590633d277703"
  add_index "bp_manufacturing_process_variable_translations", ["locale"], :name => "index_bp_manufacturing_process_variable_translations_on_locale"

  create_table "bp_manufacturing_process_variable_values", :force => true do |t|
    t.integer  "bp_material_id"
    t.integer  "bp_manufacturing_process_variable_id"
    t.integer  "bp_manufacturing_process_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "value",                                :precision => 30, :scale => 20
  end

  create_table "bp_manufacturing_process_variables", :force => true do |t|
    t.integer  "bp_manufacturing_process_id"
    t.string   "name"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
  end

  create_table "bp_manufacturing_process_variables_bp_manufacturing_processes", :id => false, :force => true do |t|
    t.integer "bp_manufacturing_process_variable_id"
    t.integer "bp_manufacturing_process_id"
  end

  create_table "bp_manufacturing_processes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "process_type"
  end

  create_table "bp_manufacturing_processes_bp_materials", :id => false, :force => true do |t|
    t.integer "bp_manufacturing_process_id"
    t.integer "bp_material_id"
  end

  create_table "bp_manufacturing_transport_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.integer  "bp_mode_id"
    t.integer  "bp_vehicle_id"
    t.float    "distance"
    t.float    "amount"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_material_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.integer  "bp_material_id"
    t.float    "quantity"
    t.integer  "bp_unit_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_material_translations", :force => true do |t|
    t.integer  "bp_material_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_material_translations", ["bp_material_id"], :name => "index_bp_material_translations_on_bp_material_id"
  add_index "bp_material_translations", ["locale"], :name => "index_bp_material_translations_on_locale"

  create_table "bp_materials", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "based_type"
  end

  create_table "bp_mode_translations", :force => true do |t|
    t.integer  "bp_mode_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_mode_translations", ["bp_mode_id"], :name => "index_bp_mode_translations_on_bp_mode_id"
  add_index "bp_mode_translations", ["locale"], :name => "index_bp_mode_translations_on_locale"

  create_table "bp_modes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_packaging_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.float    "amount"
    t.integer  "bp_distribution_default_value_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment"
  end

  create_table "bp_product_results", :force => true do |t|
    t.integer  "bp_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_products", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "functional_unit"
  end

  create_table "bp_result_values", :force => true do |t|
    t.integer  "bp_result_id"
    t.integer  "indicator_id"
    t.float    "value"
    t.float    "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_results", :force => true do |t|
    t.integer  "bp_product_result_id"
    t.string   "name_en"
    t.string   "name_ca"
    t.string   "name_es"
    t.integer  "parent_id"
    t.boolean  "check_graphic",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_transport_to_converter_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.integer  "bp_mode_id"
    t.integer  "bp_vehicle_id"
    t.float    "distance"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment",       :limit => 255
  end

  create_table "bp_transport_to_customer_datas", :force => true do |t|
    t.integer  "bp_product_id"
    t.integer  "bp_mode_id"
    t.integer  "bp_vehicle_id"
    t.float    "distance"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment",       :limit => 255
  end

  create_table "bp_unit_translations", :force => true do |t|
    t.integer  "bp_unit_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_unit_translations", ["bp_unit_id"], :name => "index_bp_unit_translations_on_bp_unit_id"
  add_index "bp_unit_translations", ["locale"], :name => "index_bp_unit_translations_on_locale"

  create_table "bp_units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bp_vehicle_translations", :force => true do |t|
    t.integer  "bp_vehicle_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bp_vehicle_translations", ["bp_vehicle_id"], :name => "index_bp_vehicle_translations_on_bp_vehicle_id"
  add_index "bp_vehicle_translations", ["locale"], :name => "index_bp_vehicle_translations_on_locale"

  create_table "bp_vehicles", :force => true do |t|
    t.string   "name"
    t.integer  "bp_mode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "component_datas", :force => true do |t|
    t.integer  "data_module_id"
    t.integer  "family_id"
    t.integer  "material_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.string   "module_text"
    t.float    "ratio"
    t.float    "aspect"
    t.float    "diagonal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumable_uses", :force => true do |t|
    t.integer  "material_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumption_uses", :force => true do |t|
    t.integer  "energy_mode_id"
    t.integer  "family_id"
    t.integer  "energy_type_id"
    t.float    "consumption"
    t.float    "time_mode"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_other"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_translations", :force => true do |t|
    t.integer  "country_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "country_translations", ["country_id"], :name => "index_country_translations_on_country_id"
  add_index "country_translations", ["locale"], :name => "index_country_translations_on_locale"

  create_table "data_mode_translations", :force => true do |t|
    t.integer  "data_mode_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_mode_translations", ["data_mode_id"], :name => "index_data_mode_translations_on_data_mode_id"
  add_index "data_mode_translations", ["locale"], :name => "index_data_mode_translations_on_locale"

  create_table "data_modes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_module_translations", :force => true do |t|
    t.integer  "data_module_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_module_translations", ["data_module_id"], :name => "index_data_module_translations_on_data_module_id"
  add_index "data_module_translations", ["locale"], :name => "index_data_module_translations_on_locale"

  create_table "data_modules", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_process_translations", :force => true do |t|
    t.integer  "data_process_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_process_translations", ["data_process_id"], :name => "index_0179c15e07fe79b4121247f633ebbe0002634d4e"
  add_index "data_process_translations", ["locale"], :name => "index_data_process_translations_on_locale"

  create_table "data_processes", :force => true do |t|
    t.string   "name"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_qualities", :force => true do |t|
    t.integer  "product_id"
    t.string   "materials"
    t.string   "manufacturing", :default => "illustrative"
    t.string   "distribution",  :default => "illustrative"
    t.string   "use",           :default => "illustrative"
    t.string   "end_of_life",   :default => "illustrative"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "economical_families", :force => true do |t|
    t.string   "name"
    t.integer  "economical_phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "economical_family_translations", :force => true do |t|
    t.integer  "economical_family_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "economical_family_translations", ["economical_family_id"], :name => "index_da49bc341778392a534f656b64fb94279f709421"
  add_index "economical_family_translations", ["locale"], :name => "index_economical_family_translations_on_locale"

  create_table "economical_flow_translations", :force => true do |t|
    t.integer  "economical_flow_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "economical_flow_translations", ["economical_flow_id"], :name => "index_c0f9f70b62277d63f51f0544308f05f72cdba754"
  add_index "economical_flow_translations", ["locale"], :name => "index_economical_flow_translations_on_locale"

  create_table "economical_flows", :force => true do |t|
    t.string   "name"
    t.integer  "economical_family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "economical_phase_translations", :force => true do |t|
    t.integer  "economical_phase_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "economical_phase_translations", ["economical_phase_id"], :name => "index_4a640c0a258c7fe4f858cc2ebadbf2991a7a797b"
  add_index "economical_phase_translations", ["locale"], :name => "index_economical_phase_translations_on_locale"

  create_table "economical_phases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "economics", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electronic_economics", :force => true do |t|
    t.integer  "economical_phase_id"
    t.integer  "economical_family_id"
    t.integer  "economical_flow_id"
    t.float    "quantity"
    t.integer  "economic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "material_id"
    t.string   "unit"
    t.integer  "energy_type_id"
  end

  create_table "end_of_lives", :force => true do |t|
    t.float    "landfill"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "collection_rate", :default => 50.0
  end

  create_table "energy_mode_translations", :force => true do |t|
    t.integer  "energy_mode_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "energy_mode_translations", ["energy_mode_id"], :name => "index_energy_mode_translations_on_energy_mode_id"
  add_index "energy_mode_translations", ["locale"], :name => "index_energy_mode_translations_on_locale"

  create_table "energy_modes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "energy_type_translations", :force => true do |t|
    t.integer  "energy_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "energy_type_translations", ["energy_type_id"], :name => "index_energy_type_translations_on_energy_type_id"
  add_index "energy_type_translations", ["locale"], :name => "index_energy_type_translations_on_locale"

  create_table "energy_types", :force => true do |t|
    t.string   "name"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "consumption"
  end

  create_table "excel_value_users", :force => true do |t|
    t.integer  "excel_value_id"
    t.integer  "user_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "excel_values", :force => true do |t|
    t.integer  "indicator_id"
    t.string   "name"
    t.string   "family"
    t.string   "phase"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "material_id"
  end

  create_table "families", :force => true do |t|
    t.string   "name"
    t.integer  "data_module_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "energy_mode_id"
    t.string   "stage"
  end

  create_table "family_translations", :force => true do |t|
    t.integer  "family_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "family_translations", ["family_id"], :name => "index_family_translations_on_family_id"
  add_index "family_translations", ["locale"], :name => "index_family_translations_on_locale"

  create_table "indicator_translations", :force => true do |t|
    t.integer  "indicator_id"
    t.string   "locale"
    t.string   "name"
    t.string   "unit"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "indicator_translations", ["indicator_id"], :name => "index_indicator_translations_on_indicator_id"
  add_index "indicator_translations", ["locale"], :name => "index_indicator_translations_on_locale"

  create_table "indicators", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sector"
    t.string   "abbr"
    t.string   "category"
    t.string   "subcategory"
  end

  create_table "indicators_products", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "indicator_id"
  end

  create_table "machines", :force => true do |t|
    t.string   "name_1"
    t.string   "name_2"
    t.string   "labor"
    t.string   "power"
    t.string   "energy"
    t.string   "unit"
    t.float    "consumption"
    t.float    "performance"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturing_datas", :force => true do |t|
    t.integer  "data_module_id"
    t.integer  "family_id"
    t.integer  "material_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.float    "ratio"
    t.float    "aspect"
    t.float    "diagonal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "module_text"
    t.float    "component_age"
    t.float    "component_total_lifetime"
    t.float    "overhead_cutoffs"
    t.float    "overhead_cutoffs_stamped"
    t.float    "overhead_milled"
    t.string   "material_user_name"
    t.float    "user_quantity"
    t.float    "user_global_warming"
    t.float    "contained_data"
    t.float    "repair_contained_data"
    t.float    "anticipated_data"
    t.float    "repair_anticipated_data"
    t.string   "material_user_type"
  end

  create_table "material_datas", :force => true do |t|
    t.integer  "data_module_id"
    t.integer  "family_id"
    t.integer  "material_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "aspect"
    t.float    "diagonal"
    t.float    "ratio"
    t.string   "module_text"
  end

  create_table "material_translations", :force => true do |t|
    t.integer  "material_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
  end

  add_index "material_translations", ["locale"], :name => "index_material_translations_on_locale"
  add_index "material_translations", ["material_id"], :name => "index_material_translations_on_material_id"

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
    t.float    "reuse_factor"
    t.float    "recycling_factor"
  end

  create_table "mt_assessments", :force => true do |t|
    t.integer  "mt_product_id"
    t.float    "weight"
    t.float    "lifetime"
    t.string   "assessment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_type"
    t.integer  "mt_product_type_id"
  end

  create_table "mt_consumables", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_data_qualities", :force => true do |t|
    t.integer  "mt_product_id"
    t.string   "materials"
    t.string   "manufacturing"
    t.string   "distribution"
    t.string   "use"
    t.string   "end_of_life"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_distribution_packaging_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_material_id"
    t.float    "quantity"
    t.string   "scenario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_distribution_transport_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_transport_type_id"
    t.float    "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_distributions", :force => true do |t|
    t.integer  "mt_product_id"
    t.float    "packaging"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "options"
  end

  create_table "mt_end_of_life_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_family_id"
    t.integer  "mt_material_id"
    t.float    "quantity"
    t.string   "scenario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_end_of_lives", :force => true do |t|
    t.integer  "mt_product_id"
    t.string   "waste_streams"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_energy_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_energy_family_id"
    t.integer  "mt_energy_process_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_energy_families", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_energy_processes", :force => true do |t|
    t.string   "name"
    t.integer  "mt_energy_family_id"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_families", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_manufacturing_main_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_manufacturing_process_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_manufacturing_processes", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_manufacturing_resource_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_consumable_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_manufacturings", :force => true do |t|
    t.integer  "mt_product_id"
    t.float    "waste"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_material_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_family_id"
    t.integer  "mt_material_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "module"
    t.string   "scenario"
    t.text     "comments"
  end

  create_table "mt_materials", :force => true do |t|
    t.string   "name"
    t.integer  "mt_family_id"
    t.string   "unit"
    t.boolean  "general"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "recycling"
    t.float    "incineration"
    t.float    "landfill"
  end

  create_table "mt_overhead_energy_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_energy_family_id"
    t.integer  "mt_energy_process_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_predefined_supplier_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_family_id"
    t.integer  "mt_material_id"
    t.float    "quantity"
    t.integer  "mt_transport_type_id"
    t.float    "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scenario"
  end

  create_table "mt_product_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_products", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_result_values", :force => true do |t|
    t.integer  "mt_result_id"
    t.integer  "indicator_id"
    t.float    "value"
    t.float    "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_results", :force => true do |t|
    t.integer  "mt_product_id"
    t.string   "name_en"
    t.string   "name_ca"
    t.string   "name_es"
    t.integer  "parent_id"
    t.boolean  "check_graphic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_checkbox",  :default => false
    t.integer  "shift",         :default => -1
  end

  create_table "mt_subsystems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "processing"
    t.float    "ready"
    t.float    "standby"
  end

  create_table "mt_supplier_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_family_id"
    t.integer  "mt_material_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_supplier_part_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.string   "name"
    t.integer  "mt_transport_type_id"
    t.float    "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scenario"
  end

  create_table "mt_transport_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_use_additional_energy_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.float    "processing"
    t.float    "ready"
    t.float    "standby"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mt_energy_family_id"
    t.integer  "mt_energy_process_id"
  end

  create_table "mt_use_machine_subsystem_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_subsystem_id"
    t.float    "processing"
    t.float    "ready"
    t.float    "standby"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subsystem_name"
  end

  create_table "mt_use_operating_resource_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.float    "processing"
    t.float    "ready"
    t.float    "standby"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mt_consumable_id"
  end

  create_table "mt_user_supplier_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.integer  "mt_supplier_part_data_id"
    t.integer  "mt_family_id"
    t.integer  "mt_material_id"
    t.float    "quantity"
    t.integer  "mt_manufacturing_process_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scenario"
  end

  create_table "mt_uses", :force => true do |t|
    t.integer  "mt_product_id"
    t.float    "processing"
    t.float    "ready"
    t.float    "standby"
    t.float    "working_days"
    t.float    "parts_produced"
    t.string   "description"
    t.float    "shifts_day"
    t.float    "hours_shift_processing"
    t.float    "hours_shift_ready"
    t.float    "hours_shift_standby"
    t.integer  "mt_energy_process_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description_2"
    t.string   "description_3"
    t.float    "hours_shift_processing_2"
    t.float    "hours_shift_processing_3"
    t.float    "hours_shift_ready_2"
    t.float    "hours_shift_ready_3"
    t.float    "hours_shift_standby_2"
    t.float    "hours_shift_standby_3"
    t.float    "shifts_day_2"
    t.float    "shifts_day_3"
    t.float    "working_days_2"
    t.float    "working_days_3"
    t.float    "parts_produced_2"
    t.float    "parts_produced_3"
    t.string   "breakdown"
    t.float    "hours_shift_off"
    t.float    "hours_shift_off_2"
    t.float    "hours_shift_off_3"
  end

  create_table "mt_waste_energy_datas", :force => true do |t|
    t.integer  "mt_product_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mt_family_id"
    t.integer  "mt_material_id"
  end

  create_table "packaging_distributions", :force => true do |t|
    t.float    "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
    t.integer  "packaging_id"
  end

  create_table "packagings", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_basics", :force => true do |t|
    t.integer  "pc_product_id"
    t.integer  "pc_country_info_id"
    t.string   "pcb_mark"
    t.string   "pcb_type"
    t.float    "pcb_area"
    t.integer  "pcb_number"
    t.integer  "layers"
    t.integer  "pc_coating_type_id"
    t.string   "rohs_compliant"
    t.text     "comments"
    t.string   "assessment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "water"
    t.float    "electric"
    t.float    "heat"
    t.float    "waste"
    t.float    "ghg"
    t.float    "pcbs"
  end

  create_table "pc_coating_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_country_infos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_data_qualities", :force => true do |t|
    t.integer  "pc_product_id"
    t.string   "water_consumption"
    t.string   "electric_consumption"
    t.string   "heat_consumption"
    t.string   "sludge"
    t.string   "ghc_emissions"
    t.string   "pcbs_production"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_excel_values", :force => true do |t|
    t.integer  "indicator_id"
    t.string   "name"
    t.string   "lifecycle"
    t.string   "category"
    t.string   "family"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_products", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_result_values", :force => true do |t|
    t.integer  "pc_product_id"
    t.integer  "indicator_id"
    t.float    "value_one"
    t.float    "value_n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_transport_datas", :force => true do |t|
    t.integer  "pc_product_id"
    t.integer  "pc_transport_type_id"
    t.float    "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_transport_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_basic_informations", :force => true do |t|
    t.integer  "ph_product_id"
    t.integer  "ph_country_info_id"
    t.float    "radiation",           :default => 1000.0
    t.float    "temperature",         :default => 25.0
    t.integer  "ph_mounting_type_id"
    t.float    "performance_ratio",   :default => 0.75
    t.string   "known"
    t.string   "known_module_type"
    t.string   "framed"
    t.float    "co2_factor"
    t.float    "conversion_factor",   :default => 0.33
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "working"
    t.string   "know_power"
    t.float    "user_power"
  end

  create_table "ph_battery_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_country_infos", :force => true do |t|
    t.string   "name"
    t.float    "co2"
    t.float    "mg"
    t.float    "poly"
    t.float    "wafers"
    t.float    "cells"
    t.float    "modules"
    t.float    "cdte"
    t.float    "cigs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_data_qualities", :force => true do |t|
    t.integer  "ph_product_id"
    t.string   "country_use"
    t.string   "module_temperature"
    t.string   "performance_ratio"
    t.string   "module_specifications"
    t.string   "production_countries"
    t.string   "inverter"
    t.string   "batteries"
    t.string   "maintenance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_database_material_values", :force => true do |t|
    t.integer  "ph_product_id"
    t.integer  "ph_database_material_id"
    t.float    "co2_value"
    t.float    "pe_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_database_materials", :force => true do |t|
    t.string   "module"
    t.string   "target"
    t.float    "default_value_co2"
    t.float    "default_value_pe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_electric_components", :force => true do |t|
    t.integer  "ph_product_id"
    t.float    "inverter_size_1",    :default => 0.0
    t.float    "inverter_size_2",    :default => 0.0
    t.float    "quantity_1",         :default => 0.0
    t.float    "quantity_2",         :default => 0.0
    t.float    "lifetime_1",         :default => 0.0
    t.float    "lifetime_2",         :default => 0.0
    t.string   "include_batteries"
    t.integer  "ph_battery_type_id"
    t.float    "capacity_battery"
    t.float    "separated_battery"
    t.float    "battery_lifetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "weight_battery"
  end

  create_table "ph_embedded_results", :force => true do |t|
    t.integer  "ph_product_id"
    t.float    "lifetime_saved"
    t.float    "embedded_energy_total"
    t.float    "pe_pv_cabling"
    t.float    "pe_pv_module"
    t.float    "pe_pv_framing"
    t.float    "pe_pv_mounting"
    t.float    "pe_inverter"
    t.float    "pe_batteries"
    t.float    "pe_maintenance"
    t.float    "peak_power"
    t.float    "lifetime_production"
    t.float    "averaged_power"
    t.float    "averaged_consumption"
    t.float    "system_emb"
    t.float    "energy_payback"
    t.float    "energy_yield"
    t.float    "emb_co2"
    t.float    "estim_co2"
    t.float    "net_saved_co2"
    t.float    "temperature_induced"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_intermediate_results", :force => true do |t|
    t.integer  "ph_product_id"
    t.text     "evaluation"
    t.float    "module_area"
    t.integer  "silicon_country_id"
    t.float    "silicon_co2",          :default => 449.48
    t.integer  "wafers_country_id"
    t.float    "wafers_co2",           :default => 487.34
    t.integer  "cells_country_id"
    t.float    "cells_co2",            :default => 635.81
    t.integer  "modules_country_id"
    t.float    "modules_co2",          :default => 627.51
    t.integer  "cadmium_country_id"
    t.float    "cadmium_co2",          :default => 636.61
    t.integer  "cis_country_id"
    t.float    "cis_co2",              :default => 482.04
    t.integer  "amorphous_country_id"
    t.float    "amorphous_co2",        :default => 504.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_maintenance_results", :force => true do |t|
    t.integer  "ph_product_id"
    t.float    "years_included"
    t.float    "inverter_replacement"
    t.float    "batteries_replacement"
    t.float    "tap_water_l"
    t.float    "tap_water_co2"
    t.float    "tap_water_pe"
    t.float    "needed_cycles_1"
    t.float    "needed_replacements_1"
    t.float    "embodied_co2_1"
    t.float    "embodied_pe_1"
    t.float    "needed_cycles_2"
    t.float    "needed_replacements_2"
    t.float    "embodied_co2_2"
    t.float    "embodied_pe_2"
    t.float    "driven_maintenance"
    t.float    "driven_year"
    t.float    "driven_contract"
    t.float    "embodied_co2_transport"
    t.float    "embodied_pe_transport"
    t.float    "embodied_co2_cleaning"
    t.float    "embodied_pe_cleaning"
    t.float    "total_embodied_co2_cleaning"
    t.float    "total_embodied_pe_cleaning"
    t.float    "needed_cycles_batteries"
    t.float    "needed_replacements_batteries"
    t.float    "embodied_co2_batteries"
    t.float    "embodied_pe_batteries"
    t.float    "embodied_carbon_dioxide"
    t.float    "embodied_primary_energy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_maintenances", :force => true do |t|
    t.integer  "ph_product_id"
    t.string   "maintenance_needs"
    t.string   "replacement_inverters"
    t.string   "replacement_batteries"
    t.string   "cleaning_modules"
    t.float    "yearly_frequency"
    t.float    "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_module_types", :force => true do |t|
    t.string   "name"
    t.float    "efficiency"
    t.float    "lifetime"
    t.float    "records"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_mounting_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_products", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "tmp_peak"
    t.float    "tmp_yearly"
  end

  create_table "ph_results", :force => true do |t|
    t.integer  "ph_product_id"
    t.float    "lifetime"
    t.float    "co2_total"
    t.float    "cabling"
    t.float    "module"
    t.float    "framing"
    t.float    "mounting"
    t.float    "inverter"
    t.float    "batteries"
    t.float    "maintenance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_specifieds", :force => true do |t|
    t.integer  "ph_product_id"
    t.float    "area",              :default => 0.0
    t.integer  "area_unit_id"
    t.float    "power",             :default => 0.0
    t.integer  "power_unit_id"
    t.float    "efficiency"
    t.float    "lifetime"
    t.string   "bench_efficiency"
    t.string   "bench_insolation"
    t.string   "bench_performance"
    t.string   "bench_lifetime"
    t.integer  "ph_module_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ph_units", :force => true do |t|
    t.string   "name"
    t.string   "unit_filter"
    t.float    "conversion_factor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "process_datas", :force => true do |t|
    t.integer  "data_module_id"
    t.integer  "family_id"
    t.integer  "data_process_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_results", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "organisation"
    t.string   "person_name"
    t.string   "name"
    t.string   "version"
    t.text     "description"
    t.string   "sector"
    t.string   "language"
    t.boolean  "assessment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "step"
    t.text     "kepi_explanation"
    t.text     "comparison_comments"
    t.text     "production_comments"
    t.text     "use_comments"
    t.float    "overhead_miscellaneous", :default => 10.0
    t.float    "ssd_storage"
    t.boolean  "is_default_product",     :default => false
  end

  create_table "recycling_datas", :force => true do |t|
    t.integer  "product_id"
    t.integer  "material_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
    t.integer  "manufacturing_data_id"
  end

  create_table "recycling_end_of_lives", :force => true do |t|
    t.integer  "family_id"
    t.integer  "material_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repair_datas", :force => true do |t|
    t.float    "quantity"
    t.float    "upgrade_year"
    t.float    "overheads_cut_offs"
    t.integer  "manufacturing_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repair_uses", :force => true do |t|
    t.integer  "family_id"
    t.integer  "material_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "result_values", :force => true do |t|
    t.integer  "result_id"
    t.integer  "indicator_id"
    t.float    "value"
    t.float    "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.integer  "product_result_id"
    t.string   "name_en"
    t.string   "name_ca"
    t.string   "name_es"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "check_graphic"
    t.integer  "family_id"
    t.boolean  "has_checkbox",      :default => false
  end

  create_table "reuse_datas", :force => true do |t|
    t.integer  "product_id"
    t.integer  "material_id"
    t.float    "contained"
    t.float    "anticipated"
    t.float    "contained_repair"
    t.float    "anticipated_repair"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reuse_end_of_lives", :force => true do |t|
    t.integer  "family_id"
    t.integer  "material_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenarios", :force => true do |t|
    t.integer  "product_id"
    t.float    "use_lifetime"
    t.float    "annual_failure"
    t.float    "repair_likeness"
    t.text     "hardware_measures"
    t.text     "software_measures"
    t.text     "service_measures"
    t.text     "business_measures"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_component_translations", :force => true do |t|
    t.integer  "se_component_id"
    t.string   "locale"
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "se_component_translations", ["locale"], :name => "index_se_component_translations_on_locale"
  add_index "se_component_translations", ["se_component_id"], :name => "index_1744006109da1208e246a848788d8a1e026ff2e9"

  create_table "se_components", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_consumable_translations", :force => true do |t|
    t.integer  "se_consumable_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "se_consumable_translations", ["locale"], :name => "index_se_consumable_translations_on_locale"
  add_index "se_consumable_translations", ["se_consumable_id"], :name => "index_c1f9d8525a1193cf935ff7a5cb07e18df174846a"

  create_table "se_consumables", :force => true do |t|
    t.string   "name"
    t.string   "excel_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_country_infos", :force => true do |t|
    t.string   "name"
    t.float    "electricity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "se_data_qualities", :force => true do |t|
    t.integer  "se_product_id"
    t.string   "life_cycle"
    t.string   "energy_usage"
    t.string   "consumables_usage"
    t.string   "utilities_usage"
    t.string   "yield_loss"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_energy_type_translations", :force => true do |t|
    t.integer  "se_energy_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "se_energy_type_translations", ["locale"], :name => "index_se_energy_type_translations_on_locale"
  add_index "se_energy_type_translations", ["se_energy_type_id"], :name => "index_244cd8db088c6e72fb7268a8dff5d12da6a5a3e5"

  create_table "se_energy_types", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_energy_use_translations", :force => true do |t|
    t.integer  "se_energy_use_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "se_energy_use_translations", ["locale"], :name => "index_se_energy_use_translations_on_locale"
  add_index "se_energy_use_translations", ["se_energy_use_id"], :name => "index_8a1c06bbeba5d7fac5908e5e8de1d983f9e7d6ca"

  create_table "se_energy_uses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_manufacturing_datas", :force => true do |t|
    t.integer  "se_product_id"
    t.string   "sensor_node_description"
    t.integer  "number"
    t.integer  "se_component_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_manufacturings", :force => true do |t|
    t.integer  "se_product_id"
    t.float    "cables"
    t.float    "sensor_lifetime"
    t.float    "battery_lifetime"
    t.float    "cable_lifetime"
    t.float    "purchase"
    t.float    "installation"
    t.float    "maintenance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_materials", :force => true do |t|
    t.string   "name"
    t.string   "excel_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_production_yield_loss_material_translations", :force => true do |t|
    t.integer  "se_production_yield_loss_material_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "se_production_yield_loss_material_translations", ["locale"], :name => "index_se_production_yield_loss_material_translations_on_locale"
  add_index "se_production_yield_loss_material_translations", ["se_production_yield_loss_material_id"], :name => "index_188925b784746fe6bd3b88758e864df9d4d1a565"

  create_table "se_production_yield_loss_materials", :force => true do |t|
    t.string   "name"
    t.string   "action"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_products", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_recycling_datas", :force => true do |t|
    t.integer  "se_product_id"
    t.integer  "se_production_yield_loss_material_id"
    t.float    "with_sensor"
    t.float    "without_sensor"
    t.float    "recycling_revenue"
    t.text     "description"
    t.float    "global_warming_potential"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_results", :force => true do |t|
    t.integer  "se_product_id"
    t.float    "sensor_kg_year_with"
    t.float    "energy_kg_year_with"
    t.float    "consumables_kg_year_with"
    t.float    "utilities_kg_year_with"
    t.float    "yield_kg_year_with"
    t.float    "sensor_kg_product_with"
    t.float    "energy_kg_product_with"
    t.float    "consumables_kg_product_with"
    t.float    "utilities_kg_product_with"
    t.float    "yield_kg_product_with"
    t.float    "sensor_kg_year_without"
    t.float    "energy_kg_year_without"
    t.float    "consumables_kg_year_without"
    t.float    "utilities_kg_year_without"
    t.float    "yield_kg_year_without"
    t.float    "sensor_kg_product_without"
    t.float    "energy_kg_product_without"
    t.float    "consumables_kg_product_without"
    t.float    "utilities_kg_product_without"
    t.float    "yield_kg_product_without"
    t.float    "sensor_euro_year_with"
    t.float    "production_euro_year_with"
    t.float    "value_euro_year_with"
    t.float    "yield_euro_year_with"
    t.float    "sensor_euro_product_with"
    t.float    "production_euro_product_with"
    t.float    "value_euro_product_with"
    t.float    "yield_euro_product_with"
    t.float    "sensor_euro_year_without"
    t.float    "production_euro_year_without"
    t.float    "value_euro_year_without"
    t.float    "yield_euro_year_without"
    t.float    "sensor_euro_product_without"
    t.float    "production_euro_product_without"
    t.float    "value_euro_product_without"
    t.float    "yield_euro_product_without"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_use_consumption_consumable_datas", :force => true do |t|
    t.integer  "se_product_id"
    t.integer  "se_consumable_id"
    t.float    "with_sensor"
    t.float    "without_sensor"
    t.text     "description"
    t.float    "global_warming_potential"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "cost"
  end

  create_table "se_use_consumption_datas", :force => true do |t|
    t.integer  "se_product_id"
    t.integer  "se_energy_type_id"
    t.integer  "se_energy_use_id"
    t.float    "with_sensor"
    t.float    "without_sensor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_use_consumption_utility_datas", :force => true do |t|
    t.integer  "se_product_id"
    t.integer  "se_utility_id"
    t.float    "with_sensor"
    t.float    "without_sensor"
    t.float    "electricity_consumption"
    t.float    "temperature_difference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_use_consumptions", :force => true do |t|
    t.integer  "se_product_id"
    t.float    "sensor_system_with"
    t.float    "sensor_system_without"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_use_costs", :force => true do |t|
    t.integer  "se_product_id"
    t.float    "machine_fixed"
    t.float    "machine_variable"
    t.float    "personnel_with"
    t.float    "personnel_without"
    t.float    "maintenance_with"
    t.float    "maintenance_without"
    t.float    "spare_parts_with"
    t.float    "spare_parts_without"
    t.float    "spare_parts_storage"
    t.float    "electricity"
    t.float    "heat"
    t.float    "gas"
    t.float    "fuels"
    t.float    "raw_material"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_use_product_datas", :force => true do |t|
    t.integer  "se_product_id"
    t.string   "output_description"
    t.float    "share_with_sensor"
    t.float    "share_without_sensor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "cost",                 :limit => 255
  end

  create_table "se_use_production_datas", :force => true do |t|
    t.integer  "se_product_id"
    t.string   "downtime_level_description"
    t.float    "occurrance_with_sensor"
    t.float    "avg_duration_with_sensor"
    t.float    "occurance_without_sensor"
    t.float    "avg_duration_without_sensor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_use_productions", :force => true do |t|
    t.integer  "se_country_info_id"
    t.float    "maximum_production"
    t.float    "closing_times"
    t.float    "operation_time"
    t.integer  "se_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_use_products", :force => true do |t|
    t.integer  "se_product_id"
    t.float    "output_with"
    t.float    "output_without"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_utilities", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.string   "excel_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "se_utility_translations", :force => true do |t|
    t.integer  "se_utility_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "se_utility_translations", ["locale"], :name => "index_se_utility_translations_on_locale"
  add_index "se_utility_translations", ["se_utility_id"], :name => "index_se_utility_translations_on_se_utility_id"

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors_users", :id => false, :force => true do |t|
    t.integer "sector_id"
    t.integer "user_id"
  end

  create_table "st_consumable_datas", :force => true do |t|
    t.integer  "st_product_id"
    t.integer  "st_family_id"
    t.integer  "st_material_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "eco_cost"
  end

  create_table "st_consumption_datas", :force => true do |t|
    t.integer  "st_product_id"
    t.integer  "st_energy_type_id"
    t.integer  "st_energy_source_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "eco_cost"
    t.float    "charges"
  end

  create_table "st_data_qualities", :force => true do |t|
    t.integer  "st_product_id"
    t.string   "materials"
    t.string   "manufacturing"
    t.string   "distribution"
    t.string   "use"
    t.string   "end_of_life"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_end_of_life_datas", :force => true do |t|
    t.integer  "st_product_id"
    t.integer  "st_material_data_id"
    t.integer  "st_packaging_data_id"
    t.integer  "st_consumable_data_id"
    t.float    "quantity_recycling"
    t.float    "quantity_incineration"
    t.float    "eco_cost_recycling"
    t.float    "eco_cost_incineration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_end_of_lives", :force => true do |t|
    t.integer  "st_product_id"
    t.string   "repair"
    t.float    "lifetime"
    t.string   "selected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_energy_datas", :force => true do |t|
    t.integer  "st_product_id"
    t.integer  "st_energy_type_id"
    t.integer  "st_energy_source_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "eco_cost"
  end

  create_table "st_energy_source_translations", :force => true do |t|
    t.integer  "st_energy_source_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_energy_source_translations", ["locale"], :name => "index_st_energy_source_translations_on_locale"
  add_index "st_energy_source_translations", ["st_energy_source_id"], :name => "index_57ada1ef6a878d4f31cd664d64ff5c6de27d465a"

  create_table "st_energy_sources", :force => true do |t|
    t.string   "name"
    t.integer  "st_energy_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_energy_type_translations", :force => true do |t|
    t.integer  "st_energy_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_energy_type_translations", ["locale"], :name => "index_st_energy_type_translations_on_locale"
  add_index "st_energy_type_translations", ["st_energy_type_id"], :name => "index_3d4f115b0a628ffa0a64e0e1e8ee90f35f11d2d9"

  create_table "st_energy_types", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_excel_values", :force => true do |t|
    t.integer  "indicator_id"
    t.string   "flow_name"
    t.string   "functional_unit"
    t.string   "local_name"
    t.string   "life_cycle_phase"
    t.string   "category"
    t.string   "family"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_families", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_family_process_translations", :force => true do |t|
    t.integer  "st_family_process_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_family_process_translations", ["locale"], :name => "index_st_family_process_translations_on_locale"
  add_index "st_family_process_translations", ["st_family_process_id"], :name => "index_42559a4a66ef573ac963da98e630541fffa000b7"

  create_table "st_family_processes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_family_translations", :force => true do |t|
    t.integer  "st_family_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_family_translations", ["locale"], :name => "index_st_family_translations_on_locale"
  add_index "st_family_translations", ["st_family_id"], :name => "index_st_family_translations_on_st_family_id"

  create_table "st_family_transport_translations", :force => true do |t|
    t.integer  "st_family_transport_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_family_transport_translations", ["locale"], :name => "index_st_family_transport_translations_on_locale"
  add_index "st_family_transport_translations", ["st_family_transport_id"], :name => "index_fdb1877855a03dc88511bc355bb05e4bd3e46691"

  create_table "st_family_transports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_material_datas", :force => true do |t|
    t.integer  "st_product_id"
    t.integer  "st_family_id"
    t.integer  "st_material_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "eco_cost"
    t.string   "user_material_name"
    t.float    "user_eco_costs"
    t.string   "user_unit"
  end

  create_table "st_material_details", :force => true do |t|
    t.integer  "st_product_id"
    t.float    "product_weight"
    t.float    "textile_weight"
    t.float    "electronic_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "product_weight_percentage"
  end

  create_table "st_material_translations", :force => true do |t|
    t.integer  "st_material_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_material_translations", ["locale"], :name => "index_st_material_translations_on_locale"
  add_index "st_material_translations", ["st_material_id"], :name => "index_st_material_translations_on_st_material_id"

  create_table "st_materials", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "st_family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_packaging_datas", :force => true do |t|
    t.integer  "st_product_id"
    t.integer  "st_packaging_type_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "eco_cost"
  end

  create_table "st_packaging_type_translations", :force => true do |t|
    t.integer  "st_packaging_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_packaging_type_translations", ["locale"], :name => "index_st_packaging_type_translations_on_locale"
  add_index "st_packaging_type_translations", ["st_packaging_type_id"], :name => "index_1a52a5142150bcad1078cfea43e9f51e381bd3a4"

  create_table "st_packaging_types", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_process_datas", :force => true do |t|
    t.integer  "st_product_id"
    t.integer  "st_family_process_id"
    t.integer  "st_process_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "eco_cost"
    t.string   "user_process_name"
    t.float    "user_eco_costs"
    t.string   "user_unit"
  end

  create_table "st_process_translations", :force => true do |t|
    t.integer  "st_process_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_process_translations", ["locale"], :name => "index_st_process_translations_on_locale"
  add_index "st_process_translations", ["st_process_id"], :name => "index_st_process_translations_on_st_process_id"

  create_table "st_processes", :force => true do |t|
    t.string   "name"
    t.integer  "st_family_process_id"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_products", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_result_values", :force => true do |t|
    t.integer  "st_result_id"
    t.float    "value"
    t.float    "value_year"
    t.float    "percentage"
    t.float    "percentage_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_results", :force => true do |t|
    t.integer  "st_product_id"
    t.string   "name_en"
    t.string   "name_ca"
    t.string   "name_es"
    t.integer  "parent_id"
    t.boolean  "check_graphic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_checkbox",  :default => false
  end

  create_table "st_transport_datas", :force => true do |t|
    t.integer  "st_product_id"
    t.integer  "st_family_transport_id"
    t.integer  "st_transport_id"
    t.float    "distance"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "eco_cost"
  end

  create_table "st_transport_translations", :force => true do |t|
    t.integer  "st_transport_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "st_transport_translations", ["locale"], :name => "index_st_transport_translations_on_locale"
  add_index "st_transport_translations", ["st_transport_id"], :name => "index_4cf1e78115a1fc40ee604bd684c7c3b288379890"

  create_table "st_transports", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "st_family_transport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "st_uses", :force => true do |t|
    t.integer  "st_product_id"
    t.float    "lifetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transport_distributions", :force => true do |t|
    t.integer  "data_mode_id"
    t.integer  "vehicle_id"
    t.float    "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
    t.float    "distance"
  end

  create_table "transport_repair_datas", :force => true do |t|
    t.integer  "product_id"
    t.float    "distance"
    t.float    "amount"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_first_answer_translations", :force => true do |t|
    t.integer  "user_first_answer_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_first_answer_translations", ["locale"], :name => "index_user_first_answer_translations_on_locale"
  add_index "user_first_answer_translations", ["user_first_answer_id"], :name => "index_user_first_answer_translations_on_user_first_answer_id"

  create_table "user_first_answers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_first_answers_users", :id => false, :force => true do |t|
    t.integer "user_first_answer_id"
    t.integer "user_id"
  end

  create_table "user_second_answer_translations", :force => true do |t|
    t.integer  "user_second_answer_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_second_answer_translations", ["locale"], :name => "index_user_second_answer_translations_on_locale"
  add_index "user_second_answer_translations", ["user_second_answer_id"], :name => "index_user_second_answer_translations_on_user_second_answer_id"

  create_table "user_second_answers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_second_answers_users", :id => false, :force => true do |t|
    t.integer "user_second_answer_id"
    t.integer "user_id"
  end

  create_table "user_third_answer_translations", :force => true do |t|
    t.integer  "user_third_answer_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_third_answer_translations", ["locale"], :name => "index_user_third_answer_translations_on_locale"
  add_index "user_third_answer_translations", ["user_third_answer_id"], :name => "index_user_third_answer_translations_on_user_third_answer_id"

  create_table "user_third_answers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_third_answers_users", :id => false, :force => true do |t|
    t.integer "user_third_answer_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                       :default => "",    :null => false
    t.string   "encrypted_password",           :limit => 128, :default => "",    :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                       :default => false
    t.string   "name"
    t.string   "surname"
    t.string   "activity"
    t.string   "organization"
    t.string   "postal"
    t.string   "old_country"
    t.string   "sector"
    t.string   "language"
    t.string   "phone"
    t.integer  "country_id"
    t.string   "other_main_activity"
    t.text     "other_first_answer"
    t.text     "other_second_answer"
    t.text     "other_third_answer"
    t.string   "free_training"
    t.boolean  "contact_info"
    t.boolean  "default_products_electronics",                :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "uses", :force => true do |t|
    t.float    "working"
    t.float    "lifetime"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_translations", :force => true do |t|
    t.integer  "vehicle_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_translations", ["locale"], :name => "index_vehicle_translations_on_locale"
  add_index "vehicle_translations", ["vehicle_id"], :name => "index_vehicle_translations_on_vehicle_id"

  create_table "vehicles", :force => true do |t|
    t.string   "name"
    t.integer  "data_mode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
