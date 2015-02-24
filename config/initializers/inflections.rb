# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end


ActiveSupport::Inflector.inflections do |inflect|
   inflect.irregular 'manufacturing_data', 'manufacturing_datas'
   inflect.irregular 'material_data', 'material_datas'
   inflect.irregular 'process_data', 'process_datas'
   inflect.irregular 'transport_repair_data', 'transport_repair_datas'
   inflect.irregular 'repair_data', 'repair_datas'
   inflect.irregular 'recycling_data', 'recycling_datas'
   inflect.irregular 'reuse_data', 'reuse_datas'
   inflect.irregular 'bp_compound_material_data', 'bp_compound_material_datas'
   inflect.irregular 'bp_end_of_life_data', 'bp_end_of_life_datas'
   inflect.irregular 'st_energy_data', 'st_energy_datas'
   inflect.irregular 'st_transport_data', 'st_transport_datas'
   inflect.irregular 'st_consumption_data', 'st_consumption_datas'
   inflect.irregular 'st_consumable_data', 'st_consumable_datas'
   inflect.irregular 'st_end_of_life_data', 'st_end_of_life_datas'
   inflect.irregular 'st_packaging_data', 'st_packaging_datas'
   inflect.irregular 'pc_transport_data', 'pc_transport_datas'
   inflect.irregular 'bp_finishing_data', 'bp_finishing_datas'
   inflect.irregular 'bp_manufacturing_transport_data', 'bp_manufacturing_transport_datas'
   inflect.irregular 'bp_packaging_data', 'bp_packaging_datas'
   inflect.irregular 'bp_transport_to_customer_data', 'bp_transport_to_customer_datas'
   inflect.irregular 'bp_transport_to_converter_data', 'bp_transport_to_converter_datas'
   inflect.irregular 'packaging_distribution','packaging_distributions'
   inflect.irregular 'se_use_production_data','se_use_production_datas'
   inflect.irregular 'se_use_product_data','se_use_product_datas'
   inflect.irregular 'se_use_consumption_data','se_use_consumption_datas'
   inflect.irregular 'se_use_consumption_consumable_data','se_use_consumption_consumable_datas'
   inflect.irregular 'se_use_consumption_utility_data','se_use_consumption_utility_datas'
   inflect.irregular 'mt_predefined_supplier_data', 'mt_predefined_supplier_datas'
   inflect.irregular 'mt_supplier_part_data', 'mt_supplier_part_datas'
   inflect.irregular 'mt_user_supplier_data', 'mt_user_supplier_datas'
   inflect.irregular 'mt_manufacturing_main_data', 'mt_manufacturing_main_datas'
   inflect.irregular 'mt_energy_data', 'mt_energy_datas'
   inflect.irregular 'mt_overhead_energy_data', 'mt_overhead_energy_datas'
   inflect.irregular 'mt_manufacturing_resource_data', 'mt_manufacturing_resource_datas'
   inflect.irregular 'mt_supplier_data', 'mt_supplier_datas'
   inflect.irregular 'mt_waste_energy_data', 'mt_waste_energy_datas'
   inflect.irregular 'mt_distribution_packaging_data', 'mt_distribution_packaging_datas'
   inflect.irregular 'mt_distribution_transport_data' ,'mt_distribution_transport_datas'
   inflect.irregular 'mt_use_additional_energy_data', 'mt_use_additional_energy_datas'
   inflect.irregular 'mt_use_operating_resource_data', 'mt_use_operating_resource_datas'
   inflect.irregular 'mt_use_machine_subsystem_data' ,'mt_use_machine_subsystem_datas'
end