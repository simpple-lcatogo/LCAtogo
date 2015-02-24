# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



if Indicator.where("sector = 'machine'").count == 0
    indicator_1_mt = Indicator.create(:name => 'Cumulative Energy Demand (CED)', :sector => 'machine', :unit => 'MJ')

    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, DISTRIBUTION, END-OF-LIFE', :family => 'Plastics', :name => 'Polypropylene (PP)',  :value => 75.10)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, DISTRIBUTION, END-OF-LIFE', :family => 'Plastics', :name => 'Polyvinylchloride (PVC)',  :value => 60.90)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, DISTRIBUTION, END-OF-LIFE', :family => 'Plastics', :name => 'Polycarbonate',  :value => 108.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, DISTRIBUTION, END-OF-LIFE', :family => 'Plastics', :name => 'Polyethylene_Pacakging film (PE foil)',  :value => 92.60)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, DISTRIBUTION, END-OF-LIFE', :family => 'Plastics', :name => 'Fibre Glass_Polyamide',  :value => 148.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, DISTRIBUTION, END-OF-LIFE', :family => 'Plastics', :name => 'Fibre Glass_Polyester resin',  :value => 82.60)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, DISTRIBUTION, END-OF-LIFE', :family => 'Plastics', :name => 'Fibre Glass_Unknown',  :value => 115.30)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, DISTRIBUTION, END-OF-LIFE', :family => 'Plastics', :name => 'Plastic_Unknown',  :value => 94.53)    
    
    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Steel_Low alloyed',  :value => 30.60)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Steel_Chromium steel',  :value => 73.40)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Steel_Unknown',  :value => 52.00)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Steel_low-alloyed',  :value => 27.90)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Steel_chromium-steel',  :value => 76.60)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Steel_mix',  :value => 52.25)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Iron',  :value => 25.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Aluminium',  :value => 194.00)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Aluminium_mix',  :value => 136.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Copper',  :value => 34.50)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Copper_mix',  :value => 34.00)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Brass',  :value => 42.7)        
        
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Cable',  :value => 68.4)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Transformer',  :value => 56.2)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Power supply',  :value => 545)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Cooling and Lubrication unit',  :value => 49.4)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Compressor',  :value => 72.86)
        
        
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Electronics', :name => 'Electric Motor',  :value => 52.10)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Electronics', :name => 'Electronic control unit',  :value => 462.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Electronics', :name => 'PC without screen',  :value => 4670.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Electronics', :name => 'LCD screen',  :value => 4920.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Electronics', :name => 'Keyboard',  :value => 436.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Electronics', :name => 'Optical mouse',  :value => 88.10)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Electronics', :name => 'Full PC set',  :value => 10114.10)    

        
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Other', :name => 'Sand',  :value => 0.33)        
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS', :family => 'Other', :name => 'Tempered Glass',  :value => 18.4)
    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'DISTRIBUTION', :family => 'Packaging', :name => 'Wood for transport crate',  :value => 13.2)
    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING', :family => 'Metals', :name => 'Wire drawing',  :value => 9.32)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURING', :family => 'Metals', :name => 'Sheet rolling',  :value => 6.45)    

    
    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Drilling Al',  :value => 154.00)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Drilling Steel',  :value => 46.90)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Drilling Iron',  :value => 42.40)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Milling Al',  :value => 161.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Milling Steel',  :value => 54.10)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Milling Iron',  :value => 47.10)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Turning Al',  :value => 157.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Turning Steel',  :value => 48.90)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Turning Iron',  :value => 44.50)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Aluminium working',  :value => 157.30)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Steel working',  :value => 50.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Iron working',  :value => 44.70)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Welding Al',  :value => 3.39)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Welding Steel',  :value => 2.09)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Welding Average',  :value => 2.74)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Drilling Brass',  :value => 59.7)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Turning Brass',  :value => 61.8)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Brass working',  :value => 60.75)        
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Injection Moulding',  :value => 28.7)    
    
    
    
                   
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'DISTRIBUTION', :family => 'Freight', :name => 'Transport_Lorry 3.5-20t',  :value => 4.65)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'DISTRIBUTION', :family => 'Freight', :name => 'Transport_Rail',  :value => 0.75)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'DISTRIBUTION', :family => 'Freight', :name => 'Transport_Ship',  :value => 0.17)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'DISTRIBUTION', :family => 'Freight', :name => 'Transport_Air',  :value => 15.90)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'DISTRIBUTION', :family => 'Freight', :name => 'Transport_overland',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'DISTRIBUTION', :family => 'Freight', :name => 'Transport_overseas',  :value => 0)    
             
             
             
                                                                                                                                    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Austria',  :value => 8.21)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Bosnia Herzegovina',  :value => 8.78)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Belgium',  :value => 11.64)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Bulgaria',  :value => 12.21)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Brazil',  :value => 5.03)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Switzerland',  :value => 9.89)
    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_China',  :value => 11.32)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Serbia & Montenegro',  :value => 12.20)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Chech Republic',  :value => 11.87)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Germany',  :value => 11.48)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Denmark',  :value => 9.81)
    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Spain',  :value => 10.66)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Finland',  :value => 11.46)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_France',  :value => 12.28)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Great Britain',  :value => 10.97)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Greece',  :value => 16.00)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Croatia',  :value => 10.23)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Hungary',  :value => 13.92)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Ireland',  :value => 11.58)
    
                                                                                                                            
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Italy',  :value => 9.74)               
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Japan',  :value => 11.81)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Luxembourg',  :value => 10.91)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Macedonia',  :value => 12.91)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Netherlands',  :value => 11.22)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Norway',  :value => 4.71)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Poland',  :value => 13.36)                                                                                                                                 
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Portugal',  :value => 10.28)           
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Romania',  :value => 10.51)           
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Sweden',  :value => 9.51)           
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Slovenia',  :value => 8.99)           
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_Slovakia',  :value => 11.05)           
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Electricity', :name => 'Electricity_United States',  :value => 12.81)                                                                      
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Other Energy', :name => 'Compressed Air',  :value => 4.73)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Other Energy', :name => 'Heat_Natural gas',  :value => 1.29)    
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Other Energy', :name => 'Heat_Light fuel oil',  :value => 21.5)

    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'USE', :family => 'Consumables', :name => 'Oxygen_operating resource_liquid',  :value => 8.78)           
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'USE', :family => 'Consumables', :name => 'Nitrogen_operating resource_liquid',  :value => 9.30)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'USE', :family => 'Consumables', :name => 'Argon_operating resource_liquid',  :value => 6.86)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'USE', :family => 'Consumables', :name => 'Carbon dioxide_operating resource_liquid',  :value => 10.90)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'USE', :family => 'Consumables', :name => 'Ozone_operating resource_liquid',  :value => 172.00)
    ExcelValue.create(:indicator_id => indicator_1_mt.id, :phase => 'USE', :family => 'Consumables', :name => 'Lubricating oil',  :value => 79.8)    
end  

if Sector.all.size == 0   
   Sector.create(:name => 'bio_based')
   Sector.create(:name => 'industrial')
   Sector.create(:name => 'electronics')
   Sector.create(:name => 'printed')
   Sector.create(:name => 'renewable')
   Sector.create(:name => 'semiconductors')
   Sector.create(:name => 'sensors')   
   Sector.create(:name => 'textiles')   
end

if Packaging.all.size == 0
   Packaging.create(:name => 'Corrugated board box', :unit => 'kg')
   Packaging.create(:name => 'Wooden pallet', :unit => 'kg')
   Packaging.create(:name => 'Stretch film LLDPE', :unit => 'kg')
   Packaging.create(:name => 'LDPE bag', :unit => 'kg')
   Packaging.create(:name => 'Shrink film LDPE', :unit => 'kg')
   Packaging.create(:name => 'Steel strapping', :unit => 'kg')
   Packaging.create(:name => 'PP strapping', :unit => 'kg')
   Packaging.create(:name => 'Cushioning EPS', :unit => 'kg')
   Packaging.create(:name => 'PVC blister', :unit => 'kg')   
   
end

#if 1 != 1
if Family.all.size == 0
   DataModule.delete_all
   DataModuleTranslation.delete_all
  
#   data_module_1 = DataModule.create(:name => 'Computer')
#   DataModuleTranslation.create(:data_module_id => data_module_1.id, :name => 'Computer', :locale => 'en')

   Family.delete_all
   FamilyTranslation.delete_all
   Material.delete_all
   MaterialTranslation.delete_all
   DataProcess.delete_all
   DataProcessTranslation.delete_all
   DataMode.delete_all
   DataModeTranslation.delete_all
   EnergyMode.delete_all
   EnergyModeTranslation.delete_all
   EnergyType.delete_all
   EnergyTypeTranslation.delete_all
   
   ## Housing
   family_1 = Family.create(:name => 'Housing & internal structural elements', :stage => 'Manufacturing')
 #  FamilyTranslation.create(:family_id => family_1.id, :name => 'Housing & internal structural elements', :locale => 'en')   
   Material.create(:name => 'wood (oak)', :family_id => family_1.id, :unit => 'g')
   Material.create(:name => 'steel', :family_id => family_1.id, :unit => 'g')
  # Material.create(:name => 'steel', :family_id => family_1.id, :unit => 'g milled-off')
   Material.create(:name => 'aluminium', :family_id => family_1.id, :unit => 'g')
  # Material.create(:name => 'aluminium', :family_id => family_1.id, :unit => 'g milled-off')   
   Material.create(:name => 'PC/ABS', :family_id => family_1.id, :unit => 'g')   
   
   ## Display
   family_2 = Family.create(:name => 'Display', :stage => 'Manufacturing')   
  # FamilyTranslation.create(:family_id => family_2.id, :name => 'Display', :locale => 'en')   
   Material.create(:name => 'LCD, edge lit, 250 cd/m<sup>2</sup>', :family_id => family_2.id, :unit => 'cm<sup>2</sup>')
   Material.create(:name => 'LCD, edge lit, 350 cd/m<sup>2</sup>', :family_id => family_2.id, :unit => 'cm<sup>2</sup>')
   Material.create(:name => 'LCD, edge lit, 450 cd/m<sup>2</sup>', :family_id => family_2.id, :unit => 'cm<sup>2</sup>')
   Material.create(:name => 'LCD, array (locally dimmable), 300 cd/m<sup>2</sup>', :family_id => family_2.id, :unit => 'cm<sup>2</sup>')   

   ## Printed Circuit Board Assemblies
   family_3 = Family.create(:name => 'Printed Circuit Board Assemblies', :stage => 'Manufacturing')
   #FamilyTranslation.create(:family_id => family_3.id, :name => 'Printed Circuit Board Assemblies', :locale => 'en')
   Material.create(:name => 'PC mainboard, ATX (744 cm<sup>2</sup>)', :family_id => family_3.id, :unit => 'units')   
   Material.create(:name => 'PC memory module (DIMM)', :family_id => family_3.id, :unit => 'units')   
   Material.create(:name => 'PC graphics card (118 cm<sup>2</sup>)', :family_id => family_3.id, :unit => 'units')
   Material.create(:name => 'Laptop mainboard (270 cm<sup>2</sup>)', :family_id => family_3.id, :unit => 'units')   
   Material.create(:name => 'Laptop memory module (SO DIMM)', :family_id => family_3.id, :unit => 'units')
   Material.create(:name => 'Laptop WLAN module (mini PCIe card)', :family_id => family_3.id, :unit => 'units')   
   Material.create(:name => 'Laptop, other rigid boards', :family_id => family_3.id, :unit => 'units')
   Material.create(:name => 'Tablets (7&quot; range), mainboard (50 cm<sup>2</sup>)', :family_id => family_3.id, :unit => 'units')   
   Material.create(:name => 'Tablets (10&quot; range), mainboard (80 cm<sup>2</sup>)', :family_id => family_3.id, :unit => 'units')
   Material.create(:name => 'Server mainboard E-ATX (1007 cm<sup>2</sup>))', :family_id => family_3.id, :unit => 'units')   
        
   ## Tantalum capacitors
   family_4 = Family.create(:name => 'Tantalum capacitors', :stage => 'Manufacturing')
   # FamilyTranslation.create(:family_id => family_4.id, :name => 'Tantalum capacitors', :locale => 'en')
   Material.create(:name => 'SMD, case size A, 3.2x1.6mm', :family_id => family_4.id, :unit => 'units')   
   Material.create(:name => 'SMD, case size B, 3.5x2.8mm', :family_id => family_4.id, :unit => 'units')
   Material.create(:name => 'SMD, case size C, 6.0x3.2mm', :family_id => family_4.id, :unit => 'units')
   Material.create(:name => 'SMD, case size D, 7.3x4.3mm', :family_id => family_4.id, :unit => 'units')
   Material.create(:name => 'SMD, case size P, 2.0x1.2mm', :family_id => family_4.id, :unit => 'units')
   Material.create(:name => 'SMD, case size J, 1.6x0.8mm', :family_id => family_4.id, :unit => 'units')   
   Material.create(:name => 'SMD, case size K, 1.0x0.5mm', :family_id => family_4.id, :unit => 'units')   
        
   ## Memory
   family_5 = Family.create(:name => 'Memory', :stage => 'Manufacturing') 
  # FamilyTranslation.create(:family_id => family_5.id, :name => 'Memory', :locale => 'en')   
   Material.create(:name => 'DRAM, DDR3, 40 nm, max. 1Gb/chip', :family_id => family_5.id, :unit => 'GB')
   Material.create(:name => 'DRAM, DDR3, 30 nm, 2Gb/chip', :family_id => family_5.id, :unit => 'GB')
   Material.create(:name => 'DRAM, DDR3, 20 nm, 4Gb/chip and above', :family_id => family_5.id, :unit => 'GB')
   Material.create(:name => 'DRAM, LPDDR2, 40 nm, max. 2Gb/chip', :family_id => family_5.id, :unit => 'GB')
   Material.create(:name => 'DRAM, LPDDR2, 30 nm, 4Gb/chip and above', :family_id => family_5.id, :unit => 'GB')
   Material.create(:name => 'NAND Flash, 40nm, max. 16Gb/chip', :family_id => family_5.id, :unit => 'GB')
   Material.create(:name => 'NAND Flash, 20nm, 32Gb/chip and above', :family_id => family_5.id, :unit => 'GB')   
   Material.create(:name => 'Graphic memory (GDDR5), 30 nm', :family_id => family_5.id, :unit => 'GB')   
   
   ## Processor
   family_6 = Family.create(:name => 'Processor', :stage => 'Manufacturing')   
   #FamilyTranslation.create(:family_id => family_6.id, :name => 'Processor', :locale => 'en')
   Material.create(:name => '1 core, application: server', :family_id => family_6.id, :unit => 'units')   
   Material.create(:name => '2 cores, application: server', :family_id => family_6.id, :unit => 'units')
   Material.create(:name => '4 cores, application: server', :family_id => family_6.id, :unit => 'units')
   Material.create(:name => '6 cores, application: server', :family_id => family_6.id, :unit => 'units')
   Material.create(:name => '8 cores, application: server', :family_id => family_6.id, :unit => 'units')
   Material.create(:name => '10 cores, application: server', :family_id => family_6.id, :unit => 'units')
   Material.create(:name => '1 core, application: desktop PC', :family_id => family_6.id, :unit => 'units')
   Material.create(:name => '2 cores, application: desktop PC', :family_id => family_6.id, :unit => 'units')
   Material.create(:name => '4 cores, application: desktop PC', :family_id => family_6.id, :unit => 'units')   
   Material.create(:name => '6 cores, application: desktop PC', :family_id => family_6.id, :unit => 'units')   
   Material.create(:name => '1 core, application: mobile', :family_id => family_6.id, :unit => 'units')
   Material.create(:name => '2 cores, application: mobile', :family_id => family_6.id, :unit => 'units')   
   Material.create(:name => '4 cores, application: mobile', :family_id => family_6.id, :unit => 'units')   
   
   ## Storage
   family_7 = Family.create(:name => 'Storage', :stage => 'Manufacturing')
   #FamilyTranslation.create(:family_id => family_7.id, :name => 'Storage', :locale => 'en')   
   Material.create(:name => '3,5&quot; HDD', :family_id => family_7.id, :unit => 'TB')
   Material.create(:name => '2,5&quot; HDD', :family_id => family_7.id, :unit => 'TB')
 #  Material.create(:name => 'HDD test', :family_id => family_7.id, :unit => '1 TB capacity')

   ## Optical Disc Drive
   family_8 = Family.create(:name => 'Optical Disc Drive', :stage => 'Manufacturing')
   #FamilyTranslation.create(:family_id => family_8.id, :name => 'Optical Disc Drive', :locale => 'en')
   Material.create(:name => 'Optical Disk Drive', :family_id => family_8.id, :unit => 'units')   
   
   ## Connectivity
   family_9 = Family.create(:name => 'Connectivity', :stage => 'Manufacturing')
   #FamilyTranslation.create(:family_id => family_9.id, :name => 'Connectivity', :locale => 'en')
   Material.create(:name => 'WLAN', :family_id => family_9.id, :unit => 'units')
   Material.create(:name => 'USB', :family_id => family_9.id, :unit => 'units')
   Material.create(:name => 'HDMI', :family_id => family_9.id, :unit => 'units')
   Material.create(:name => 'VGA, DVI', :family_id => family_9.id, :unit => 'units')
   Material.create(:name => 'RJ 45', :family_id => family_9.id, :unit => 'units')   

   ## Power supply   
   family_10 = Family.create(:name => 'Power supply', :stage => 'Manufacturing')   
   #FamilyTranslation.create(:family_id => family_10.id, :name => 'Power supply', :locale => 'en')
   #Material.create(:name => 'Power Supply', :family_id => family_10.id, :unit => 'Base value')
   Material.create(:name => 'Power Supply', :family_id => family_10.id, :unit => 'VA output rating')   
  
   ## Cables   
   family_11 = Family.create(:name => 'Cables', :stage => 'Manufacturing')   
   #FamilyTranslation.create(:family_id => family_11.id, :name => 'Cables', :locale => 'en')
   Material.create(:name => 'cable', :family_id => family_11.id, :unit => 'g')   
   
   ## Battery   
   family_12 = Family.create(:name => 'Battery', :stage => 'Manufacturing')
   #FamilyTranslation.create(:family_id => family_12.id, :name => 'Battery', :locale => 'en')
   Material.create(:name => 'battery (Li-ion)', :family_id => family_12.id, :unit => 'Wh')  
 
  
   
   

     
     
#   family_1 = Family.create(:name => 'Housing', :stage => 'Materials', :data_module_id => data_module_1.id)
#   FamilyTranslation.create(:family_id => family_1.id, :name => 'Housing', :locale => 'en')
#   
#   material_1 = Material.create(:name => 'Wood', :family_id => family_1.id, :unit => 'kg')
#   MaterialTranslation.create(:material_id => material_1.id, :name => 'Wood', :unit => 'kg', :locale => 'en')
#   material_2 = Material.create(:name => 'Steel (sheet)', :family_id => family_1.id, :unit => 'kg')
#   MaterialTranslation.create(:material_id => material_2.id, :name => 'Steel (sheet)', :unit => 'kg', :locale => 'en')
#   material_3 = Material.create(:name => 'Aluminium', :family_id => family_1.id, :unit => 'kg')
#   MaterialTranslation.create(:material_id => material_3.id, :name => 'Aluminium', :unit => 'kg', :locale => 'en')
#   material_4 = Material.create(:name => 'Plastics (ABS/PC)', :family_id => family_1.id, :unit => 'kg')
#   MaterialTranslation.create(:material_id => material_4.id, :name => 'Plastics (ABS/PC)', :unit => 'kg', :locale => 'en')
#  
#   family_2 = Family.create(:name => 'Display', :stage => 'Materials', :data_module_id => data_module_1.id)
#   FamilyTranslation.create(:family_id => family_2.id, :name => 'Display', :locale => 'en')
#
#   family_3 = Family.create(:name => 'Printed Circuit Board', :stage => 'Materials', :data_module_id => data_module_1.id)
#   FamilyTranslation.create(:family_id => family_3.id, :name => 'Printed Circuit Board', :locale => 'en')
#   
#   material_5 = Material.create(:name => 'Mainboard', :family_id => family_3.id, :unit => 'cm<sup>2</sup>')
#   MaterialTranslation.create(:material_id => material_5.id, :name => 'Mainboard', :unit => 'cm<sup>2</sup>', :locale => 'en')
#   material_6 = Material.create(:name => 'Other PCB', :family_id => family_3.id, :unit => 'cm<sup>2</sup>')
#   MaterialTranslation.create(:material_id => material_6.id, :name => 'Other PCB', :unit => 'cm<sup>2</sup>', :locale => 'en')
#   material_7 = Material.create(:name => 'Other PCB II', :family_id => family_3.id, :unit => 'cm<sup>2</sup>')
#   MaterialTranslation.create(:material_id => material_7.id, :name => 'Other PCB II', :unit => 'cm<sup>2</sup>', :locale => 'en')
#      
#   family_4 = Family.create(:name => 'Memory', :stage => 'Materials', :data_module_id => data_module_1.id)
#   FamilyTranslation.create(:family_id => family_4.id, :name => 'Memory', :locale => 'en')
#   
#   material_8 = Material.create(:name => 'DDR3', :family_id => family_4.id, :unit => 'GB')
#   MaterialTranslation.create(:material_id => material_8.id, :name => 'DDR3', :unit => 'GB', :locale => 'en')
#      
#   family_5 = Family.create(:name => 'Processor', :stage => 'Materials', :data_module_id => data_module_1.id)
#   FamilyTranslation.create(:family_id => family_5.id, :name => 'Processor', :locale => 'en')
#   
#   material_9 = Material.create(:name => 'server-type CPU', :family_id => family_5.id, :unit => 'unit(s)')
#   MaterialTranslation.create(:material_id => material_9.id, :name => 'server-type CPU', :unit => 'unit(s)', :locale => 'en')
#   material_10 = Material.create(:name => 'PC-type CPU', :family_id => family_5.id, :unit => 'unit(s)')
#   MaterialTranslation.create(:material_id => material_10.id, :name => 'PC-type CPU', :unit => 'unit(s)', :locale => 'en')
#   material_11 = Material.create(:name => 'laptop-type CPU', :family_id => family_5.id, :unit => 'unit(s)')
#   MaterialTranslation.create(:material_id => material_11.id, :name => 'laptop-type CPU', :unit => 'unit(s)', :locale => 'en')
#   
#   family_6 = Family.create(:name => 'Storage', :stage => 'Materials', :data_module_id => data_module_1.id)
#   FamilyTranslation.create(:family_id => family_6.id, :name => 'Storage', :locale => 'en')
#   
#   material_12 = Material.create(:name => 'SSD', :family_id => family_6.id, :unit => 'GB')
#   MaterialTranslation.create(:material_id => material_12.id, :name => 'SSD', :unit => 'GB', :locale => 'en')
#   material_13 = Material.create(:name => 'HDD', :family_id => family_6.id, :unit => 'unit')
#   MaterialTranslation.create(:material_id => material_13.id, :name => 'HDD', :unit => 'unit', :locale => 'en')
#      
#   family_7 = Family.create(:name => 'Power Supply', :stage => 'Materials', :data_module_id => data_module_1.id)
#   FamilyTranslation.create(:family_id => family_7.id, :name => 'Power Supply', :locale => 'en')
#   
#   material_14 = Material.create(:name => 'Output rating', :family_id => family_7.id, :unit => 'VA')
#   MaterialTranslation.create(:material_id => material_14.id, :name => 'Output rating', :unit => 'VA', :locale => 'en')
#   
#   family_8 = Family.create(:name => 'Battery', :stage => 'Materials', :data_module_id => data_module_1.id)
#   FamilyTranslation.create(:family_id => family_8.id, :name => 'Battery', :locale => 'en')
#   material_battery = Material.create(:name => 'Capacity', :family_id => family_8.id, :unit => 'mAh')
#   MaterialTranslation.create(:material_id => material_battery.id, :name => 'Capacity', :unit => 'mAh', :locale => 'en')
#
#
#
   data_mode_1 = DataMode.create(:name => 'Road')
 #  DataModeTranslation.create(:data_mode_id => data_mode_1.id, :name => 'Road', :locale => 'en')
   vehicle_1 = Vehicle.create(:name => 'Delivery van', :data_mode_id => data_mode_1.id)
   #VehicleTranslation.create(:vehicle_id => vehicle_1.id, :name => 'Road', :locale => 'en')
   vehicle_1 = Vehicle.create(:name => 'Transport Lorry 3.5-7.5 t', :data_mode_id => data_mode_1.id)
   #VehicleTranslation.create(:vehicle_id => vehicle_1.id, :name => 'Road', :locale => 'en')
   vehicle_1 = Vehicle.create(:name => 'Transport Lorry 7.5-16 t', :data_mode_id => data_mode_1.id)   
   vehicle_1 = Vehicle.create(:name => 'Transport Lorry 16-32 t', :data_mode_id => data_mode_1.id)
   vehicle_1 = Vehicle.create(:name => 'Transport Lorry > 32 t', :data_mode_id => data_mode_1.id)
      

   data_mode_4 = DataMode.create(:name => 'Boat')
   #DataModeTranslation.create(:data_mode_id => data_mode_4.id, :name => 'Water', :locale => 'en')
   vehicle_1 = Vehicle.create(:name => 'Transport transoceanic', :data_mode_id => data_mode_4.id)
       
   data_mode_2 = DataMode.create(:name => 'Rail')
   vehicle_1 = Vehicle.create(:name => 'Transport by rail', :data_mode_id => data_mode_2.id)   
   
  # DataModeTranslation.create(:data_mode_id => data_mode_2.id, :name => 'Rail', :locale => 'en')
   data_mode_3 = DataMode.create(:name => 'Plane')
   vehicle_1 = Vehicle.create(:name => 'Transport by plane, international', :data_mode_id => data_mode_3.id)   
   vehicle_1 = Vehicle.create(:name => 'Transport by plane', :data_mode_id => data_mode_3.id)   
   #DataModeTranslation.create(:data_mode_id => data_mode_3.id, :name => 'Air', :locale => 'en')
   
   energy_mode_1 = EnergyMode.create(:name => 'Power off')
   EnergyModeTranslation.create(:energy_mode_id => energy_mode_1.id, :name => 'Power off', :locale => 'en')
   energy_mode_2 = EnergyMode.create(:name => 'Power sleep')
   EnergyModeTranslation.create(:energy_mode_id => energy_mode_2.id, :name => 'Power sleep', :locale => 'en')
   energy_mode_3 = EnergyMode.create(:name => 'Power long idle')
   EnergyModeTranslation.create(:energy_mode_id => energy_mode_3.id, :name => 'Power long idle', :locale => 'en')
   energy_mode_4 = EnergyMode.create(:name => 'Power short idle')
   EnergyModeTranslation.create(:energy_mode_id => energy_mode_4.id, :name => 'Power short idle', :locale => 'en')
    
   family_9 = Family.create(:name => 'Electricity', :stage => 'Consumption')
   FamilyTranslation.create(:family_id => family_9.id, :name => 'Electricity', :locale => 'en')
   family_10 = Family.create(:name => 'Gas', :stage => 'Consumption')
   FamilyTranslation.create(:family_id => family_10.id, :name => 'Gas', :locale => 'en')
   family_11 = Family.create(:name => 'Fuel', :stage => 'Consumption')
   FamilyTranslation.create(:family_id => family_11.id, :name => 'Fuel', :locale => 'en')
    
    
    energy_type_1 = EnergyType.create(:name => 'Austria', :family_id => family_9.id, :consumption => 0.19876)
    energy_type_2 = EnergyType.create(:name => 'Belgium', :family_id => family_9.id, :consumption => 0.23087)
    energy_type_3 = EnergyType.create(:name => 'Bulgaria', :family_id => family_9.id, :consumption => 0.6227)
    energy_type_4 = EnergyType.create(:name => 'Croatia', :family_id => family_9.id, :consumption => 0.26136)
    energy_type_5 = EnergyType.create(:name => 'Cyprus', :family_id => family_9.id, :consumption => 0.72009)
    energy_type_6 = EnergyType.create(:name => 'Czech Republic', :family_id => family_9.id, :consumption => 0.63633)
    energy_type_7 = EnergyType.create(:name => 'Denmark', :family_id => family_9.id, :consumption => 0.38508)
    energy_type_8 = EnergyType.create(:name => 'Estonia', :family_id => family_9.id, :consumption => 1.17776)
    energy_type_9 = EnergyType.create(:name => 'Finland', :family_id => family_9.id, :consumption => 0.23874)
    energy_type_10 = EnergyType.create(:name => 'France', :family_id => family_9.id, :consumption => 0.0851)
    energy_type_11 = EnergyType.create(:name => 'Germany', :family_id => family_9.id, :consumption => 0.4873)
    energy_type_12 = EnergyType.create(:name => 'Gibraltar', :family_id => family_9.id, :consumption => 0.7616)
    energy_type_13 = EnergyType.create(:name => 'Greece', :family_id => family_9.id, :consumption => 0.78234)
    energy_type_14 = EnergyType.create(:name => 'Hungary', :family_id => family_9.id, :consumption => 0.353)
    energy_type_15 = EnergyType.create(:name => 'Iceland', :family_id => family_9.id, :consumption => 0.00019)
    energy_type_16 = EnergyType.create(:name => 'Ireland', :family_id => family_9.id, :consumption => 0.49664)
    energy_type_17 = EnergyType.create(:name => 'Italy', :family_id => family_9.id, :consumption => 0.43316)
    energy_type_18 = EnergyType.create(:name => 'Latvia', :family_id => family_9.id, :consumption => 0.13412)
    energy_type_19 = EnergyType.create(:name => 'Lithuania', :family_id => family_9.id, :consumption => 0.37508)
    energy_type_20 = EnergyType.create(:name => 'Luxembourg', :family_id => family_9.id, :consumption => 0.41835)
    energy_type_21 = EnergyType.create(:name => 'Malta', :family_id => family_9.id, :consumption => 1.02861)
    energy_type_22 = EnergyType.create(:name => 'Netherlands', :family_id => family_9.id, :consumption => 0.43256)
    energy_type_23 = EnergyType.create(:name => 'Norway', :family_id => family_9.id, :consumption => 0.01823)
    energy_type_24 = EnergyType.create(:name => 'Poland', :family_id => family_9.id, :consumption => 0.86546)
    energy_type_25 = EnergyType.create(:name => 'Portugal', :family_id => family_9.id, :consumption => 0.27741)
    energy_type_26 = EnergyType.create(:name => 'Romania', :family_id => family_9.id, :consumption => 0.48454)
    energy_type_27 = EnergyType.create(:name => 'Slovak Republic', :family_id => family_9.id, :consumption => 0.20502)
    energy_type_28 = EnergyType.create(:name => 'Slovenia', :family_id => family_9.id, :consumption => 0.34543)
    energy_type_29 = EnergyType.create(:name => 'Spain', :family_id => family_9.id, :consumption => 0.25143)
    energy_type_30 = EnergyType.create(:name => 'Sweden', :family_id => family_9.id, :consumption => 0.0321)
    energy_type_31 = EnergyType.create(:name => 'Switzerland', :family_id => family_9.id, :consumption => 0.02931)
    energy_type_32 = EnergyType.create(:name => 'Turkey', :family_id => family_9.id, :consumption => 0.53883)
    energy_type_33 = EnergyType.create(:name => 'UK', :family_id => family_9.id, :consumption => 0.48021)
    energy_type_34 = EnergyType.create(:name => 'Ukraine', :family_id => family_9.id, :consumption => 0.4566)
    energy_type_35 = EnergyType.create(:name => 'EU (average)', :family_id => family_9.id, :consumption => 0.37223)
    energy_type_36 = EnergyType.create(:name => 'Australia', :family_id => family_9.id, :consumption => 0.90771)
    energy_type_37 = EnergyType.create(:name => 'Brazil', :family_id => family_9.id, :consumption => 0.10308)
    energy_type_38 = EnergyType.create(:name => 'Canada', :family_id => family_9.id, :consumption => 0.20456)
    energy_type_39 = EnergyType.create(:name => 'Chinese Taipei', :family_id => family_9.id, :consumption => 0.64929)
    energy_type_40 = EnergyType.create(:name => 'Egypt', :family_id => family_9.id, :consumption => 0.506)
    energy_type_41 = EnergyType.create(:name => 'Hong Kong, China', :family_id => family_9.id, :consumption => 0.80836)
    energy_type_42 = EnergyType.create(:name => 'India', :family_id => family_9.id, :consumption => 1.20622)
    energy_type_43 = EnergyType.create(:name => 'Indonesia', :family_id => family_9.id, :consumption => 0.79172)
    energy_type_44 = EnergyType.create(:name => 'Israel', :family_id => family_9.id, :consumption => 0.7062)
    energy_type_45 = EnergyType.create(:name => 'Japan', :family_id => family_9.id, :consumption => 0.43857)
    energy_type_46 = EnergyType.create(:name => 'Malaysia', :family_id => family_9.id, :consumption => 0.74804)
    energy_type_47 = EnergyType.create(:name => 'Mexico', :family_id => family_9.id, :consumption => 0.55258)
    energy_type_48 = EnergyType.create(:name => 'New Zealand', :family_id => family_9.id, :consumption => 0.16293)
    energy_type_49 = EnergyType.create(:name => 'Pakistan', :family_id => family_9.id, :consumption => 0.54045)
    energy_type_50 = EnergyType.create(:name => 'People\'s Rep. of China', :family_id => family_9.id, :consumption => 0.8182)
    energy_type_51 = EnergyType.create(:name => 'Philippines', :family_id => family_9.id, :consumption => 0.55608)
    energy_type_52 = EnergyType.create(:name => 'Russian Federation', :family_id => family_9.id, :consumption => 0.44136)
    energy_type_53 = EnergyType.create(:name => 'Saudi Arabia', :family_id => family_9.id, :consumption => 0.81248)
    energy_type_54 = EnergyType.create(:name => 'Singapore', :family_id => family_9.id, :consumption => 0.52911)
    energy_type_55 = EnergyType.create(:name => 'South Africa', :family_id => family_9.id, :consumption => 1.02978)
    energy_type_56 = EnergyType.create(:name => 'South Korea', :family_id => family_9.id, :consumption => 0.55416)
    energy_type_57 = EnergyType.create(:name => 'Thailand', :family_id => family_9.id, :consumption => 0.54679)
    energy_type_58 = EnergyType.create(:name => 'United States', :family_id => family_9.id, :consumption => 0.55595)
    energy_type_59 = EnergyType.create(:name => 'Africa (average)', :family_id => family_9.id, :consumption => 0.72473)
    energy_type_60 = EnergyType.create(:name => 'Latin America (average)', :family_id => family_9.id, :consumption => 0.23474)
    energy_type_61 = EnergyType.create(:name => 'Middle East (average)', :family_id => family_9.id, :consumption => 0.77929)
    energy_type_62 = EnergyType.create(:name => 'Non-OECD Europe and Eurasia (average)', :family_id => family_9.id, :consumption => 0.47071)      
end



if Indicator.where("sector = 'electronics'").count == 0
#if Indicator.all.size == 0
 #  Indicator.delete_all
  # IndicatorTranslation.delete_all
   #ExcelValue.delete_all
   indicator_1 = Indicator.create(:name => 'Carbon footprint', :abbr => 'CF', :unit => 'kg CO<sub>2</sub>-eq', :comment => 'Contribution to Global Warming Impact', :sector => 'electronics')
 #  IndicatorTranslation.create(:indicator_id => indicator_1.id, :name => 'Carbon footprint', :unit => 'kg CO<sub>2</sub>-eq', :comment => 'Contribution to Global Warming Impact', :locale => 'en')
   
#   material_wood = Material.find(:all, :conditions => ["name = 'Wood'"]).first
#   material_steel = Material.find(:all, :conditions => ["name = 'Steel (sheet)'"]).first
#   material_aluminium = Material.find(:all, :conditions => ["name = 'Aluminium'"]).first
#   material_plastics = Material.find(:all, :conditions => ["name = 'Plastics (ABS/PC)'"]).first   
#   material_mainboard = Material.find(:all, :conditions => ["name = 'Mainboard'"]).first   
#   material_otherpcb = Material.find(:all, :conditions => ["name = 'Other PCB'"]).first
#   material_ddr3_4gb = Material.find(:all, :conditions => ["name = 'DDR3 - 4GB'"]).first   
#   material_ddr3_8gb = Material.find(:all, :conditions => ["name = 'DDR3 - 8GB'"]).first   
#   material_servertype = Material.find(:all, :conditions => ["name = 'server-type CPU'"]).first
#   material_pctype = Material.find(:all, :conditions => ["name = 'PC-type CPU'"]).first
#   material_laptoptype = Material.find(:all, :conditions => ["name = 'laptop-type CPU'"]).first   
#   material_ssd = Material.find(:all, :conditions => ["name = 'SSD'"]).first   
#   material_hdd = Material.find(:all, :conditions => ["name = 'HDD'"]).first   
#   material_output = Material.find(:all, :conditions => ["name = 'Output rating'"]).first   
#   material_capacity = Material.find(:all, :conditions => ["name = 'Capacity'"]).first
   
    indicator_copper = Indicator.create(:name => 'Copper', :abbr => 'Cu', :unit => 'g', :comment => '', :sector => 'electronics')
    indicator_gold = Indicator.create(:name => 'Gold', :abbr => 'Au', :unit => 'g', :comment => '', :sector => 'electronics')   
    indicator_tantalum = Indicator.create(:name => 'Tantalum', :abbr => 'Ta', :unit => 'g', :comment => '', :sector => 'electronics')    
    indicator_rare = Indicator.create(:name => 'other Rare Earth metals (Yttrium, Cerbium, ...)', :abbr => 'oREm', :unit => 'g', :comment => '', :sector => 'electronics')
    indicator_indium = Indicator.create(:name => 'Indium', :abbr => 'In', :unit => 'g', :comment => '', :sector => 'electronics')    
    indicator_cobalt = Indicator.create(:name => 'Cobalt', :abbr => 'Co', :unit => 'g', :comment => '', :sector => 'electronics')
    indicator_aluminium = Indicator.create(:name => 'Aluminium', :abbr => 'Al', :unit => 'g', :comment => '', :sector => 'electronics')      
    indicator_steel = Indicator.create(:name => 'Steel', :abbr => 'Stl', :unit => 'g', :comment => '', :sector => 'electronics')    
    indicator_neodymium = Indicator.create(:name => 'Neodymium', :abbr => 'Nd', :unit => 'g', :comment => '', :sector => 'electronics')
    indicator_platinum = Indicator.create(:name => 'Platinum, Ruthenium, Palladium', :abbr => 'Pt,Ru,Pd', :unit => 'g', :comment => '', :sector => 'electronics')    

   
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'DRAM, DDR3, 40 nm, max. 1Gb/chip', :value => 1.972)  
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'DRAM, DDR3, 40 nm, max. 1Gb/chip', :value => 0.008)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'DRAM, DDR3, 30 nm, 2Gb/chip', :value => 1.592)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'DRAM, DDR3, 30 nm, 2Gb/chip', :value => 0.004)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'DRAM, DDR3, 20 nm, 4Gb/chip and above', :value => 1.25)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'DRAM, DDR3, 20 nm, 4Gb/chip and above', :value => 0.001)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'DRAM, LPDDR2, 40 nm, max. 2Gb/chip', :value => 1.604)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'DRAM, LPDDR2, 40 nm, max. 2Gb/chip', :value => 0.004)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'DRAM, LPDDR2, 30 nm, 4Gb/chip and above', :value => 1.628)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'DRAM, LPDDR2, 30 nm, 4Gb/chip and above', :value => 0.001)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'NAND Flash, 40nm, max. 16Gb/chip', :value => 0.3925)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'NAND Flash, 40nm, max. 16Gb/chip', :value => 0.0005)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'NAND Flash, 20nm, 32Gb/chip and above', :value => 0.129375)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'NAND Flash, 20nm, 32Gb/chip and above', :value => 0.00025)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Graphic memory (GDDR5), 30 nm', :value => 2.368)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'Graphic memory (GDDR5), 30 nm', :value => 0.004)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'PC mainboard, ATX (744 cm<sup>2</sup>)', :value => 19.27)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'PC mainboard, ATX (744 cm<sup>2</sup>)', :value => 56)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'PC mainboard, ATX (744 cm<sup>2</sup>)', :value => 0.0345)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'PC memory module (DIMM)', :value => 0.84)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'PC memory module (DIMM)', :value => 2.45)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'PC memory module (DIMM)', :value => 0.0015)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'PC graphics card (118 cm<sup>2</sup>)', :value => 2.19)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'PC graphics card (118 cm<sup>2</sup>)', :value => 5.92)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'PC graphics card (118 cm<sup>2</sup>)', :value => 0.0055)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Laptop mainboard (270 cm<sup>2</sup>)', :value => 8.96)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'Laptop mainboard (270 cm<sup>2</sup>)', :value => 27.1)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'Laptop mainboard (270 cm<sup>2</sup>)', :value => 0.0125)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Laptop memory module (SO DIMM)', :value => 0.53)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'Laptop memory module (SO DIMM)', :value => 1.53)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'Laptop memory module (SO DIMM)', :value => 0.0009)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Laptop WLAN module (mini PCIe card)', :value => 0.28)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'Laptop WLAN module (mini PCIe card)', :value => 0.75)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'Laptop WLAN module (mini PCIe card)', :value => 0.0007)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Laptop, other rigid boards (e.g. power button PCB, USB connector PCB, touchpad PCB; 20 cm<sup>2</sup>)', :value => 0.23)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'Laptop, other rigid boards (e.g. power button PCB, USB connector PCB, touchpad PCB; 20 cm<sup>2</sup>)', :value => 0.5)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'Laptop, other rigid boards (e.g. power button PCB, USB connector PCB, touchpad PCB; 20 cm<sup>2</sup>)', :value => 0)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Tablets (7&quot; range), mainboard (50 cm<sup>2</sup>)', :value => 1.66)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'Tablets (7&quot; range), mainboard (50 cm<sup>2</sup>)', :value => 5.02)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'Tablets (7&quot; range), mainboard (50 cm<sup>2</sup>)', :value => 0.0023)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Tablets (10&quot; range), mainboard (80 cm<sup>2</sup>)', :value => 2.66)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'Tablets (10&quot; range), mainboard (80 cm<sup>2</sup>)', :value => 8.03)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'Tablets (10&quot; range), mainboard (80 cm<sup>2</sup>)', :value => 0.0037)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Server mainboard E-ATX (1007 cm<sup>2</sup>)', :value => 39.87)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'Server mainboard E-ATX (1007 cm<sup>2</sup>)', :value => 126.32)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'Server mainboard E-ATX (1007 cm<sup>2</sup>)', :value => 0)
    
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '1 core, application: server', :value => 10)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '2 cores, application: server', :value => 12)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '4 cores, application: server', :value => 16)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '6 cores, application: server', :value => 30)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '8 cores, application: server', :value => 35)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '10 cores, application: server', :value => 35)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '1 core, application: desktop PC', :value => 3)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '2 cores, application: desktop PC', :value => 8)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '4 cores, application: desktop PC', :value => 16)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '6 cores, application: desktop PC', :value => 22)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '1 core, application: mobile', :value => 3)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '2 cores, application: mobile', :value => 8)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '4 cores, application: mobile', :value => 16)
    
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => 'SMD, case size A, 3.2x1.6mm', :value => 0.0042)
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => 'SMD, case size B, 3.5x2.8mm', :value => 0.01275)
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => 'SMD, case size C, 6.0x3.2mm', :value => 0.0405)
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => 'SMD, case size D, 7.3x4.3mm', :value => 0.06225)
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => 'SMD, case size P, 2.0x1.2mm', :value => 0.00369)
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => 'SMD, case size J, 1.6x0.8mm', :value => 0.000885)
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => 'SMD, case size K, 1.0x0.5mm', :value => 0.0027)
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 250 cd/m<sup>2</sup>', :value => 0.0175)
    ExcelValue.create(:indicator_id => indicator_rare.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 250 cd/m<sup>2</sup>', :value => 0.000173)
    ExcelValue.create(:indicator_id => indicator_indium.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 250 cd/m<sup>2</sup>', :value => 0.000001005)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 350 cd/m<sup>2</sup>', :value => 0.0175)
    ExcelValue.create(:indicator_id => indicator_rare.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 350 cd/m<sup>2</sup>', :value => 0.000173)
    ExcelValue.create(:indicator_id => indicator_indium.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 350 cd/m<sup>2</sup>', :value => 0.00000141)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 450 cd/m<sup>2</sup>', :value => 0.0175)
    ExcelValue.create(:indicator_id => indicator_rare.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 450 cd/m<sup>2</sup>', :value => 0.000173)
    ExcelValue.create(:indicator_id => indicator_indium.id, :phase => 'MANUFACTURING', :name => 'LCD, edge lit, 450 cd/m<sup>2</sup>', :value => 0.000001815)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'LCD, array (locally dimmable), 300 cd/m<sup>2</sup>', :value => 0.0175)
    ExcelValue.create(:indicator_id => indicator_rare.id, :phase => 'MANUFACTURING', :name => 'LCD, array (locally dimmable), 300 cd/m<sup>2</sup>', :value => 0.000173)
    ExcelValue.create(:indicator_id => indicator_indium.id, :phase => 'MANUFACTURING', :name => 'LCD, array (locally dimmable), 300 cd/m<sup>2</sup>', :value => 0.00000075)    

    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '3,5&quot; HDD', :value => 10)
    ExcelValue.create(:indicator_id => indicator_steel.id, :phase => 'MANUFACTURING', :name => '3,5&quot; HDD', :value => 150)
    ExcelValue.create(:indicator_id => indicator_cobalt.id, :phase => 'MANUFACTURING', :name => '3,5&quot; HDD', :value => 0.0084)    
    ExcelValue.create(:indicator_id => indicator_aluminium.id, :phase => 'MANUFACTURING', :name => '3,5&quot; HDD', :value => 300)    
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => '3,5&quot; HDD', :value => 0.0004345)    
    ExcelValue.create(:indicator_id => indicator_neodymium.id, :phase => 'MANUFACTURING', :name => '3,5&quot; HDD', :value => 4)    
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => '3,5&quot; HDD', :value => 0.002685)    
    ExcelValue.create(:indicator_id => indicator_platinum.id, :phase => 'MANUFACTURING', :name => '3,5&quot; HDD', :value => 0.00789)    
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => '2,5&quot; HDD', :value => 3)    
    ExcelValue.create(:indicator_id => indicator_cobalt.id, :phase => 'MANUFACTURING', :name => '2,5&quot; HDD', :value => 0.0024)
    ExcelValue.create(:indicator_id => indicator_aluminium.id, :phase => 'MANUFACTURING', :name => '2,5&quot; HDD', :value => 65)    
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => '2,5&quot; HDD', :value => 0.0004345)    
    ExcelValue.create(:indicator_id => indicator_neodymium.id, :phase => 'MANUFACTURING', :name => '2,5&quot; HDD', :value => 2)    
    ExcelValue.create(:indicator_id => indicator_tantalum.id, :phase => 'MANUFACTURING', :name => '2,5&quot; HDD', :value => 0.00076)    
    ExcelValue.create(:indicator_id => indicator_platinum.id, :phase => 'MANUFACTURING', :name => '2,5&quot; HDD', :value => 0.0025)    
    
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'HDD test', :value => 0.8333333) 
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Optical Disk Drive', :value => 1.8)
  #  ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Power Supply', :value => 0.7869)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'Power Supply', :value => 0.0574)
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'Power Supply', :value => 0.3)    
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => '2,5&quot; HDD', :value => 0.3)   
   
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'WLAN', :value => 0.67032)   
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'USB', :value => 0.0007733770944)   
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'HDMI', :value => 0.0000876870558)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'VGA, DVI', :value => 0.003570981459528)
    ExcelValue.create(:indicator_id => indicator_gold.id, :phase => 'MANUFACTURING', :name => 'RJ 45', :value => 0.000033328608984)    
    
       
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'battery (Li-ion)', :value => 0.35)    
    ExcelValue.create(:indicator_id => indicator_cobalt.id, :phase => 'MANUFACTURING', :name => 'battery (Li-ion)', :value => 1.25)    
   
    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'wood (oak)', :value => 0.00044)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'steel', :value => 0.01185)
    ExcelValue.create(:indicator_id => indicator_steel.id, :phase => 'MANUFACTURING', :name => 'steel', :value => 1)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'steel', :value => 0.000496183206107)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'aluminium', :value => 0.01035)
    ExcelValue.create(:indicator_id => indicator_aluminium.id, :phase => 'MANUFACTURING', :name => 'aluminium', :value => 1)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'aluminium', :value => 0.000296296296)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'PC/ABS', :value => 0.00435)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'MANUFACTURING', :name => 'cable', :value => 0.00418)   
    ExcelValue.create(:indicator_id => indicator_copper.id, :phase => 'MANUFACTURING', :name => 'cable', :value => 0.5)    
  
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Corrugated board box', :value => 1.511661)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Wooden pallet', :value => 0.276962989367673)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Stretch film LLDPE', :value => 2.42612516866052)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'LDPE bag', :value => 2.70166051613762)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Shrink film LDPE', :value => 2.67126294382248)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Steel strapping', :value => 2.72997956988726)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'PP strapping', :value => 2.55546116870192)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Cushioning EPS', :value => 4.23297376507417)  
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'PVC blister', :value => 2.99043203021327)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Delivery van', :value => 1.65798125681194)      
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Transport Lorry 3.5-7.5 t', :value => 0.472726734455659) 
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Transport Lorry 7.5-16 t', :value => 0.224188099756196)  
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Transport Lorry 16-32 t', :value => 0.167505649365557) 
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Transport Lorry > 32 t', :value => 0.106818523217696)
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Transport transoceanic', :value => 0.010715135787058)    
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Transport by rail', :value => 0.039441578001139)   
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Transport by plane, international', :value => 1.06574152281087) 
    ExcelValue.create(:indicator_id => indicator_1.id, :phase => 'DISTRIBUTION', :name => 'Transport by plane', :value => 1.09860759039131)  
end

if 1 == -1
    indicator_1_se = Indicator.create(:name => 'Global warming potential (CO2 eq.)', :unit => 'kg CO<sub>2</sub>-eq', :comment => '', :sector => 'sensors')
    IndicatorTranslation.create(:indicator_id => indicator_1_se.id, :name => 'Global warming potential (CO2 eq.)', :unit => 'kg CO<sub>2</sub>-eq', :comment => '', :locale => 'en')
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'MEMS/sensor chip',  :value => 0.149)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'Microcontroller ICs',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'Memory',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'Sensor Printed Circuit Board',  :value => 0.01331)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'battery (Li-ion)',  :value => 12.5)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'housing, steel',  :value => 0.01185)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Cables', :name => 'cable',  :value => 4.18)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Energy', :name => 'Electricity (EU-27)',  :value => 0.36327)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Energy', :name => 'Natural gas',  :value => 56.76)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Energy', :name => 'Other fuels',  :value => 80)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Grease',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Hydraulic oil',  :value => 3.56)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Nitrogen',  :value => 0.083)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Hydrogen',  :value => 1.702)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Argon',  :value => 0.0689)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Organic substances',  :value => 2)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Sulfuric acid',  :value => -0.36)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Nitric acid',  :value => 1.89)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Caustic soda',  :value => 0.45)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Exhaust',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Vacuum',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Clean Dry Air',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'High Pressure Clean Dry Air',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Compressed Air',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Water Cooled (by Refrigeration)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Ultrapure Water / Deionized Water',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Hot Ultrapure Water / Deionized Water, pressurized, Temp',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Nitrogen',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '01_Aluminium strip / sheet / foil',  :value => 0.29)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '02_Aluminium sheet parts (d=0.2  2 mm)',  :value => 0.93)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '03_Aluminium foil (processed, d=0.005  0.2)',  :value => 1.64)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '04_Aluminium profile (processed)',  :value => 1.02)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '05_Copper strip / sheet / foil',  :value => 0.44)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '06_Steel, hot rolled',  :value => 0.7)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '07_Stainless steel, hot rolled',  :value => 1.6)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '08_Steel, cold rolled / plates',  :value => 0.91)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '09_Steel parts (processed coil, stamped or bended or otherwise processed plates)',  :value => 1.02)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '10_Stainless steel, processed coil',  :value => 1.81)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '11_Stainless steel parts (stamped or bended or otherwise processed plates)',  :value => 1.92)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '12_Zinc sheet parts (d=0.7mm)',  :value => 1.7)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '13_Glass, flat, annealed',  :value => 0.34)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '14_Glass, flat, processed',  :value => 0.43)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '15_Paper (calendered)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '16_Paper, cardboard (printed)',  :value => 0.0014)
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '17_Newspaper (printed)',  :value => 0.0013)
    
    
    indicator_2_se = Indicator.create(:name => 'Electricity consumption (kWh)', :unit => 'kWh', :comment => '', :sector => 'sensors')
    IndicatorTranslation.create(:indicator_id => indicator_2_se.id, :name => 'Electricity consumption (kWh)', :unit => 'kWh', :comment => '', :locale => 'en')
    ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'MEMS/sensor chip',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'Microcontroller ICs',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'Memory',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'Sensor Printed Circuit Board',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'battery (Li-ion)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'housing, steel',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'MANUFACTURING', :family => 'Cables', :name => 'cable',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Energy', :name => 'Electricity (EU-27)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Energy', :name => 'Natural gas',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Energy', :name => 'Other fuels',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Grease',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Hydraulic oil',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Nitrogen',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Hydrogen',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Argon',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Organic substances',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Sulfuric acid',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Nitric acid',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Consumables', :name => 'Caustic soda',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Exhaust',  :value => 0.0037)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Vacuum',  :value => 0.06)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Clean Dry Air',  :value => 0.147)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'High Pressure Clean Dry Air',  :value => 0.175)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Compressed Air',  :value => 0.1)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Water Cooled (by Refrigeration)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Ultrapure Water / Deionized Water',  :value => 9)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Hot Ultrapure Water / Deionized Water, pressurized, Temp',  :value => 92.2)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'USE', :family => 'Utilities', :name => 'Nitrogen',  :value => 0.25)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '01_Aluminium strip / sheet / foil',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '02_Aluminium sheet parts (d=0.2  2 mm)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '03_Aluminium foil (processed, d=0.005  0.2)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '04_Aluminium profile (processed)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '05_Copper strip / sheet / foil',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '06_Steel, hot rolled',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '07_Stainless steel, hot rolled',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '08_Steel, cold rolled / plates',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '09_Steel parts (processed coil, stamped or bended or otherwise processed plates)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '10_Stainless steel, processed coil',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '11_Stainless steel parts (stamped or bended or otherwise processed plates)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '12_Zinc sheet parts (d=0.7mm)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '13_Glass, flat, annealed',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '14_Glass, flat, processed',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '15_Paper (calendered)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '16_Paper, cardboard (printed)',  :value => 0)
    ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'DISPOSAL', :family => 'Yield loss recycling', :name => '17_Newspaper (printed)',  :value => 0)


end

if BpEconomicalPhase.all.size == 0
    BpElectronicEconomic.delete_all
    BpEconomicalPhase.delete_all    
    BpEconomicalFamily.delete_all        
    BpEconomicalFlow.delete_all    

    bp_economical_phase_0 = BpEconomicalPhase.create(:name => 'Raw materials')  
    bp_economical_family_0_1 = BpEconomicalFamily.create(:name => 'Raw materials', :bp_economical_phase_id => bp_economical_phase_0.id)
    bp_economical_family_0_2 = BpEconomicalFamily.create(:name => 'Compounding materials and master-batch', :bp_economical_phase_id => bp_economical_phase_0.id)    

    bp_economical_phase_1 = BpEconomicalPhase.create(:name => 'Transport')
    
    bp_economical_phase_2 = BpEconomicalPhase.create(:name => 'Processing')
    bp_economical_family_2_1 = BpEconomicalFamily.create(:name => 'Processes', :bp_economical_phase_id => bp_economical_phase_2.id)
    bp_economical_family_2_2 = BpEconomicalFamily.create(:name => 'Finishing', :bp_economical_phase_id => bp_economical_phase_2.id)    
    bp_economical_family_2_3 = BpEconomicalFamily.create(:name => 'Transport', :bp_economical_phase_id => bp_economical_phase_2.id)    
    
    bp_economical_phase_3 = BpEconomicalPhase.create(:name => 'Distribution')
    bp_economical_family_3_1 = BpEconomicalFamily.create(:name => 'Packaging', :bp_economical_phase_id => bp_economical_phase_3.id)    
    bp_economical_family_3_2 = BpEconomicalFamily.create(:name => 'Transport', :bp_economical_phase_id => bp_economical_phase_3.id)    
    
    bp_economical_phase_4 = BpEconomicalPhase.create(:name => 'End-Of-Life')    
    bp_economical_family_4_1 = BpEconomicalFamily.create(:name => 'Landfill', :bp_economical_phase_id => bp_economical_phase_4.id)    
    bp_economical_family_4_2 = BpEconomicalFamily.create(:name => 'Incineration with energy recovery', :bp_economical_phase_id => bp_economical_phase_4.id)
    bp_economical_family_4_3 = BpEconomicalFamily.create(:name => 'Composting', :bp_economical_phase_id => bp_economical_phase_4.id)
    bp_economical_family_4_4 = BpEconomicalFamily.create(:name => 'Recycling', :bp_economical_phase_id => bp_economical_phase_4.id)
    bp_economical_family_4_5 = BpEconomicalFamily.create(:name => 'Transport', :bp_economical_phase_id => bp_economical_phase_4.id)    
    

end


if EconomicalPhase.all.size == 0
    ElectronicEconomic.delete_all
    EconomicalPhase.delete_all
    EconomicalPhaseTranslation.delete_all    
    EconomicalFamily.delete_all    
    EconomicalFamilyTranslation.delete_all    
    EconomicalFlow.delete_all    
    EconomicalFlowTranslation.delete_all    

    ## MATERIALS
    
    economical_phase_0 = EconomicalPhase.create(:name => 'Materials')
    EconomicalPhaseTranslation.create(:economical_phase_id => economical_phase_0.id, :name => 'Materials', :locale => 'en')
    
    economical_family_1_1 = EconomicalFamily.create(:name => 'Materials', :economical_phase_id => economical_phase_0.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_1_1.id, :name => 'Materials', :locale => 'en')

    economical_family_2_1 = EconomicalFamily.create(:name => 'Components', :economical_phase_id => economical_phase_0.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_2_1.id, :name => 'Components', :locale => 'en')


    ## MANUFACTURING
    
    economical_phase_1 = EconomicalPhase.create(:name => 'Manufacturing')
    EconomicalPhaseTranslation.create(:economical_phase_id => economical_phase_1.id, :name => 'Manufacturing', :locale => 'en')
    
    economical_family_1 = EconomicalFamily.create(:name => 'Materials', :economical_phase_id => economical_phase_1.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_1.id, :name => 'Materials', :locale => 'en')

    economical_family_2 = EconomicalFamily.create(:name => 'Processes', :economical_phase_id => economical_phase_1.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_2.id, :name => 'Processes', :locale => 'en')

    ## DISTRIBUTION

    economical_phase_2 = EconomicalPhase.create(:name => 'Distribution')
    EconomicalPhaseTranslation.create(:economical_phase_id => economical_phase_2.id, :name => 'Distribution', :locale => 'en')
        
    economical_family_3 = EconomicalFamily.create(:name => 'Packaging', :economical_phase_id => economical_phase_2.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_3.id, :name => 'Packaging', :locale => 'en')        
    economical_family_4 = EconomicalFamily.create(:name => 'Transport', :economical_phase_id => economical_phase_2.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_4.id, :name => 'Transport', :locale => 'en')

    ## USE 

    economical_phase_4 = EconomicalPhase.create(:name => 'Use')
    EconomicalPhaseTranslation.create(:economical_phase_id => economical_phase_4.id, :name => 'Use', :locale => 'en')
       
    economical_family_5 = EconomicalFamily.create(:name => 'Energy consumption', :economical_phase_id => economical_phase_4.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_5.id, :name => 'Energy consumption', :locale => 'en')
    
    economical_family_6 = EconomicalFamily.create(:name => 'Consumables', :economical_phase_id => economical_phase_4.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_6.id, :name => 'Consumables', :locale => 'en')
    
    economical_family_7 = EconomicalFamily.create(:name => 'Repair&Maintenance', :economical_phase_id => economical_phase_4.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_7.id, :name => 'Repair&Maintenance', :locale => 'en')
    
    ## END-OF-LIFE
        
    economical_phase_5 = EconomicalPhase.create(:name => 'End-of-life')
    EconomicalPhaseTranslation.create(:economical_phase_id => economical_phase_5.id, :name => 'End-of-life', :locale => 'en')

    economical_family_8 = EconomicalFamily.create(:name => 'Reuse', :economical_phase_id => economical_phase_5.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_8.id, :name => 'Reuse', :locale => 'en')

    economical_family_9 = EconomicalFamily.create(:name => 'Recycling', :economical_phase_id => economical_phase_5.id)
    EconomicalFamilyTranslation.create(:economical_family_id => economical_family_9.id, :name => 'Recycling', :locale => 'en')
    
end

if PhCountryInfo.all.size == 0
   PhCountryInfo.delete_all
   PhCountryInfo.create(:name => 'Africa', :co2 => 637, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Asia', :co2 => 746, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Australia', :co2 => 841, :mg => 0.0, :poly => 0.0, :wafers => 0.0, :cells => 1.0, :modules => 1.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Austria', :co2 => 188, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Brazil', :co2 => 87, :mg => 5.0, :poly => 0.0, :wafers => 0.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Belgium', :co2 => 220, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)      
   PhCountryInfo.create(:name => 'Canada', :co2 => 186, :mg => 0.0, :poly => 12.0, :wafers => 0.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Chile', :co2 => 410, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'China', :co2 => 766, :mg => 53.0, :poly => 10.0, :wafers => 25.0, :cells => 50.0, :modules => 49.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Czech Republic', :co2 => 589, :mg => 0.0, :poly => 0.0, :wafers => 0.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)   
   PhCountryInfo.create(:name => 'Denmark', :co2 => 360, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Estonia', :co2 => 1014, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'EU-27', :co2 => 429, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Eurasia', :co2 => 349, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Finland', :co2 => 229, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'France', :co2 => 79, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Germany', :co2 => 461, :mg => 0.0, :poly => 0.0, :wafers => 0.0, :cells => 7.0, :modules => 8.0, :cdte => 22.0, :cigs => 50.0)
   PhCountryInfo.create(:name => 'Greece', :co2 => 718, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Hungary', :co2 => 317, :mg => 0.0, :poly => 12.0, :wafers => 0.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Iceland', :co2 => 0.0, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'India', :co2 => 912, :mg => 0.0, :poly => 0.0, :wafers => 0.0, :cells => 4.0, :modules => 7.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Ireland', :co2 => 458, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Israel', :co2 => 689, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Italy', :co2 => 406, :mg => 0.0, :poly => 5.0, :wafers => 0.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)   
   PhCountryInfo.create(:name => 'Japan', :co2 => 416, :mg => 0.0, :poly => 14.0, :wafers => 38.0, :cells => 2.0, :modules => 2.0, :cdte => 0.0, :cigs => 4.0)   
   PhCountryInfo.create(:name => 'Korea', :co2 => 533, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Latin America', :co2 => 197, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Luxembourg', :co2 => 410, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Malaysia', :co2 => 727, :mg => 0.0, :poly => 0.0, :wafers => 0.0, :cells => 0.0, :modules => 0.0, :cdte => 65.0, :cigs => 0.0)   
   PhCountryInfo.create(:name => 'Mexico', :co2 => 455, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Middle East', :co2 => 674, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Netherlands', :co2 => 415, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'New Zealand', :co2 => 150, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Norway', :co2 => 17, :mg => 6.0, :poly => 0.0, :wafers => 4.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Philippines', :co2 => 481, :mg => 0.0, :poly => 0.0, :wafers => 10.0, :cells => 14.0, :modules => 16.0, :cdte => 0.0, :cigs => 0.0)   
   PhCountryInfo.create(:name => 'Poland', :co2 => 781, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Portugal', :co2 => 255, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Russia', :co2 => 639, :mg => 10.0, :poly => 0.0, :wafers => 0.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Singapore', :co2 => 499, :mg => 0.0, :poly => 0.0, :wafers => 6.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)   
   PhCountryInfo.create(:name => 'Slovak Republic', :co2 => 197, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'Slovenia', :co2 => 325, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'South Korea', :co2 => 533.0, :mg => 0.0, :poly => 0.0, :wafers => 0.0, :cells => 0.0, :modules => 2.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Spain', :co2 => 238, :mg => 0.0, :poly => 4.0, :wafers => 0.0, :cells => 0.0, :modules => 8.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Sweden', :co2 => 30, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)   
   PhCountryInfo.create(:name => 'Switzerland', :co2 => 27, :mg => 0.0, :poly => 0.0, :wafers => 6.0, :cells => 0.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)
   PhCountryInfo.create(:name => 'Taiwan', :co2 => 768, :mg => 0.0, :poly => 0.0, :wafers => 0.0, :cells => 5.0, :modules => 0.0, :cdte => 0.0, :cigs => 0.0)   
   PhCountryInfo.create(:name => 'Turkey', :co2 => 460, :mg => -1.0, :poly => -1.0, :wafers => -1.0, :cells => -1.0, :modules => -1.0, :cdte => -1.0, :cigs => -1.0)
   PhCountryInfo.create(:name => 'United Kingdom', :co2 => 457, :mg => 0.0, :poly => 0.0, :wafers => 0.0, :cells => 0.0, :modules => 3.0, :cdte => 0.0, :cigs => 0.0)   
   PhCountryInfo.create(:name => 'United States', :co2 => 522, :mg => 5.0, :poly => 43.0, :wafers => 11.0, :cells => 16.0, :modules => 4.0, :cdte => 12.0, :cigs => 45.0)   
end

################
#Common section#
################

#if Unit.all.size == 0
 #  unit_kg = Unit.create(:name => 'Kg')
  # unit_units = Unit.create(:name => 'Unit(s)')
   #unit_kwh = Unit.create(:name => 'Kwh')
   #unit_kg_trans = UnitTranslation.create(:unit_id => unit_kg.id, :name => 'Kg', :locale => 'en')
#end

if PhMountingType.all.size == 0
      PhMountingType.delete_all
      PhMountingType.create(:name => 'On Roof - Mounted')
      PhMountingType.create(:name => 'On Roof - Integrated')      
      PhMountingType.create(:name => 'Facade - Mounted')
      PhMountingType.create(:name => 'Facade - Integrated')
      PhMountingType.create(:name => 'Open Ground')      
      #unit_kg_trans = UnitTranslation.create(:unit_id => unit_kg.id, :name => 'Kg', :locale => 'en')
end  

if PhModuleType.all.size == 0
    PhModuleType.delete_all
    PhModuleType.create(:name => 'amorphous Silicon', :efficiency => 7.25, :lifetime => 25.0, :records => 10.1)
    PhModuleType.create(:name => 'polycrystalline Silicon', :efficiency => 15.11, :lifetime => 30.0, :records => 18.5)
    PhModuleType.create(:name => 'monocrystalline Silicon', :efficiency => 16.86, :lifetime => 30.0, :records => 22.9)
    PhModuleType.create(:name => 'CdTe Thinfilm', :efficiency => 11.32, :lifetime => 25.0, :records => 15.3)
    PhModuleType.create(:name => 'CIS/CIGS Thinfilm', :efficiency => 12.02, :lifetime => 25.0, :records => 15.7)    
    PhModuleType.create(:name => 'Not Specified', :efficiency => 0.0, :lifetime => 0.0, :records => 0.0)    
end

if PhUnit.all.size == 0
    PhUnit.create(:name => 'm<sup>2</sup>', :unit_filter => 'area', :conversion_factor => 1.0)
    PhUnit.create(:name => 'a', :unit_filter => 'area', :conversion_factor => 100.0)
    PhUnit.create(:name => 'ha', :unit_filter => 'area', :conversion_factor => 10000.0)    
    PhUnit.create(:name => 'km<sup>2</sup>', :unit_filter => 'area', :conversion_factor => 1000000.0)
    PhUnit.create(:name => 'Peak Power [kWp]', :unit_filter => 'power', :conversion_factor => -1.0)    
    PhUnit.create(:name => 'Yearly Power Output [kWh/a]', :unit_filter => 'power', :conversion_factor => 1.0)
    PhUnit.create(:name => 'Monthly Power Output [kWh/month]', :unit_filter => 'power', :conversion_factor => 12.0)
    PhUnit.create(:name => 'Daily Power Output [kWh/day]', :unit_filter => 'power', :conversion_factor => 365.242199)    
 #   PhUnit.create(:name => 'Average Power Output [kW]', :unit_filter => 'power', :conversion_factor => 0.000114155)    
   PhUnit.create(:name => 'Average Power Output [kW]', :unit_filter => 'power', :conversion_factor => 8760) 
end

if PhBatteryType.all.size == 0
    PhBatteryType.create(:name => 'Lead Acid')
    PhBatteryType.create(:name => 'DUMMY')
end

if PhDatabaseMaterial.all.size == 0
   PhDatabaseMaterial.delete_all
   PhDatabaseMaterial.create(:module => 'CdTe', :target => 'Thinfilm', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'm-Si', :target => 'Si Feedstock', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'm-Si', :target => 'Wafer', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'm-Si', :target => 'Cell', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'm-Si', :target => 'Module/Laminate', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'm-Si', :target => 'Module/Framed Panel', :default_value_co2 => 13.71, :default_value_pe => 138.0)
   PhDatabaseMaterial.create(:module => 'm-Si', :target => 'Total Module Laminate', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'm-Si', :target => 'Total Module Framed Panel', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'p-Si', :target => 'Si Feedstock', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'p-Si', :target => 'Wafer', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'p-Si', :target => 'Cell', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'p-Si', :target => 'Module/Laminate', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'p-Si', :target => 'Module/Framed Panel', :default_value_co2 => 13.705, :default_value_pe => 133.0)
   PhDatabaseMaterial.create(:module => 'p-Si', :target => 'Total Module Laminate', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'p-Si', :target => 'Total Module Framed Panel', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'a-Si', :target => 'Module Laminate', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'a-Si', :target => 'Module Framed Panel', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'CIS/CIGS', :target => 'Module Laminate', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'CIS/CIGS', :target => 'Module Framed Panel', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'Electrical Cabling', :target => 'Facade Mounted System', :default_value_co2 => 0.570, :default_value_pe => 20.6)  
   PhDatabaseMaterial.create(:module => 'Electrical Cabling', :target => 'Roof Mounted System', :default_value_co2 => 0.570, :default_value_pe => 20.6)
   PhDatabaseMaterial.create(:module => 'Electrical Cabling', :target => 'Ground Mounted System', :default_value_co2 => 2.080, :default_value_pe => 35.5)   
   PhDatabaseMaterial.create(:module => 'Mounting', :target => 'Roof Mounted Structures', :default_value_co2 => 35.77, :default_value_pe => 474.33)  
   PhDatabaseMaterial.create(:module => 'Mounting', :target => 'Roof Integrated Structures', :default_value_co2 => 31.67, :default_value_pe => 438)
   PhDatabaseMaterial.create(:module => 'Mounting', :target => 'Open Ground Structures', :default_value_co2 => 54.36, :default_value_pe => 715)
   PhDatabaseMaterial.create(:module => 'Mounting', :target => 'Facade Mounted Structures', :default_value_co2 => 36.71, :default_value_pe => 480.5)
   PhDatabaseMaterial.create(:module => 'Mounting', :target => 'Facade Integrated Structures', :default_value_co2 => 39.975, :default_value_pe => 527.5)   
   PhDatabaseMaterial.create(:module => 'Electrics', :target => '1x Inverter Type 1', :default_value_co2 => 0.0, :default_value_pe => 0.0)  
   PhDatabaseMaterial.create(:module => 'Electrics', :target => '1x Inverter Type 2', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'Electrics Battery', :target => 'Lead Acid [kg / pc.]', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'Electrics Battery', :target => 'Lead Acid [per kg]', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'Electrics Battery', :target => 'Lithium Ion [kg / pc.]', :default_value_co2 => 0.0, :default_value_pe => 0.0)
   PhDatabaseMaterial.create(:module => 'Electrics Battery', :target => 'Lithium Ion [per kg]', :default_value_co2 => 0.0, :default_value_pe => 0.0)   
   PhDatabaseMaterial.create(:module => 'Maintenance', :target => 'Average Car Driving', :default_value_co2 => 0.195, :default_value_pe => 2.57)   
   PhDatabaseMaterial.create(:module => 'Maintenance', :target => 'Diesel Car Driving', :default_value_co2 => 0.185, :default_value_pe => 2.5)
   PhDatabaseMaterial.create(:module => 'Maintenance', :target => 'Gasoline Car Driving', :default_value_co2 => 0.2, :default_value_pe => 2.730)
   PhDatabaseMaterial.create(:module => 'Maintenance', :target => 'Tap Water', :default_value_co2 => 0.000399, :default_value_pe => 0.00617)   
end

#####################
#Sensors section#
#####################

if SeEnergyType.all.size == 0
   SeEnergyType.create(:name => 'Electricity', :unit => 'kWh/h')
   SeEnergyType.create(:name => 'Heat', :unit => 'kWh/h')
   SeEnergyType.create(:name => 'Natural Gas', :unit => 'GJ/h')
   SeEnergyType.create(:name => 'Other fuels', :unit => 'GJ/h')
end

if SeEnergyUse.all.size == 0
   puts "SeEnergyUse"
   SeEnergyUse.create(:name => 'Machine, operational times')
   SeEnergyUse.create(:name => 'Machine, downtimes')
   SeEnergyUse.create(:name => 'Overhead, infrastructure, at all times')
end

if SeCountryInfo.all.size == 0
   SeCountryInfo.delete_all
   SeCountryInfo.create(:name => 'Austria', :electricity => 0.17355, :order => '1')
   SeCountryInfo.create(:name => 'Belgium', :electricity => 0.22861,:order => '2')
   SeCountryInfo.create(:name => 'Bulgaria', :electricity => 0.53771,:order => '3')
   SeCountryInfo.create(:name => 'Cyprus', :electricity => 0.77388,:order => '4')
   SeCountryInfo.create(:name => 'Czech Republic', :electricity => 0.57391,:order => '5')
   SeCountryInfo.create(:name => 'Denmark', :electricity => 0.34783,:order => '6')
   SeCountryInfo.create(:name => 'Estonia', :electricity => 0.81058,:order => '7')
   SeCountryInfo.create(:name => 'Finland', :electricity => 0.21526,:order => '8')
   SeCountryInfo.create(:name => 'France', :electricity => 0.09613,:order => '9')
   SeCountryInfo.create(:name => 'Germany', :electricity => 0.45504,:order => '10')
   SeCountryInfo.create(:name => 'Greece', :electricity => 0.76449,:order => '11')
   SeCountryInfo.create(:name => 'Hungary', :electricity => 0.33247,:order => '12')
   SeCountryInfo.create(:name => 'Ireland', :electricity => 0.50439,:order => '13')
   SeCountryInfo.create(:name => 'Italy', :electricity => 0.41035,:order => '14')
   SeCountryInfo.create(:name => 'Latvia', :electricity => 0.1751,:order => '15')
   SeCountryInfo.create(:name => 'Lithuania', :electricity => 0.12645,:order => '16')
   SeCountryInfo.create(:name => 'Luxembourg', :electricity => 0.39149,:order => '17')
   SeCountryInfo.create(:name => 'Malta', :electricity => 1.0193,:order => '18')
   SeCountryInfo.create(:name => 'Netherlands', :electricity => 0.40266,:order => '19')
   SeCountryInfo.create(:name => 'Poland', :electricity => 0.68132,:order => '20')
   SeCountryInfo.create(:name => 'Portugal', :electricity => 0.3952,:order => '21')
   SeCountryInfo.create(:name => 'Romania', :electricity => 0.50306,:order => '22')
   SeCountryInfo.create(:name => 'Slovak Republic', :electricity => 0.23656,:order => '23')
   SeCountryInfo.create(:name => 'Slovenia', :electricity => 0.34492,:order => '24')
   SeCountryInfo.create(:name => 'Spain', :electricity => 0.31048,:order => '25')
   SeCountryInfo.create(:name => 'Sweden', :electricity => 0.04621,:order => '26')
   SeCountryInfo.create(:name => 'Switzerland', :electricity => 0.04294,:order => '27')
   SeCountryInfo.create(:name => 'Turkey', :electricity => 0.56207,:order => '28')
   SeCountryInfo.create(:name => 'Europe', :electricity => 0.36327,:order => '29')
end

if SeMaterial.all.size == 0
   SeMaterial.delete_all
   SeMaterial.create(:name => 'Aluminium strip / sheet / foil', :excel_name => '01_Aluminium strip / sheet / foil')
   SeMaterial.create(:name => 'Aluminium sheet parts (d=0.2  2 mm)', :excel_name => '02_Aluminium sheet parts (d=0.2  2 mm)')
   SeMaterial.create(:name => 'Aluminium foil (processed, d=0.005  0.2)', :excel_name => '03_Aluminium foil (processed, d=0.005  0.2)')
   SeMaterial.create(:name => 'Aluminium profile (processed)', :excel_name => '04_Aluminium profile (processed)')
   SeMaterial.create(:name => 'Copper strip / sheet / foil', :excel_name => '05_Copper strip / sheet / foil')
   SeMaterial.create(:name => 'Steel, hot rolled', :excel_name => '06_Steel, hot rolled')
   SeMaterial.create(:name => 'Stainless steel, hot rolled', :excel_name => '07_Stainless steel, hot rolled')
   SeMaterial.create(:name => 'Steel, cold rolled / plates', :excel_name => '08_Steel, cold rolled / plates')
   SeMaterial.create(:name => 'Steel parts (processed coil, stamped or bended or otherwise processed plates)', :excel_name => '09_Steel parts (processed coil, stamped or bended or otherwise processed plates)')
   SeMaterial.create(:name => 'Stainless steel, processed coil', :excel_name => '10_Stainless steel, processed coil')
   SeMaterial.create(:name => 'Stainless steel parts (stamped or bended or otherwise processed plates)', :excel_name => '11_Stainless steel parts (stamped or bended or otherwise processed plates)')
   SeMaterial.create(:name => 'Zinc sheet parts (d=0.7mm)', :excel_name => '12_Zinc sheet parts (d=0.7mm)')
   SeMaterial.create(:name => 'Glass, flat, annealed', :excel_name => '13_Glass, flat, annealed')
   SeMaterial.create(:name => 'Glass, flat, processed', :excel_name => '14_Glass, flat, processed')
   SeMaterial.create(:name => 'Paper (calendered)', :excel_name => '15_Paper (calendered)')
   SeMaterial.create(:name => 'Paper, cardboard (printed)', :excel_name => '16_Paper, cardboard (printed)')
   SeMaterial.create(:name => 'Newspaper (printed)', :excel_name => '17_Newspaper (printed)')
end

if SeConsumable.all.size == 0
   SeConsumable.delete_all
   SeConsumable.create(:name => 'Grease', :excel_name => 'Grease')
   SeConsumable.create(:name => 'Hydraulic oil', :excel_name => 'Hydraulic oil')
   SeConsumable.create(:name => 'Nitrogen', :excel_name => 'Nitrogen')
   SeConsumable.create(:name => 'Hydrogen', :excel_name => 'Hydrogen')
   SeConsumable.create(:name => 'Argon', :excel_name => 'Argon')
   SeConsumable.create(:name => 'Organic substances', :excel_name => 'Organic substances')
   SeConsumable.create(:name => 'Sulfuric acid', :excel_name => 'Sulfuric acid')
   SeConsumable.create(:name => 'Nitric acid', :excel_name => 'Nitric acid')
   SeConsumable.create(:name => 'Caustic soda', :excel_name => 'Caustic soda')
   SeConsumable.create(:name => 'Other', :excel_name => 'Other')
end

if SeUtility.all.size == 0
   SeUtility.create(:name => 'Exhaust', :excel_name=> 'Exhaust', :unit => 'Nm<sup>3</sup>/h')
   SeUtility.create(:name => 'Vacuum', :excel_name=> 'Vacuum', :unit => 'Nm<sup>3</sup>/h')
   SeUtility.create(:name => 'Clean Dry Air', :excel_name=> 'Clean Dry Air', :unit => 'Nm<sup>3</sup>/h')
   SeUtility.create(:name => 'High Pressure Clean Dry Air', :excel_name=> 'High Pressure Clean Dry Air', :unit => 'Nm<sup>3</sup>/h')
   SeUtility.create(:name => 'Compressed Air', :excel_name=> 'Compressed Air', :unit => 'Nm<sup>3</sup>/h')
   SeUtility.create(:name => 'Water Cooled (by Refrigeration)', :excel_name=> 'Water Cooled (by Refrigeration)', :unit => 'm<sup>3</sup>/h')
   SeUtility.create(:name => 'Ultrapure Water Deionized', :excel_name=> 'Ultrapure Water Deionized', :unit => 'm<sup>3</sup>/h')
   SeUtility.create(:name => 'Hot Ultrapure Water / Deionized Water, pressurized, Temp > 85&deg;', :excel_name=> 'Hot Ultrapure Water / Deionized Water, pressurized, Temp > 85&deg;', :unit => 'm<sup>3</sup>/h')
   SeUtility.create(:name => 'Nitrogen', :excel_name=> 'Nitrogen', :unit => 'Nm<sup>3</sup>/h')
end

if SeProductionYieldLossMaterial.all.size == 0
   SeProductionYieldLossMaterial.create(:name => 'Aluminium strip / sheet / foil', :action => 'nothing', :order => 1)
   SeProductionYieldLossMaterial.create(:name => 'Aluminium sheet parts (d=0.2 ... 2 mm)', :action => 'nothing', :order => 2 )
   SeProductionYieldLossMaterial.create(:name => 'Aluminium foil (processed, d=0.005 ... 0.2)', :action => 'nothing', :order => 3)
   SeProductionYieldLossMaterial.create(:name => 'Aluminium profile (processed)', :action => 'nothing', :order => 4)
   SeProductionYieldLossMaterial.create(:name => 'Copper strip / sheet / foil', :action => 'nothing', :order => 5)
   SeProductionYieldLossMaterial.create(:name => 'Steel, hot rolled', :action => 'nothing', :order => 6)
   SeProductionYieldLossMaterial.create(:name => 'Stainless steel, hot rolled', :action => 'nothing',:order => 7 )
   SeProductionYieldLossMaterial.create(:name => 'Steel, cold rolled / plates', :action => 'nothing', :order => 8 )
   SeProductionYieldLossMaterial.create(:name => 'Steel parts (processed coil, stamped or bended or otherwise processed plates)', :action => 'nothing', :order => 9)
   SeProductionYieldLossMaterial.create(:name => 'Stainless steel, processed coil', :action => 'nothing', :order => 10)
   SeProductionYieldLossMaterial.create(:name => 'Stainless steel parts (stamped or bended or otherwise processed plates)', :action => 'nothing', :order => 11)
   SeProductionYieldLossMaterial.create(:name => 'Zinc sheet parts (d=0.7mm)', :action => 'nothing', :order => 12)
   SeProductionYieldLossMaterial.create(:name => 'Glass, flat, annealed', :action => 'nothing', :order => 13)
   SeProductionYieldLossMaterial.create(:name => 'Glass, flat, processed', :action => 'nothing', :order => 14)
   #SeProductionYieldLossMaterial.create(:name => 'Paper (calendered)', :action => 'nothing', :order => 15)
   SeProductionYieldLossMaterial.create(:name => 'Paper, cardboard (printed)', :action => 'nothing', :order => 16 )
   SeProductionYieldLossMaterial.create(:name => 'Newspaper (printed)',:action => 'nothing', :order => 17 )
   SeProductionYieldLossMaterial.create(:name => 'Other', :action => 'other', :order => 18)
end


if SeComponent.all.size == 0
   se_component_mems = SeComponent.create(:name => 'MEMS/sensor chip', :unit => 'units/sensor node')
   se_component_microcontroller_ics = SeComponent.create(:name => 'Microcontroller ICs', :unit => 'units/sensor node')
   se_component_memory = SeComponent.create(:name => 'Memory', :unit => 'units/sensor node')
   se_component_printer_circuit_board = SeComponent.create(:name => 'Printed Circuit Board', :unit => 'cm<sup>2</sup>/sensor node')
   se_component_battery_li_ion = SeComponent.create(:name => 'Battery (Li-ion)', :unit => 'g/sensor node')
   se_component_housing_steel = SeComponent.create(:name => 'Housing, steel', :unit => 'g/sensor node')
end

#####################
#Bio-plastic section#
#####################

if BpMode.all.size == 0
   BpMode.delete_all
   BpModeTranslation.delete_all
   bp_mode_airplane = BpMode.create(:name => 'Airplane')   
   bp_mode_road = BpMode.create(:name => 'Road')   
   bp_mode_ship = BpMode.create(:name => 'Ship')   
   bp_mode_train = BpMode.create(:name => 'Train')
end   

if BpVehicle.all.size == 0
   BpVehicle.delete_all
   BpVehicleTranslation.delete_all
   bp_vehicle_1 = BpVehicle.create(:name => 'Aircraft intercontinental freight', :bp_mode_id => bp_mode_airplane.id)   
   bp_vehicle_2 = BpVehicle.create(:name => 'Aircraft continental freight', :bp_mode_id => bp_mode_airplane.id)
   bp_vehicle_3 = BpVehicle.create(:name => 'Delivery van <3.5 t', :bp_mode_id => bp_mode_road.id)
   bp_vehicle_4 = BpVehicle.create(:name => 'Lorry 3.5-7.5 t', :bp_mode_id => bp_mode_road.id)
   bp_vehicle_5 = BpVehicle.create(:name => 'Lorry 7.5-16 t', :bp_mode_id => bp_mode_road.id)
   bp_vehicle_6 = BpVehicle.create(:name => 'Lorry 16-32 t', :bp_mode_id => bp_mode_road.id)
   bp_vehicle_7 = BpVehicle.create(:name => 'Lorry > 32 t', :bp_mode_id => bp_mode_road.id)
   bp_vehicle_8 = BpVehicle.create(:name => 'Transoceanic freight', :bp_mode_id => bp_mode_ship.id)
   bp_vehicle_9 = BpVehicle.create(:name => 'Rail freight', :bp_mode_id => bp_mode_train.id)
end

if BpDistributionDefaultValue.all.size == 0
   BpDistributionDefaultValue.delete_all
   bp_distribution_default_value_amount_product_packaged = BpDistributionDefaultValue.create(:name => 'Amount of product packaged', :unit => 'kg', :value => '0')
   bp_distribution_default_value_corrugated_board_box = BpDistributionDefaultValue.create(:name => 'Corrugated board box', :unit => 'kg', :value => '0')
   bp_distribution_default_value_stretch_film_pe = BpDistributionDefaultValue.create(:name => 'Stretch film PE', :unit => 'kg', :value => '0')
   bp_distribution_default_value_wooden_pallet = BpDistributionDefaultValue.create(:name => 'Wooden pallet', :unit => 'kg', :value => '0')
   bp_distribution_default_value_PET_strapping = BpDistributionDefaultValue.create(:name => 'PET strapping', :unit => 'kg', :value => '0')
   bp_distribution_default_value_PP_strapping = BpDistributionDefaultValue.create(:name => 'PP strapping', :unit => 'kg', :value => '0')
   bp_distribution_default_value_cushioning_eps = BpDistributionDefaultValue.create(:name => 'Cushioning EPS', :unit => 'kg', :value => '0')
   bp_distribution_default_value_pe_bag = BpDistributionDefaultValue.create(:name => 'PE bag', :unit => 'kg', :value => '0')   
   bp_distribution_default_value_pvc_blister = BpDistributionDefaultValue.create(:name => 'PVC blister', :unit => 'kg', :value => '0')
   bp_distribution_default_value_pvc_blister = BpDistributionDefaultValue.create(:name => 'Shrink PE film', :unit => 'kg', :value => '0')   
end 

if BpMaterial.all.size == 0 and BpManufacturingProcess.all.size == 0 and BpManufacturingProcessVariable.all.size == 0
#if 1 == -1
   BpMaterial.delete_all
   BpMaterialTranslation.delete_all
   BpManufacturingProcess.delete_all
   BpManufacturingProcessTranslation.delete_all
   BpManufacturingProcessVariable.delete_all
 #  BpManufacturingProcessVariableTranslation.delete_all

   #bp_material
   bp_material_polylactic_acid_corn_based = BpMaterial.create(:name => 'Polylactic acid, corn-based', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :name => 'Polylactic acid, corn-based', :locale => 'en')

   bp_material_polylactic_acid_sugarcane_based = BpMaterial.create(:name => 'Polylactic acid, sugarcane-based', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :name => 'Polylactic acid, sugarcane-based', :locale => 'en')

   bp_material_starch_blend_type_1 = BpMaterial.create(:name => 'TPS blend type I (for film applications)', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_starch_blend_type_1.id, :name => 'TPS blend type I (for film applications)', :locale => 'en')

   bp_material_starch_blend_type_2 = BpMaterial.create(:name => 'TPS blend type II (for film applications)', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_starch_blend_type_2.id, :name => 'TPS blend type II (for film applications)', :locale => 'en')

   bp_material_potato_based_fermented_starch_plastic = BpMaterial.create(:name => 'Potato starch-based plastic', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :name => 'Potato starch-based plastic', :locale => 'en')

   #bp_material_sugarcane_based_PE = BpMaterial.create(:name => 'Sugarcane-based PE')
   bp_material_sugarcane_based_HDPE = BpMaterial.create(:name => 'Sugarcane-based HDPE', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :name => 'Sugarcane-based HDPE', :locale => 'en')

   bp_material_sugarcane_based_LDPE = BpMaterial.create(:name => 'Sugarcane-based LDPE', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :name => 'Sugarcane-based LDPE', :locale => 'en')

   bp_material_PHB = BpMaterial.create(:name => 'PHB', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :name => 'PHB', :locale => 'en')

   bp_material_partially_sugarcane_based_PET = BpMaterial.create(:name => 'Partially bio-based PET', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :name => 'Partially bio-based PET', :locale => 'en')

   bp_material_PBS = BpMaterial.create(:name => 'Partially bio-based PBS', :based_type => 'bio')
   BpMaterialTranslation.create(:bp_material_id => bp_material_PBS.id, :name => 'Partially bio-based PBS', :locale => 'en')

   bp_material_PP = BpMaterial.create(:name => 'PP', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_PP.id, :name => 'PP', :locale => 'en')

   bp_material_LDPE = BpMaterial.create(:name => 'LDPE', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_LDPE.id, :name => 'LDPE', :locale => 'en')

   bp_material_HDPE = BpMaterial.create(:name => 'HDPE', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_HDPE.id, :name => 'HDPE', :locale => 'en')

   bp_material_HDPE_recycled = BpMaterial.create(:name => 'HDPE recycled', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_HDPE_recycled.id, :name => 'HDPE recycled', :locale => 'en')

   bp_material_LLDPE = BpMaterial.create(:name => 'LLDPE', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_LLDPE.id, :name => 'LLDPE', :locale => 'en')

   bp_material_rigid_PVC = BpMaterial.create(:name => 'Rigid PVC', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_rigid_PVC.id, :name => 'Rigid PVC', :locale => 'en')

   bp_material_flexible_PVC = BpMaterial.create(:name => 'Flexible PVC', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_flexible_PVC.id, :name => 'Flexible PVC', :locale => 'en')

   bp_material_PET = BpMaterial.create(:name => 'PET', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_PET.id, :name => 'PET', :locale => 'en')

   bp_material_PET_recycled = BpMaterial.create(:name => 'PET recycled', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_PET_recycled.id, :name => 'PET recycled', :locale => 'en')

   bp_material_HIPS = BpMaterial.create(:name => 'HIPS', :based_type => 'oil')
   BpMaterialTranslation.create(:bp_material_id => bp_material_HIPS.id, :name => 'HIPS', :locale => 'en')

   #bp_manufacturing_process
   bp_manufacturing_process_drying_of_pellets = BpManufacturingProcess.create(:name => 'Drying of pellets', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :name => 'Drying of pellets', :locale => 'en')

   bp_manufacturing_process_cast_sheet_film_extrusion = BpManufacturingProcess.create(:name => 'Cast sheet/film extrusion', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :name => 'Cast sheet/film extrusion', :locale => 'en')

   bp_manufacturing_process_pipe_profile_extrusion = BpManufacturingProcess.create(:name => 'Pipe/profile extrusion', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :name => 'Pipe/profile extrusion', :locale => 'en')

   bp_manufacturing_process_film_blowing = BpManufacturingProcess.create(:name => 'Film blowing', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :name => 'Film blowing', :locale => 'en')

   bp_manufacturing_process_injection_strecht_blow_moulding = BpManufacturingProcess.create(:name => 'Injection stretch blow moulding', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :name => 'Injection stretch blow moulding', :locale => 'en')

   bp_manufacturing_process_extrusion_blow_moulding = BpManufacturingProcess.create(:name => 'Extrusion blow moulding', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :name => 'Extrusion blow moulding', :locale => 'en')

   bp_manufacturing_process_thermoforming = BpManufacturingProcess.create(:name => 'Thermoforming', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :name => 'Thermoforming', :locale => 'en')

   bp_manufacturing_process_injection_moulding = BpManufacturingProcess.create(:name => 'Injection moulding', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :name => 'Injection moulding', :locale => 'en')

   bp_manufacturing_process_compounding = BpManufacturingProcess.create(:name => 'Compounding', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :name => 'Compounding', :locale => 'en')

   bp_manufacturing_process_laminating = BpManufacturingProcess.create(:name => 'Laminating', :process_type => 'finishing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :name => 'Laminating', :locale => 'en')

   bp_manufacturing_process_printing = BpManufacturingProcess.create(:name => 'Printing', :process_type => 'finishing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :name => 'Printing', :locale => 'en')

   bp_manufacturing_process_forming = BpManufacturingProcess.create(:name => 'Forming', :process_type => 'finishing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :name => 'Forming', :locale => 'en')

   bp_manufacturing_process_injection_moulding_performs = BpManufacturingProcess.create(:name => 'Injection moulding of preforms', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :name => 'Injection moulding of preforms', :locale => 'en')

   bp_manufacturing_process_strech_performs = BpManufacturingProcess.create(:name => 'Strech blown of preforms', :process_type => 'processing')
   BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :name => 'Strech blown of preforms', :locale => 'en')




   #bp_manufacturing_process_variable
   bp_manufacturing_process_variable_drying_temp = BpManufacturingProcessVariable.create(:name => 'Drying temp', :unit => '&deg;C')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :name => 'Drying temp', :locale => 'en')

   bp_manufacturing_process_variable_drying_time = BpManufacturingProcessVariable.create(:name => 'Drying time', :unit => 'h')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :name => 'Drying time', :locale => 'en')

   bp_manufacturing_process_variable_not_default_data = BpManufacturingProcessVariable.create(:name => 'Electricity consumption', :unit => 'kWh/kg')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :name => 'Electricity consumption', :locale => 'en')

   bp_manufacturing_process_variable_electricity_use = BpManufacturingProcessVariable.create(:name => 'Electricity use', :unit => 'kWh/kg')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :name => 'Electricity use', :locale => 'en')

#   bp_manufacturing_process_variable_lubricating_oil = BpManufacturingProcessVariable.create(:name => 'Lubricating oil', :unit => 'kg/kg:')
   bp_manufacturing_process_variable_lubricating_oil = BpManufacturingProcessVariable.create(:name => 'Lubricating oil', :unit => 'L/kg')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :name => 'Lubricating oil', :locale => 'en')

   bp_manufacturing_process_variable_water_cooling = BpManufacturingProcessVariable.create(:name => 'Water cooling', :unit => 'm<sup>3</sup>/kg')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :name => 'Water cooling', :locale => 'en')

#   bp_manufacturing_process_variable_production_scrap = BpManufacturingProcessVariable.create(:name => 'Production scraps', :unit => '%')
   bp_manufacturing_process_variable_production_scrap = BpManufacturingProcessVariable.create(:name => 'Production waste', :unit => '%')
#   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :name => 'Production scraps', :locale => 'en')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :name => 'Production waste', :locale => 'en')

   bp_manufacturing_process_variable_glue = BpManufacturingProcessVariable.create(:name => 'Amount of glue/binder/adhesive', :unit => 'kg/m<sup>2</sup>')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :name => 'Amount of glue/binder/adhesive', :locale => 'en')

   bp_manufacturing_process_variable_ink = BpManufacturingProcessVariable.create(:name => 'Amount of ink', :unit => 'kg/m<sup>2</sup>')
   BpManufacturingProcessVariableTranslation.create(:bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :name => 'Amount of ink', :locale => 'en')




   #relation bp_materials & bp_manufacturing_processes
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_injection_strecht_blow_moulding
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_forming
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
   bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_strech_performs


   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_injection_strecht_blow_moulding
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_forming
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
   bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_strech_performs


   bp_material_starch_blend_type_1.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_starch_blend_type_1.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_starch_blend_type_1.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_starch_blend_type_1.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_starch_blend_type_1.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_starch_blend_type_1.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_starch_blend_type_2.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_starch_blend_type_2.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_starch_blend_type_2.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_starch_blend_type_2.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_starch_blend_type_2.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_starch_blend_type_2.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_potato_based_fermented_starch_plastic.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_sugarcane_based_HDPE.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_sugarcane_based_LDPE.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_PHB.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_PHB.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_PHB.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_PHB.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_PHB.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_PHB.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_PHB.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_PHB.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_injection_strecht_blow_moulding
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_forming
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
   bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_strech_performs



   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_PBS.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_injection_strecht_blow_moulding
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_LDPE.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_LDPE.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_LDPE.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_LDPE.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_LDPE.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_LDPE.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_LDPE.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_LDPE.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_HDPE.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_LLDPE.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_rigid_PVC.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_rigid_PVC.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
   bp_material_rigid_PVC.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_rigid_PVC.bp_manufacturing_processes << bp_manufacturing_process_compounding
   bp_material_rigid_PVC.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_rigid_PVC.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_rigid_PVC.bp_manufacturing_processes << bp_manufacturing_process_forming

   bp_material_flexible_PVC.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_flexible_PVC.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_flexible_PVC.bp_manufacturing_processes << bp_manufacturing_process_compounding
   bp_material_flexible_PVC.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_flexible_PVC.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_flexible_PVC.bp_manufacturing_processes << bp_manufacturing_process_forming


   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_injection_strecht_blow_moulding
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_forming


   bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
   bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
   bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_laminating
   bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_printing
   bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_forming

  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_injection_strecht_blow_moulding
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_laminating
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_printing
  bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_forming

  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_laminating
  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_printing
  bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_forming




   #relacio process variables
   bp_manufacturing_process_drying_of_pellets.bp_manufacturing_process_variables << bp_manufacturing_process_variable_drying_temp
   bp_manufacturing_process_drying_of_pellets.bp_manufacturing_process_variables << bp_manufacturing_process_variable_drying_time
   bp_manufacturing_process_drying_of_pellets.bp_manufacturing_process_variables << bp_manufacturing_process_variable_not_default_data

   bp_manufacturing_process_cast_sheet_film_extrusion.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_cast_sheet_film_extrusion.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   bp_manufacturing_process_cast_sheet_film_extrusion.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
   bp_manufacturing_process_cast_sheet_film_extrusion.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

   bp_manufacturing_process_pipe_profile_extrusion.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_pipe_profile_extrusion.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   bp_manufacturing_process_pipe_profile_extrusion.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
   bp_manufacturing_process_pipe_profile_extrusion.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

   bp_manufacturing_process_film_blowing.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_film_blowing.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   bp_manufacturing_process_film_blowing.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
   bp_manufacturing_process_film_blowing.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

   bp_manufacturing_process_injection_strecht_blow_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_injection_strecht_blow_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   bp_manufacturing_process_injection_strecht_blow_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
   bp_manufacturing_process_injection_strecht_blow_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

   bp_manufacturing_process_extrusion_blow_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_extrusion_blow_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   bp_manufacturing_process_extrusion_blow_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
   bp_manufacturing_process_extrusion_blow_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

   bp_manufacturing_process_thermoforming.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_thermoforming.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   bp_manufacturing_process_thermoforming.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
   bp_manufacturing_process_thermoforming.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

   bp_manufacturing_process_injection_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_injection_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   bp_manufacturing_process_injection_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
   bp_manufacturing_process_injection_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

   bp_manufacturing_process_compounding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_compounding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   bp_manufacturing_process_compounding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling

   bp_manufacturing_process_laminating.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_laminating.bp_manufacturing_process_variables << bp_manufacturing_process_variable_glue
   bp_manufacturing_process_laminating.bp_manufacturing_process_variables << bp_manufacturing_process_variable_ink

   bp_manufacturing_process_printing.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_printing.bp_manufacturing_process_variables << bp_manufacturing_process_variable_glue
   bp_manufacturing_process_printing.bp_manufacturing_process_variables << bp_manufacturing_process_variable_ink

   bp_manufacturing_process_forming.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   bp_manufacturing_process_forming.bp_manufacturing_process_variables << bp_manufacturing_process_variable_glue
   bp_manufacturing_process_forming.bp_manufacturing_process_variables << bp_manufacturing_process_variable_ink

  bp_manufacturing_process_injection_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
  bp_manufacturing_process_injection_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
  bp_manufacturing_process_injection_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
  bp_manufacturing_process_injection_moulding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

  bp_manufacturing_process_strech.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
  bp_manufacturing_process_strech.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
  bp_manufacturing_process_strech.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
  bp_manufacturing_process_strech.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap



   #material - process - default values
   ##
   #Polylactic acid, corn-based (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0.0601)
   #Polylactic acid, corn-based (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #Polylactic acid, corn-based (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Polylactic acid, corn-based (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Polylactic acid, corn-based (Injection blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 2.55)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00222)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.11)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.8)
   #Polylactic acid, corn-based (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Polylactic acid, corn-based (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Polylactic acid, corn-based (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #Polylactic acid, corn-based (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Polylactic acid, corn-based (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Polylactic acid, corn-based (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


   ##
   #Polylactic acid, sugarcane-based (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0.0601)
   #Polylactic acid, sugarcane-based (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #Polylactic acid, sugarcane-based (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Polylactic acid, sugarcane-based (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Polylactic acid, sugarcane-based (Injection blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 2.55)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00222)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.11)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.8)
   #Polylactic acid, sugarcane-based (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Polylactic acid, sugarcane-based (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Polylactic acid, sugarcane-based (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #Polylactic acid, sugarcane-based (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Polylactic acid, sugarcane-based (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Polylactic acid, sugarcane-based (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


   ##Ara es TPS blend type I
   #Starch blend type I (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0)
   #Starch blend type I (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #Starch blend type I (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Starch blend type I (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Starch blend type I (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Starch blend type I (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)



   ##Ara es TPS blend Type II
   #Starch blend type II (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0)
   #Starch blend type II (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #Starch blend type II (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Starch blend type II (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Starch blend type II (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Starch blend type II (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)



   ##
   #Potato-based fermented starch plastic (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0)
   #Potato-based fermented starch plastic (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #Potato-based fermented starch plastic (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Potato-based fermented starch plastic (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Potato-based fermented starch plastic (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Potato-based fermented starch plastic (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #Potato-based fermented starch plastic (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Potato-based fermented starch plastic (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Potato-based fermented starch plastic (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)

   ##
   #Sugarcane-based HDPE (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437 )
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #Sugarcane-based HDPE (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.548)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000689)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 100)
   #Sugarcane-based HDPE (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Sugarcane-based HDPE (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.7)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Sugarcane-based HDPE (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Sugarcane-based HDPE (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.99)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000000398)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 99.4)
   #Sugarcane-based HDPE (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Sugarcane-based HDPE (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Sugarcane-based HDPE (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)

   ##
   #Sugarcane-based LPDE (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #Sugarcane-based LPDE (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Sugarcane-based LPDE (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Sugarcane-based LPDE (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Sugarcane-based LPDE (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Sugarcane-based LPDE (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #Sugarcane-based LPDE (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Sugarcane-based LPDE (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Sugarcane-based LPDE (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


   ##
   #PHB (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #PHB (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #PHB (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #PHB (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #PHB (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0.240)
   #PHB (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #PHB (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #PHB (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)



   ## Ara es diu Partially bio-based PET
   #Partially sugarcane-based PET (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0.278)
   #Partially sugarcane-based PET (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #Partially sugarcane-based PET (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Partially sugarcane-based PET (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Partially sugarcane-based PET (Injection blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.5)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00222)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.11)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 100)
   #Partially sugarcane-based PET (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Partially sugarcane-based PET (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #Partially sugarcane-based PET (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Partially sugarcane-based PET (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Partially sugarcane-based PET (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


   ##Partially bio-based PBS
   #PBS (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0)
   #PBS (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #PBS (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #PBS (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #PBS (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #PBS (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #PBS (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #PBS (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #PBS (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #PBS (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


   ##
   #PP (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.31)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000338)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.221)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #PP (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.699)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00613)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000898)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #PP (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.699)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000898)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #PP (Injection blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 2.55)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00222)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.11)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.8)
   #PP (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #PP (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #PP (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.798)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000225)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.9)
   #PP (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #PP (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #PP (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)

   ##
   #LDPE (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.516)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000112)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #LDPE (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #LDPE (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #LDPE (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #LDPE (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #LDPE (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #LDPE (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #LDPE (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


   ##
   #HDPE (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000178)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437 )
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #HDPE (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.548)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000689)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 100)
   #HDPE (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #HDPE (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #HDPE (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #HDPE (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.99)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000000398)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.4)
   #HDPE (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #HDPE (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #HDPE (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


   ##
   #LLPDE (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000112)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #LLPDE (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #LLPDE (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #LLPDE (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #LLPDE (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #LLPDE (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #LLPDE (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #LLPDE (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #LLPDE (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


   ##
   #Rigid PVC compound (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.526)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00424)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000810)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Rigid PVC compound (Extrusion blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #Rigid PVC compound (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.19)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000522)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.0)
   #Rigid PVC compounding
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.527)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   #Rigid PVC compound (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Rigid PVC compound (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Rigid PVC compound (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)

   ##
   #Flexible PVC compound(Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.455)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000178)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 96.5)
   #Flexible PVC compound (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.526)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000810)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #Flexible PVC compounding
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.527)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   #Flexible PVC compound (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Flexible PVC compound (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #Flexible PVC compound (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)

  ##
   #PET (Drying of palets)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0.278)
   #PET (Cast film/sheet extrusion)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
   #PET (Extrusion pipe, profile)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #PET (Film blowing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
   #PET (Injection blow moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.5)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00222)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.11)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 100)
   #PET (Thermoforming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
   #PET (Injection moulding)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
   #PET (Forming)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #PET (Laminating)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   #PET (Printing)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


  ##
  #HIPS (Cast film/sheet extrusion)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
  #HIPS (Thermoforming)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
  #HIPS (Forming)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
  #HIPS (Laminating)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
  #HIPS (Printing)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
  BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)



end




if BpUnit.all.size == 0
   bp_unit_kg = BpUnit.create(:name => 'kg')
   #unit_kg_trans = UnitTranslation.create(:unit_id => unit_kg.id, :name => 'Kg', :locale => 'en')
end  

if BpEndOfLifeDefaultScenario.all.size == 0 
   #BpEndOfLifeDefaultScenario.delete_all
   bp_end_of_life_default_scenario_1 = BpEndOfLifeDefaultScenario.create(:name => 'Predefined scenario 1 (waste treatment 100% to composting)', :landfill => '0', :incineration => '0', :composting => '100', :recycling => '0', :custom_scenario => false, :section => 1 )
   bp_end_of_life_default_scenario_2 = BpEndOfLifeDefaultScenario.create(:name => 'Predefined scenario 2 (waste treatment shared between 43.5% of incineration and 56.5% of landfill)', :landfill => '56.5', :incineration => '43.5', :composting => '0', :recycling => '0', :custom_scenario => false, :section =>1)
   bp_end_of_life_default_scenario_3 = BpEndOfLifeDefaultScenario.create(:name => 'Predefined scenario 3 (waste treatment shared between 30.7% of incineration, 20% composting and 49.3% of landfill)', :landfill => '49.3', :incineration => '30.7', :composting => '20', :recycling => '0', :custom_scenario => false, :section => 1)
   
   bp_end_of_life_default_scenario_4 = BpEndOfLifeDefaultScenario.create(:name => 'Predefined scenario 4 (waste treatment 33.3% of recycling, 29% of incineration, 37.7% of landfill)', :landfill => '37.7', :incineration => '29', :composting => '0', :recycling => '33.3', :custom_scenario => false, :section => 2)
   bp_end_of_life_default_scenario_5 = BpEndOfLifeDefaultScenario.create(:name => 'Predefined scenario 5 (waste treatment 29.4% of recycling, 27.1% of incineration, 43.5% of landfill)', :landfill => '43.5', :incineration => '27.1', :composting => '0', :recycling => '29.4', :custom_scenario => false, :section => 2)
   bp_end_of_life_default_scenario_6 = BpEndOfLifeDefaultScenario.create(:name => 'Predefined scenario 6 (waste treatment 25.1% of recycling, 34.1% of incineration, 40.9% of landfill)', :landfill => '40.9', :incineration => '34.1', :composting => '0', :recycling => '25.1', :custom_scenario => false, :section => 2)
   
   bp_end_of_life_default_scenario_customized = BpEndOfLifeDefaultScenario.create(:name => 'If required, add your customized scenario:', :landfill => '0', :incineration => '0', :composting => '0', :recycling => '0',:custom_scenario => true, :section => 9999)
end

if BpCompoundFamily.all.size == 0 && BpCompoundMaterial.all.size == 0

   bp_compound_family_pigments = BpCompoundFamily.create(:name => 'Pigments')
   bp_compound_family_fillers = BpCompoundFamily.create(:name => 'Fillers')
   bp_compound_family_stabilizers = BpCompoundFamily.create(:name => 'Stabilizers')
   bp_compound_family_plasticizers = BpCompoundFamily.create(:name => 'Plasticizers')
   bp_compound_family_lubricants = BpCompoundFamily.create(:name => 'Lubricants')
   bp_compound_family_impact_modifiers = BpCompoundFamily.create(:name => 'Impact modifiers')
   bp_compound_family_other_additives = BpCompoundFamily.create(:name => 'Other additives')
   bp_compound_family_master_batch = BpCompoundFamily.create(:name => 'Master-batch')

   #pigments
   bp_compound_material_titanium_dioxide = BpCompoundMaterial.create(:name => 'Titanium dioxide', :bp_compound_family_id => bp_compound_family_pigments.id)
   bp_compound_material_carbon_black = BpCompoundMaterial.create(:name => 'Carbon black', :bp_compound_family_id => bp_compound_family_pigments.id)
   bp_compound_material_organic_pigments = BpCompoundMaterial.create(:name => 'Organic pigments', :bp_compound_family_id => bp_compound_family_pigments.id)
   bp_compound_material_inorganic_pigments = BpCompoundMaterial.create(:name => 'Inorganic pigments', :bp_compound_family_id => bp_compound_family_pigments.id)

   #fillers
   bp_compound_material_calcium_carbonate = BpCompoundMaterial.create(:name => 'Calcium carbonate', :bp_compound_family_id => bp_compound_family_fillers.id)
   bp_compound_material_talc = BpCompoundMaterial.create(:name => 'Talc', :bp_compound_family_id => bp_compound_family_fillers.id)
   bp_compound_material_organic_fillers = BpCompoundMaterial.create(:name => 'Organic fillers', :bp_compound_family_id => bp_compound_family_fillers.id)
   bp_compound_material_inorganic_fillers = BpCompoundMaterial.create(:name => 'Inorganic fillers', :bp_compound_family_id => bp_compound_family_fillers.id)

   #stabilizers   
   bp_compound_material_ca_zn_stabilizers = BpCompoundMaterial.create(:name => 'Ca/Zn stabilizers', :bp_compound_family_id => bp_compound_family_stabilizers.id)
   bp_compound_material_tin_stabilizers = BpCompoundMaterial.create(:name => 'Tin stabilizers', :bp_compound_family_id => bp_compound_family_stabilizers.id)
   bp_compound_material_epoxidised_soybean_oil = BpCompoundMaterial.create(:name => 'Epoxidised soybean oil', :bp_compound_family_id => bp_compound_family_stabilizers.id)
   bp_compound_material_organic_stabilizers = BpCompoundMaterial.create(:name => 'Organic stabilizers', :bp_compound_family_id => bp_compound_family_stabilizers.id)
   bp_compound_material_inorganic_stabilizers = BpCompoundMaterial.create(:name => 'Inorganic stabilizers', :bp_compound_family_id => bp_compound_family_stabilizers.id)

   #plasticizers
   bp_compound_material_phthalate_esters = BpCompoundMaterial.create(:name => 'Phthalate esters (DEHP/DIDP/DINP)', :bp_compound_family_id => bp_compound_family_plasticizers.id)
   bp_compound_material_other_plasticizers = BpCompoundMaterial.create(:name => 'Other plasticizers', :bp_compound_family_id => bp_compound_family_plasticizers.id)

   #lubricants
   bp_compound_material_paraffin_wax = BpCompoundMaterial.create(:name => 'Paraffin wax', :bp_compound_family_id => bp_compound_family_lubricants.id)
   bp_compound_material_fatty_acid_ester = BpCompoundMaterial.create(:name => 'Fatty acid ester', :bp_compound_family_id => bp_compound_family_lubricants.id)
   bp_compound_material_other_lubricant = BpCompoundMaterial.create(:name => 'Other lubricant', :bp_compound_family_id => bp_compound_family_lubricants.id)

   #impact modifiers
   bp_compound_material_ABS = BpCompoundMaterial.create(:name => 'ABS', :bp_compound_family_id => bp_compound_family_impact_modifiers.id) 
   bp_compound_material_EVA = BpCompoundMaterial.create(:name => 'EVA', :bp_compound_family_id => bp_compound_family_impact_modifiers.id) 
   bp_compound_material_mathyl_methacrylate = BpCompoundMaterial.create(:name => 'MBS', :bp_compound_family_id => bp_compound_family_impact_modifiers.id) 
   bp_compound_material_PE = BpCompoundMaterial.create(:name => 'Chlorinated PE', :bp_compound_family_id => bp_compound_family_impact_modifiers.id) 
   bp_compound_material_other_impact_modifier = BpCompoundMaterial.create(:name => 'Other impact modifier', :bp_compound_family_id => bp_compound_family_impact_modifiers.id) 

   #other additives
   bp_compound_material_organic_additives = BpCompoundMaterial.create(:name => 'Organic additives', :bp_compound_family_id => bp_compound_family_other_additives.id) 
   bp_compound_material_inorganic_additives = BpCompoundMaterial.create(:name => 'Inorganic additives', :bp_compound_family_id => bp_compound_family_other_additives.id) 

   #master-batch
   bp_compound_material_polylactic_acid_corn_based = BpCompoundMaterial.create(:name => 'Polylactic acid, corn-based', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_polylactic_acid_sugarcane_based = BpCompoundMaterial.create(:name => 'Polylactic acid, sugarcane-based', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_starch_blend_type_1 = BpCompoundMaterial.create(:name => 'Starch blend type I', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_starch_blend_type_2 = BpCompoundMaterial.create(:name => 'Starch blend type II', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_potato_based_fermented_starch_plastic = BpCompoundMaterial.create(:name => 'Potato-based fermented starch plastic', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_sugarcane_based_HDPE  = BpCompoundMaterial.create(:name => 'Sugarcane-based HDPE', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_sugarcane_based_LDPE  = BpCompoundMaterial.create(:name => 'Sugarcane-based LDPE', :bp_compound_family_id => bp_compound_family_master_batch.id)
   bp_compound_material_PBS  = BpCompoundMaterial.create(:name => 'PBS', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_bio_basedPBS  = BpCompoundMaterial.create(:name => 'Bio-basedPBS', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_partially_sugarcane_based_PET  = BpCompoundMaterial.create(:name => 'Partially sugarcane-based PET', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_PP  = BpCompoundMaterial.create(:name => 'PP', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_LDPE  = BpCompoundMaterial.create(:name => 'LDPE', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_HDPE  = BpCompoundMaterial.create(:name => 'HDPE', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_LLDPE  = BpCompoundMaterial.create(:name => 'LLDPE', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_rigid_PVC_compound  = BpCompoundMaterial.create(:name => 'Rigid PVC compound', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_flexible_PVC_compound  = BpCompoundMaterial.create(:name => 'Flexible PVC compound', :bp_compound_family_id => bp_compound_family_master_batch.id) 
   bp_compound_material_PET  = BpCompoundMaterial.create(:name => 'PET', :bp_compound_family_id => bp_compound_family_master_batch.id) 

   BpCompoundMaterial.create(:name => 'Master-batch', :based_type => 'fake_economic')

end 

if BpCountryInfo.all.size == 0
   BpCountryInfo.create(:name => 'US') 
   BpCountryInfo.create(:name => 'Europe')
   BpCountryInfo.create(:name => 'Slovakia') 
   BpCountryInfo.create(:name => 'Slovenia')   
   BpCountryInfo.create(:name => 'Sweden') 
   BpCountryInfo.create(:name => 'Romania')   
   BpCountryInfo.create(:name => 'Portugal') 
   BpCountryInfo.create(:name => 'Poland')   
   BpCountryInfo.create(:name => 'Norway') 
   BpCountryInfo.create(:name => 'Netherlands')   
   BpCountryInfo.create(:name => 'Malta') 
   BpCountryInfo.create(:name => 'Latvia')   
   BpCountryInfo.create(:name => 'Luxembourg') 
   BpCountryInfo.create(:name => 'Lithuania')   
   BpCountryInfo.create(:name => 'Italia') 
   BpCountryInfo.create(:name => 'Ireland')   
   BpCountryInfo.create(:name => 'Hungary') 
   BpCountryInfo.create(:name => 'Greece')   
   BpCountryInfo.create(:name => 'United Kingdom') 
   BpCountryInfo.create(:name => 'France')   
   BpCountryInfo.create(:name => 'Finland')   
   BpCountryInfo.create(:name => 'Spain')   
   BpCountryInfo.create(:name => 'Estonia')   
   BpCountryInfo.create(:name => 'Denmark')   
   BpCountryInfo.create(:name => 'Germany')   
   BpCountryInfo.create(:name => 'Czech Republic')   
   BpCountryInfo.create(:name => 'Cyprus')   
   BpCountryInfo.create(:name => 'China')   
   BpCountryInfo.create(:name => 'Switzerland')   
   BpCountryInfo.create(:name => 'Brazil')   
   BpCountryInfo.create(:name => 'Bulgaria')   
   BpCountryInfo.create(:name => 'Belgium')
   BpCountryInfo.create(:name => 'Austria')   
end


if Indicator.where("sector = 'bio-plastic'").count == 0
    Indicator.create(:name => 'Global Warming', :unit => 'kg CO<sub>2</sub> eq', :sector => 'bio-plastic')
    Indicator.create(:name => 'Water Footprint', :unit => 'm<sub>3</sub>', :sector => 'bio-plastic')
    Indicator.create(:name => 'Land Use', :unit => 'm<sub>2</sub>*year', :sector => 'bio-plastic')
    Indicator.create(:name => 'Cumulative Energy Demand (CED) - non-renewable', :unit => 'MJ', :sector => 'bio-plastic')
    Indicator.create(:name => 'Cumulative Energy Demand (CED) - renewable', :unit => 'MJ', :sector => 'bio-plastic')
    Indicator.create(:name => 'Eutrophication', :unit => 'kg PO<sub>4</sub> eq', :sector => 'bio-plastic')
    Indicator.create(:name => 'Acidification', :unit => 'kg SO<sub>2</sub> eq', :sector => 'bio-plastic')
    Indicator.create(:name => 'Photochemical Ozone Creation Potential', :unit => 'kg C<sub>2</sub>H<sub>4</sub> eq', :sector => 'bio-plastic')
    Indicator.create(:name => 'Respiratory Inorganics', :unit => 'PM 2.5 eq', :sector => 'bio-plastic')
end


#######################
#Smart textile section#
#######################
if Indicator.where("sector = 'textiles'").count == 0
  Indicator.create(:name => 'Eco-cost', :sector => 'textiles')
end

#if 1 == 1
if StFamily.count == 0  && StMaterial.count == 0
  StFamily.delete_all
  StMaterial.delete_all

  ## Smart textile families
  st_family_electronic_component = StFamily.create(:name => "Electronic components")
  st_family_battery = StFamily.create(:name => "Battery")
  st_family_metals_non_ferro = StFamily.create(:name => "Metals, non ferro")
  st_family_plastics_biopolymers = StFamily.create(:name => "Plastics, biopolymers")
  st_family_rubbers = StFamily.create(:name => "Plastics, rubbers")
  st_family_thermoplasts = StFamily.create(:name => "Plastics, thermoplasts")
  st_family_thermosets = StFamily.create(:name => "Plastics, thermosets")
  st_family_textiles = StFamily.create(:name => "Textiles")
  st_family_smart_textile_composite_materials = StFamily.create(:name => "Smart Textile composite materials")
  st_family_conductive_yarns = StFamily.create(:name => "Conductive yarns")
  st_family_fabric = StFamily.create(:name => "Conductive fabric")

  ## Smart textile materials
  StMaterial.create(:name => "Electric cord, 1000 W, 3x0.5mm2", :unit => "m", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Ribbon cable, 20-pin, with plugs", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Integrated circuit (logic type)", :unit => "kg", :st_family_id =>	st_family_electronic_component.id)
  StMaterial.create(:name => "Integrated circuit (memory type)", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Printed Circuit Board, populated (including logic ICs)", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Printed Wiring Board, populated SMD (few logic ICs)", :unit => "kg", :st_family_id =>	st_family_electronic_component.id)
  StMaterial.create(:name => "Printed Wiring Board, populated through-hole (without logic ICs)", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Solder leadfree", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Capacitor, electrolyte type", :unit => "kg", :st_family_id =>	st_family_electronic_component.id)
  StMaterial.create(:name => "Capacitor, SMD type, surface-mounting", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Capacitor, Tantalum-, through-hole mounting", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Diode, glass-, SMD type, surface mounting", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Light emitting diode, LED", :unit => "kg", :st_family_id =>	st_family_electronic_component.id)
  StMaterial.create(:name => "Inductor, low value multilayer chip type", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Inductor, miniature RF chip type, MRFI", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Potentiometer", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Resistor, metal film type, through-hole mounting", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Resistor, SMD type, surface mounting", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Switch, toggle type", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Transistor, SMD type, surface mounting", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Transistor, through-hole mounting", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Photovoltaic cell, multi-Si", :unit => "kg", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Power adapter (laptop type 300g)", :unit => "part", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "Power adapter (smart phone type 50g)", :unit => "part", :st_family_id => 	st_family_electronic_component.id)
  StMaterial.create(:name => "Battery Charger (AA cell type 50g)", :unit => "part", :st_family_id => st_family_electronic_component.id)
  StMaterial.create(:name => "AA cell battery (Alkaline)", :unit => "part", :st_family_id => st_family_battery.id)
  StMaterial.create(:name => "Nine-volt battery (Alkaline)", :unit => "part", :st_family_id => st_family_battery.id)
  StMaterial.create(:name => "Button cell battery LR9 (Alkaline, 1,5V, 4,5g)", :unit => "part", :st_family_id => st_family_battery.id)
  StMaterial.create(:name => "Button cell battery CR2032 (Lithium, 3V, 2.8g)", :unit => "part", :st_family_id => st_family_battery.id)
  StMaterial.create(:name => "Button cell Battery (Silver Oxide, 1,55V, 2,4g)", :unit => "part", :st_family_id => st_family_battery.id)
  StMaterial.create(:name => "Li-ion rechargable battery (AA size)", :unit => "part", :st_family_id => st_family_battery.id)
  StMaterial.create(:name => "Li-polymer rechargable battery (prismatic)", :unit => "kg", :st_family_id => st_family_battery.id)
  StMaterial.create(:name => "NiMH rechargable battery", :unit => "kg", :st_family_id => st_family_battery.id)
  StMaterial.create(:name => "Aluminium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Antimony", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Cadmium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Chromium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Cobalt", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Copper trade mix", :unit => "kg", :st_family_id => 	st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Ferrochromium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Gallium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Gold", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Indium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Lead", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Lithium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Magnesium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Manganese", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Molybdenum", :unit => "kg", :st_family_id => 	st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Nickel", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Palladium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Platinum", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Silicon", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Silver", :unit => "kg", :st_family_id => 	st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Stainless steel (GX5CrNi19)", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Tantalum", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Tellurium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Tin", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Titanium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Tungsten", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Vanadium", :unit => "kg", :st_family_id => st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Zinc", :unit => "kg", :st_family_id => 	st_family_metals_non_ferro.id)
  StMaterial.create(:name => "Cellulose polymers", :unit => "kg", :st_family_id => st_family_plastics_biopolymers.id)
  StMaterial.create(:name => "Viscose", :unit => "kg", :st_family_id => 	st_family_plastics_biopolymers.id	 )
  StMaterial.create(:name => "PHA, PHB (biodegradeble) Polyhydroxyalkanoates", :unit => "kg", :st_family_id => st_family_plastics_biopolymers.id)
  StMaterial.create(:name => "PLA (Polylactide) (starch based biodegradeble plastic)", :unit => "kg", :st_family_id => st_family_plastics_biopolymers.id)
  StMaterial.create(:name => "TPS (starch-based thermoplastics)", :unit => "kg", :st_family_id => st_family_plastics_biopolymers.id)
  StMaterial.create(:name => "BR and PIB (butadiene rubber and butyl rubber)", :unit => "kg", :st_family_id => st_family_rubbers.id)
  StMaterial.create(:name => "EVA (ethylene vinyl acetate)", :unit => "kg", :st_family_id => st_family_rubbers.id)
  StMaterial.create(:name => "Natural rubber", :unit => "kg", :st_family_id => st_family_rubbers.id)
  StMaterial.create(:name => "Polychloroprene (Neoprene, CR)", :unit => "kg", :st_family_id => st_family_rubbers.id)
  StMaterial.create(:name => "Polyisoprene rubber (IIR)", :unit => "kg", :st_family_id => st_family_rubbers.id)
  StMaterial.create(:name => "Silicone elastomers", :unit => "kg", :st_family_id => st_family_rubbers.id)
  StMaterial.create(:name => "Styrene butadiene rubber (SBR)", :unit => "kg", :st_family_id => st_family_rubbers.id)
  StMaterial.create(:name => "ABS (Acrylonitrile butadiene styrene)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "Moulded Recycled Plastic (generic)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PA (polyamides)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PC (Polycarbonate)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PE (HDPE)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PE (LDPE)", :unit => "kg", :st_family_id => 	st_family_thermoplasts.id)
  StMaterial.create(:name => "PET (Polyethylene terephthalate)", :unit => "kg", :st_family_id => 	st_family_thermoplasts.id)
  StMaterial.create(:name => "PMMA (Polymethyl methacrylate)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PEEK (Polyetheretherketone)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PTFE (Teflon) (Polytetrafluoroethylene)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "POM (Polyoxymethyleen, polyacetaal)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PP (Polypropylene)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PS (EPS) (Polystyrene)", :unit => "kg", :st_family_id => 	st_family_thermoplasts.id)
  StMaterial.create(:name => "PVC (Polyvinylchloride)", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "PVDC", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "SAN", :unit => "kg", :st_family_id => st_family_thermoplasts.id)
  StMaterial.create(:name => "Epoxy resin", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "MF (resin)", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "PF (resin)", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "Phenolics (Bakelite)", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "Polyester (unsat)", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "PUR flex. block foam", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "PUR flex. moulded MDI/TDI", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "PUR rigid integr. skin foam", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "PUR semi flexible foam", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "UF (resin)", :unit => "kg", :st_family_id => st_family_thermosets.id)
  StMaterial.create(:name => "Lycra, Spandex (polyurethane)", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Aramid fibre", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Carbon fibre", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Glass fibre", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Jute fibres from India", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Cotton fibre from China", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Cotton fibre from USA", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Kenaf fibre from India", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Nylon fibre", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Yarn, cotton", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Cotton woven fabric", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Polyester fabric", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Polyester nonwoven from recycled PET bottles", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Fleece, PE (polyethylene)", :unit => "kg", :st_family_id => st_family_textiles.id)
  StMaterial.create(:name => "Geotextiles (PP, 500 dTex, woven)", :unit => "kg", :st_family_id => st_family_textiles.id	)
  StMaterial.create(:name => "conductive yarn, (80% polyester, 20% silver plated)", :unit => "kg", :st_family_id => st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (80% polyamide 20% silver plated)", :unit => "kg", :st_family_id => 	st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (80% Cotton, 20% silver plated)", :unit => "kg", :st_family_id => 	st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (80% polyester, 20% copper/nickel plated)", :unit => "kg", :st_family_id => st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (80% polyamide 20% copper/nickel plated)", :unit => "kg", :st_family_id =>	st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (80% Cotton, 20% copper/nickel plated)", :unit => "kg", :st_family_id => st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (80% polyester 20% stainless steel)", :unit => "kg", :st_family_id => st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (80% Polyurethane, 20% stainless steel)", :unit => "kg", :st_family_id => st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (60% Polyurethane, 40% stainless steel)", :unit => "kg", :st_family_id => st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "conductive yarn, (70% Cotton, 30% stainless steel)", :unit => "kg", :st_family_id => st_family_smart_textile_composite_materials.id)
  StMaterial.create(:name => "Polyester yarn with carbon (Anti-Static)", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)    
  StMaterial.create(:name => "Bamboo Yarn with Silver", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
  StMaterial.create(:name => "Cotton yarn blended with Stainless steel", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
  StMaterial.create(:name => "Polyamide Nylon Yarn with Stainless steel thread", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
  StMaterial.create(:name => "Polyester yarn blended with Stainless steel", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
  StMaterial.create(:name => "Stainless Steel Fiber Sewing Thread", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)
  StMaterial.create(:name => "Cotton/polyester blended yarn with Stainless steel", :unit => "kg", :st_family_id => st_family_conductive_yarns.id)    

end

## Smart textile materials
if StEnergyType.count == 0 && StEnergySource.count == 0
  st_energy_type_electricity = StEnergyType.create(:name => "Electricity", :unit => "kWh")
  st_energy_type_charging_battery = StEnergyType.create(:name => "Charging Battery with power from grid", :unit => "part")
  st_energy_type_heat =  StEnergyType.create(:name => "Heat", :unit => "MJ")

  StEnergySource.create(:name => "Electricity 230V (UCTE)", :st_energy_type_id => st_energy_type_electricity.id)
  StEnergySource.create(:name => "Charging Li-Ion battery (AA cell, 3,6V)", :st_energy_type_id => st_energy_type_charging_battery.id)
  StEnergySource.create(:name => "Charging Li-polymer battery (cell-phone type)", :st_energy_type_id => st_energy_type_charging_battery.id)
  StEnergySource.create(:name => "Charging NiMH battery (AA cell, 1,2V)", :st_energy_type_id => st_energy_type_charging_battery.id)
  StEnergySource.create(:name => "Domestic Heat", :st_energy_type_id => st_energy_type_heat.id)
  StEnergySource.create(:name => "Industrial Heat", :st_energy_type_id => st_energy_type_heat.id)
end

if StFamilyProcess.count == 0  && StProcess.count == 0

  st_family_process_ferro_metals = StFamilyProcess.create(:name => "Processing, ferro metals")
  st_family_process_non_ferro_metals = StFamilyProcess.create(:name => "Processing, non-ferro metals")
  st_family_process_plastics = StFamilyProcess.create(:name => "Processing, plastics")
  st_family_process_textiles = StFamilyProcess.create(:name => "Processing, textiles")
  st_family_process_electronics = StFamilyProcess.create(:name => "Processing, electronics")

  StProcess.create(:name => "Electroplating Chrome", :unit => "m2", :st_family_process_id =>	st_family_process_ferro_metals.id)
  StProcess.create(:name => "Electroplating Nickel", :unit => "m2", :st_family_process_id => st_family_process_ferro_metals.id)
  StProcess.create(:name => "Anodising", :unit => "m2", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Cold transforming aluminium", :unit => "kg", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Laser Cutting aluminium", :unit => "m2", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Shears cutting aluminium", :unit => "m2", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Machining aluminium", :unit => "kg", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Rolling aluminium foil", :unit => "kg", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Rolling aluminium sheet", :unit => "kg", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Rolling brass", :unit => "kg", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Sawing band saw aluminium", :unit => "m2", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Sawing circular saw aluminium", :unit => "m2", :st_family_process_id =>	st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Scouring aluminium", :unit => "kg", :st_family_process_id => st_family_process_non_ferro_metals.id)
  StProcess.create(:name => "Blow moulding bottles", :unit => "kg", :st_family_process_id =>	st_family_process_plastics.id)
  StProcess.create(:name => "Blow moulding plastic film", :unit => "kg", :st_family_process_id => st_family_process_plastics.id)
  StProcess.create(:name => "Extrusion", :unit => "kg", :st_family_process_id =>	st_family_process_plastics.id)
  StProcess.create(:name => "Injection moulding", :unit => "kg", :st_family_process_id =>	st_family_process_plastics.id)
  StProcess.create(:name => "Recycling mixed polymer", :unit => "kg", :st_family_process_id =>	st_family_process_plastics.id)
  StProcess.create(:name => "Thermo forming", :unit => "kg", :st_family_process_id =>	st_family_process_plastics.id)
  StProcess.create(:name => "dyeing", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "heat setting and washing", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "knitting 200 dtex", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "pretreatment of cotton", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "Textile refinement, cotton", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "spinning cotton 45 dtex", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "spinning cotton 100 dtex", :unit => "kg", :st_family_process_id => st_family_process_textiles.id)
  StProcess.create(:name => "spinning cotton 200 dtex", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "spinning polymer filaments", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "spinning viscose fibres", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "Wire drawing, copper", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "Wire drawing, steel", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "texturing polymer fibres", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "weaving 15 dtex", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "weaving 100 dtex", :unit => "kg", :st_family_process_id =>	st_family_process_textiles.id)
  StProcess.create(:name => "weaving 200 dtex", :unit => "kg", :st_family_process_id => st_family_process_textiles.id)
  StProcess.create(:name => "Mounting, surface mount technology", :unit => "m2", :st_family_process_id =>	st_family_process_electronics.id)
  StProcess.create(:name => "Mounting, through-hole technology", :unit => "m2", :st_family_process_id =>	st_family_process_electronics.id)
  StProcess.create(:name => "Capacitors, production efforts", :unit => "kg", :st_family_process_id =>	st_family_process_electronics.id)
  StProcess.create(:name => "Diodes, production efforts", :unit => "kg", :st_family_process_id =>	st_family_process_electronics.id)
  StProcess.create(:name => "Inductor, production efforts", :unit => "kg", :st_family_process_id =>	st_family_process_electronics.id)
  StProcess.create(:name => "Resistors, production efforts", :unit => "kg", :st_family_process_id =>	st_family_process_electronics.id)
  StProcess.create(:name => "Transistors, troduction efforts", :unit => "kg", :st_family_process_id =>	st_family_process_electronics.id)

end

if StPackagingType.count == 0
  StPackagingType.create(:name => "Corrugated board", :unit => "kg")
  StPackagingType.create(:name => "Paper, woodfree coated", :unit => "kg")
  StPackagingType.create(:name => "PE foil", :unit => "kg")
  StPackagingType.create(:name => "Polyurethane, rigid foam", :unit => "kg")
end

if StFamilyTransport.count == 0 && StTransport.count == 0
  st_family_transport_air_fraight = StFamilyTransport.create(:name => "Air fraight")
  st_family_transport_cargorail = StFamilyTransport.create(:name => "Cargorail")
  st_family_transport_roadfraight = StFamilyTransport.create(:name => "Roadfraight")
  st_family_transport_shipping_water = StFamilyTransport.create(:name => "Shipping on water")

  StTransport.create(:name => "Air traffic continental", :unit => "Liter", :st_family_transport_id => st_family_transport_air_fraight.id)
  StTransport.create(:name => "Air traffic intercontinental", :unit => "Liter", :st_family_transport_id => st_family_transport_air_fraight.id)
  StTransport.create(:name => "Container ship", :unit => "Liter", :st_family_transport_id => st_family_transport_shipping_water.id)
  StTransport.create(:name => "Train freight", :unit => "Liter", :st_family_transport_id => st_family_transport_cargorail.id)
  StTransport.create(:name => "Truck 24tons net", :unit => "Liter", :st_family_transport_id => st_family_transport_roadfraight.id)
  StTransport.create(:name => "Truck 28tons net", :unit => "Liter", :st_family_transport_id => st_family_transport_roadfraight.id)
end

# MACHINE TOOLS
#if 1 == 1
if MtFamily.count == 0 && MtMaterial.count == 0
    MtFamily.delete_all
    MtMaterial.delete_all
    family_plastics = MtFamily.create(:name => 'Plastics')
    family_metals = MtFamily.create(:name => 'Metals')
    family_electronics = MtFamily.create(:name => 'Supplier parts - Electronics')
    family_other = MtFamily.create(:name => 'Other')      
    mt_family_supplier_parts = MtFamily.create(:name => 'Supplier parts - Others')
      
    MtMaterial.create(:mt_family_id => family_plastics.id, :name => 'Polypropylene (PP)', :unit => 'kg', :general => false, :recycling => -66.5, :incineration => 0.21, :landfill => 0.33)
    MtMaterial.create(:mt_family_id => family_plastics.id, :name => 'Polyvinylchloride (PVC)', :unit => 'kg', :general => false, :recycling => -44.1, :incineration => 12.30, :landfill => 0.33)
    MtMaterial.create(:mt_family_id => family_plastics.id, :name => 'Polycarbonate', :unit => 'kg', :general => false, :recycling => -60.2, :incineration => 0.71, :landfill => 0.33)
    MtMaterial.create(:mt_family_id => family_plastics.id, :name => 'Polyethylene pacakging film (PE foil)', :unit => 'kg', :general => false, :recycling => -67.7, :incineration => 0.23, :landfill => 0.33)
    MtMaterial.create(:mt_family_id => family_plastics.id, :name => 'Fibre Glass: Polyamide', :unit => 'kg', :general => false, :recycling => -60.2, :incineration => 0.71, :landfill => 0.33)
    MtMaterial.create(:mt_family_id => family_plastics.id, :name => 'Fibre Glass: Polyester resin', :unit => 'kg', :general => false, :recycling => -60.2, :incineration => 0.71, :landfill => 0.33)
    MtMaterial.create(:mt_family_id => family_plastics.id, :name => 'Fibre Glass: Unknown', :unit => 'kg', :general => true, :recycling => -60.2, :incineration => 0.71, :landfill => 0.33)
    MtMaterial.create(:mt_family_id => family_plastics.id, :name => 'Plastic: Unknown', :unit => 'kg', :general => true, :recycling => -60.2, :incineration => 0.71, :landfill => 0.33)
           
    MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Steel: Low alloyed', :unit => 'kg', :general => false, :recycling => 0.0, :incineration => 0.33, :landfill => 0.20)
    MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Steel: Chromium steel', :unit => 'kg', :general => false, :recycling => 0.0, :incineration => 0.33, :landfill => 0.20)
    MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Steel: Unknown', :unit => 'kg', :general => true, :recycling => -22.40, :incineration => 0.33, :landfill => 0.20)
  #  MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Steel_low-alloyed', :unit => 'kg', :general => false, :recycling => 0.0, :incineration => 0.33, :landfill => 0.20)
 #   MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Steel_chromium-steel', :unit => 'kg', :general => false, :recycling => 0.0, :incineration => 0.33, :landfill => 0.20)
   # MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Steel_mix', :unit => 'kg', :general => true, :recycling => 0.0, :incineration => 0.33, :landfill => 0.20)
    MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Iron: Cast Iron', :unit => 'kg', :general => true, :recycling => -22.40, :incineration => 0.33, :landfill => 0.20)
    MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Aluminium', :unit => 'kg', :general => true, :recycling => -170.00, :incineration => 0.72, :landfill => 0.55)
  #  MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Aluminium_mix', :unit => 'kg', :general => true, :recycling => 0.0, :incineration => 0.72, :landfill => 0.55)
    MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Copper', :unit => 'kg', :general => true, :recycling => -6.4, :incineration => 0.60, :landfill => 0.2)
   # MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Copper_mix', :unit => 'kg', :general => true, :recycling => 0.0, :incineration => 0.60, :landfill => 0.2)
    MtMaterial.create(:mt_family_id => family_metals.id, :name => 'Brass', :unit => 'kg', :general => true, :recycling => -6.4, :incineration => 0.602, :landfill => 0.198)              
              
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Electric Motor', :unit => 'kg', :recycling => -3.4, :incineration => 0.7, :landfill => 0.2)
    MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'Electronic control unit', :unit => 'kg', :recycling => -30.30, :incineration => 24.1, :landfill => 0.548)
    MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'Desktop PC (w/o screen)', :unit => 'p', :recycling => 0, :incineration => 0, :landfill => 0)
  #  MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'LCD screen', :unit => 'p', :recycling => -322.7, :incineration => 0.7, :landfill => 0.2)
   # MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'Keyboard', :unit => 'p', :recycling => -28.6, :incineration => 0.7, :landfill => 0.2)
   # MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'Optical mouse', :unit => 'p', :recycling => -5.8, :incineration => 0.7, :landfill => 0.2)
    #MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'Full PC set', :unit => 'p', :recycling => -663.3, :incineration => 0.7, :landfill => 0.2)
        
    MtMaterial.create(:mt_family_id => family_other.id, :name => 'Sand', :unit => 'kg', :general => false, :recycling => 0, :incineration => 0, :landfill => 0.20)
    MtMaterial.create(:mt_family_id => family_other.id, :name => 'Tempered Glass', :unit => 'kg', :general => false, :recycling => -1.33, :incineration => 0.501, :landfill => 0.198)    
    
    MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'Cable: 3 conductor cable', :unit => 'm', :general => false, :recycling => -1.771, :incineration => 0.41114, :landfill => 0.02364)
    MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'Transformer', :unit => 'kg', :general => false, :recycling => -30.3, :incineration => 0.7, :landfill => 0.2)    
    #MtMaterial.create(:mt_family_id => family_electronics.id, :name => 'Power supply', :unit => 'p', :general => false, :recycling => -35.7459314775161, :incineration => 0.08169164882227, :landfill => 0.023340471092077)
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Cooling and Lubrication unit', :unit => 'kg', :general => false, :recycling => -22.1, :incineration => 0.3, :landfill => 0.2)
    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Compressor', :unit => 'kg', :general => false, :recycling => -39.2, :incineration => 0.4, :landfill => 0.2)
    
    
    MtMaterial.create(:name => 'Wood transport crate', :unit => 'm<sup>3</sup>', :general => false, :recycling => -13.2, :incineration => 0.17, :landfill => 0.33)
end

if MtProductType.count == 0
    MtProductType.delete_all
    MtProductType.create(:name => 'Drilling machine')
    MtProductType.create(:name => 'Grinding Machine')
    MtProductType.create(:name => 'Milling machine')
    MtProductType.create(:name => 'Turning machine')
    MtProductType.create(:name => 'ECM Machine')
    MtProductType.create(:name => 'EDM machine')
    MtProductType.create(:name => 'Press machine')
    MtProductType.create(:name => 'Laser Machine')
    MtProductType.create(:name => 'Injection Moulding machine')
end    

if MtEnergyFamily.count == 0 && MtEnergyProcess.count == 0
    MtEnergyFamily.delete_all
    MtEnergyProcess.delete_all  
    family_electricity = MtEnergyFamily.create(:name => 'Electricity')
    family_other = MtEnergyFamily.create(:name => 'Other Energy')    
    
    
                                                 
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Austria', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Bosnia Herzegovina', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Belgium', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Bulgaria', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Brazil', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Switzerland', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Serbia & Montenegro', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Chech Republic', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Germany', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Denmark', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Spain', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Finland', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: France', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Great Britain', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Greece', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Croatia', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Hungary', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Ireland', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Italy', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Japan', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Luxembourg', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Macedonia', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Netherlands', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Norway', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Poland', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Portugal', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Romania', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Sweden', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Slovenia', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: Slovakia', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: China', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_electricity.id,:name => 'Electricity: United States', :unit => 'kWh')
    MtEnergyProcess.create(:mt_energy_family_id => family_other.id,:name => 'Compressed Air', :unit => 'm<sup>3</sup>')
    MtEnergyProcess.create(:mt_energy_family_id => family_other.id,:name => 'Heat_Natural gas', :unit => 'MJ')
    MtEnergyProcess.create(:mt_energy_family_id => family_other.id,:name => 'Heat_Light fuel oil', :unit => 'kg')    
end
 
if MtTransportType.count == 0 
    MtTransportType.create(:name => 'Transport_Lorry 3.5-20t')
    MtTransportType.create(:name => 'Transport_Rail')
    MtTransportType.create(:name => 'Transport_Ship')
    MtTransportType.create(:name => 'Transport_Air')
end
 
if MtConsumable.count == 0
    MtConsumable.create(:name => 'Oxygen_operating resource_liquid')
    MtConsumable.create(:name => 'Nitrogen_operating resource_liquid')
    MtConsumable.create(:name => 'Argon_operating resource_liquid')
    MtConsumable.create(:name => 'Carbon dioxide_operating resource_liquid')
    MtConsumable.create(:name => 'Ozone_operating resource_liquid') 
    MtConsumable.create(:name => 'Lubricating oil')    
end

if MtManufacturingProcess.count == 0
    MtManufacturingProcess.create(:name => 'Wire drawing', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Sheet rolling', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Drilling Al', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Drilling Steel', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Drilling Iron', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Milling Al', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Milling Steel', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Milling Iron', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Turning Al', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Turning Steel', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Turning Iron', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Aluminium working', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Steel working', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Iron working', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Welding Al', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Welding Steel', :unit => 'm')
    MtManufacturingProcess.create(:name => 'Welding Average', :unit => 'm')
 #   MtManufacturingProcess.create(:name => 'Average Materials', :unit => 'm')
    MtManufacturingProcess.create(:name => 'Drilling Brass', :unit => 'kg')
    MtManufacturingProcess.create(:name => 'Turning Brass', :unit => 'kg')    
    MtManufacturingProcess.create(:name => 'Brass working', :unit => 'kg')       
    MtManufacturingProcess.create(:name => 'Injection Moulding', :unit => 'kg')    
    
 
 
end

if MtSubsystem.count == 0
    MtSubsystem.create(:name => '24V supply', :processing => 2, :ready => 0, :standby => 0)
    MtSubsystem.create(:name => '230V supply', :processing => 20, :ready => 0, :standby => 0)
    MtSubsystem.create(:name => 'E/R module supply', :processing => 2, :ready => 0, :standby => 0)
    MtSubsystem.create(:name => 'Monitoring module', :processing => 3, :ready => 0, :standby => 0)
    MtSubsystem.create(:name => 'CNC total', :processing => 3, :ready => 0, :standby => 0)
    MtSubsystem.create(:name => 'Chip conveyor', :processing => 0, :ready => 12, :standby => 0)
    MtSubsystem.create(:name => 'Mist collector', :processing => 0, :ready => 4, :standby => 0)
    MtSubsystem.create(:name => 'Hydraulic system', :processing => 0, :ready => 0, :standby => 0.8)
    MtSubsystem.create(:name => 'Fluid system', :processing => 4.5, :ready => 0, :standby => 0)
    MtSubsystem.create(:name => 'Spindle cooling pump', :processing => 0, :ready => 0.8, :standby => 0)
    MtSubsystem.create(:name => 'Cooling fan', :processing => 0, :ready => 0, :standby => 0)
    MtSubsystem.create(:name => 'Fan E/R module', :processing => 0, :ready => 0, :standby => 1.1)
    MtSubsystem.create(:name => 'CNC air-conditioning', :processing => 0, :ready => 0, :standby => 0)
    MtSubsystem.create(:name => 'Air compressor', :processing => 0, :ready => 0.8, :standby => 0)
    MtSubsystem.create(:name => 'Lubrication pump', :processing => 0.5, :ready => 0.4, :standby => 0.1)
    MtSubsystem.create(:name => 'Other sub-system', :processing => 0, :ready => 0, :standby => 0)
end

###########
## PCB
###########

if PcCountryInfo.all.size == 0
    PcCountryInfo.create(:name => 'Austria')
    PcCountryInfo.create(:name => 'Belgium')
    PcCountryInfo.create(:name => 'Bulgaria')
    PcCountryInfo.create(:name => 'Cyprus')
    PcCountryInfo.create(:name => 'Czech Republic')
    PcCountryInfo.create(:name => 'Denmark')
    PcCountryInfo.create(:name => 'Estonia')
    PcCountryInfo.create(:name => 'Finland')
    PcCountryInfo.create(:name => 'France')
    PcCountryInfo.create(:name => 'Germany')
    PcCountryInfo.create(:name => 'Greece')
    PcCountryInfo.create(:name => 'Hungary')
    PcCountryInfo.create(:name => 'Irland')
    PcCountryInfo.create(:name => 'Italy')
    PcCountryInfo.create(:name => 'Latvia')
    PcCountryInfo.create(:name => 'Lithuania')
    PcCountryInfo.create(:name => 'Luxembourg')
    PcCountryInfo.create(:name => 'Malta')
    PcCountryInfo.create(:name => 'Netherlands')
    PcCountryInfo.create(:name => 'Poland')
    PcCountryInfo.create(:name => 'Portugal')
    PcCountryInfo.create(:name => 'Romania')
    PcCountryInfo.create(:name => 'Slovak Republic')
    PcCountryInfo.create(:name => 'Slovenia')
    PcCountryInfo.create(:name => 'Spain')
    PcCountryInfo.create(:name => 'Sweden')
    PcCountryInfo.create(:name => 'European Union - 27')
    PcCountryInfo.create(:name => 'China')
end

if PcCoatingType.all.size == 0
    PcCoatingType.create(:name => 'ENIG')
    PcCoatingType.create(:name => 'Ag')
    PcCoatingType.create(:name => 'Sn')
    PcCoatingType.create(:name => 'HASL')
end

if PcTransportType.all.size == 0
    PcTransportType.create(:name => 'Car')
    PcTransportType.create(:name => 'Rail')
    PcTransportType.create(:name => 'Air Domestic (to 1000 km)')
    PcTransportType.create(:name => 'Air Short-haul international (from 1001 to 5000 km)')
    PcTransportType.create(:name => 'Air Long-haul international (>5000 km)')
    PcTransportType.create(:name => 'Ship')
end

if Indicator.where("sector = 'printed'").count == 0
  indicator_1_pc = Indicator.create(:name => 'Water consumption', :unit => 'm<sup>3</sup>', :category => 'water', :subcategory => 'consumption', :sector => 'printed')
           
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Rigid', :family => '1-layer of PCB in multilayer PCB (>2 layers)',  :value => 0.851586602104116)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Rigid', :family => 'Double-sided (2 layers)',  :value => 0.621291346654063)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Rigid', :family => 'Single-sided PCB (1 layer)',  :value => 0.411291346654063)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Elastic', :family => '1-layer of PCB in multilayer PCB (>2 layers)',  :value => 0.851586602104116)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Elastic', :family => 'Double-sided (2 layers)',  :value => 0.621291346654063)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Elastic', :family => 'Single-sided PCB (1 layer)',  :value => 0.411291346654063)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'HAL', :lifecycle => 'MATERIAL', :category => 'Coating', :family => 'Coating',  :value => 0.0490)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'ENIG', :lifecycle => 'MATERIAL', :category => 'Coating', :family => 'Coating',  :value => 0.2800)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'Sn', :lifecycle => 'MATERIAL', :category => 'Coating', :family => 'Coating',  :value => 0.1420)
  PcExcelValue.create(:indicator_id => indicator_1_pc.id, :name => 'Ag', :lifecycle => 'MATERIAL', :category => 'Coating', :family => 'Coating',  :value => 0.1420)

  
  indicator_2_pc = Indicator.create(:name => 'Energy consumption', :unit => 'kWh', :category => 'energy', :subcategory => 'consumption', :sector => 'printed')
                     
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Rigid', :family => '1-layer of PCB in multilayer PCB (>2 layers)',  :value => 39.6131647278366)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Rigid', :family => 'Double-sided (2 layers)',  :value => 41.0066379581905)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Rigid', :family => 'Single-sided PCB (1 layer)',  :value => 66.8342107144351)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Elastic', :family => '1-layer of PCB in multilayer PCB (>2 layers)',  :value => 28.951)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Elastic', :family => 'Double-sided (2 layers)',  :value => 28.796)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'MATERIAL', :category => 'Elastic', :family => 'Single-sided PCB (1 layer)',  :value => 42.412)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'HAL', :lifecycle => 'MATERIAL', :category => 'Coating', :family => 'Coating',  :value => 3.1728)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'ENIG', :lifecycle => 'MATERIAL', :category => 'Coating', :family => 'Coating',  :value => 30.4710)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'Sn', :lifecycle => 'MATERIAL', :category => 'Coating', :family => 'Coating',  :value => 13.6191)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'Ag', :lifecycle => 'MATERIAL', :category => 'Coating', :family => 'Coating',  :value => 13.6191)
  
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Rigid/Elastic', :family => '1-layer of PCB in multilayer PCB (>2 layers)',  :value => 60.2)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Rigid/Elastic', :family => 'Double-sided (2 layers)',  :value => 74)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'PCB', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Rigid/Elastic', :family => 'Single-sided PCB (1 layer)',  :value => 91.2)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'HAL', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Coating', :family => 'Coating',  :value => 35.2000)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'ENIG', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Coating', :family => 'Coating',  :value => 33.6000)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'Sn', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Coating', :family => 'Coating',  :value => 8)
  PcExcelValue.create(:indicator_id => indicator_2_pc.id, :name => 'Ag', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Coating', :family => 'Coating',  :value => 8)
     
  indicator_3_pc = Indicator.create(:name => 'Total sludge and waste emitted', :unit => 'kg', :category => 'waste', :subcategory => 'production', :sector => 'printed')
                
  PcExcelValue.create(:indicator_id => indicator_3_pc.id, :name => 'PCB', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Rigid/Elastic', :family => '1-layer of PCB in multilayer PCB (>2 layers)',  :value => 1.9717)
  PcExcelValue.create(:indicator_id => indicator_3_pc.id, :name => 'PCB', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Rigid/Elastic', :family => 'Double-sided (2 layers)',  :value => 2.4057)
  PcExcelValue.create(:indicator_id => indicator_3_pc.id, :name => 'PCB', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Rigid/Elastic', :family => 'Single-sided PCB (1 layer)',  :value => 3.9332)
  PcExcelValue.create(:indicator_id => indicator_3_pc.id, :name => 'HAL', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Coating', :family => 'Coating',  :value => 0.0557)
  PcExcelValue.create(:indicator_id => indicator_3_pc.id, :name => 'ENIG', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Coating', :family => 'Coating',  :value => 0.7880)
  PcExcelValue.create(:indicator_id => indicator_3_pc.id, :name => 'Sn', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Coating', :family => 'Coating',  :value => 0.1836)
  PcExcelValue.create(:indicator_id => indicator_3_pc.id, :name => 'Ag', :lifecycle => 'ENERGY IN PRODUCTION', :category => 'Coating', :family => 'Coating',  :value => 0.1836)
  
  
  indicator_4_pc = Indicator.create(:name => 'Carbon footprint - CF', :unit => 'kg CO2 eq', :category => 'to air', :subcategory => 'emission', :sector => 'printed')
  
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'PCB', :lifecycle => 'PRODUCTION', :category => 'Rigid/Elastic', :family => '1-layer of PCB in multilayer PCB (>2 layers)',  :value => 0.156797964424617)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'PCB', :lifecycle => 'PRODUCTION', :category => 'Rigid/Elastic', :family => 'Double-sided (2 layers)',  :value => 0.350528135047134)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'PCB', :lifecycle => 'PRODUCTION', :category => 'Rigid/Elastic', :family => 'Single-sided PCB (1 layer)',  :value => 0.285757294614944)
                                        
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Austria', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.17355)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Belgium', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.22861)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Bulgaria', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.53771)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Cyprus', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.77388)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Czech Republic', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.57391)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Denmark', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.34783)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Estonia', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.81058)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Finland', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.21526)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_France', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.09613)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Germany', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.45504)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Greece', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.76449)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Hungary', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.33247)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Ireland', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.50439)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Italy', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.41035)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Latvia', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.1751)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Lithuania', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.12645)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Luxembourg', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.39149)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Malta', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 1.0193)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Netherlands', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.40266)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Poland', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.68132)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Portugal', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.3952)  
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Romania', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.50306)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Slovak Republic', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.23656)  
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Slovenia', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.34492)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Spain', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.31048)  
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_Sweden', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.04621)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_European Union - 27', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.3627)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Electricity_China', :lifecycle => 'PRODUCTION', :category => 'ENERGY', :family => 'Electricity',  :value => 0.7448369)
  
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Car', :lifecycle => 'DISTRIBUTION', :category => 'TRANSPORT', :family => 'Car',  :value => 0.002192082)  
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Rail', :lifecycle => 'DISTRIBUTION', :category => 'TRANSPORT', :family => 'Rail',  :value => 0.000125596)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Air domestic (to 1000 km)', :lifecycle => 'DISTRIBUTION', :category => 'TRANSPORT', :family => 'Air',  :value => 0.00706894)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Air Short-haul international (from 1001 to 5000 km)', :lifecycle => 'DISTRIBUTION', :category => 'TRANSPORT', :family => 'Air',  :value => 0.005427862)  
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Air Long-haul international (>5000 km)', :lifecycle => 'DISTRIBUTION', :category => 'TRANSPORT', :family => 'Air',  :value => 0.002472854)
#  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Ship General cargo - everage', :lifecycle => 'DISTRIBUTION', :category => 'TRANSPORT', :family => 'Ship',  :value => 0.000052224)
  PcExcelValue.create(:indicator_id => indicator_4_pc.id, :name => 'Ship', :lifecycle => 'DISTRIBUTION', :category => 'TRANSPORT', :family => 'Ship',  :value => 0.000052224)

 # Indicator.create(:name => 'Materials for recycling', :unit => 'g', :category => '', :subcategory => '', :sector => 'printed')
  Indicator.create(:name => 'Cu', :unit => 'g', :category => '', :subcategory => '', :sector => 'printed')  
  Indicator.create(:name => 'Au', :unit => 'g', :category => '', :subcategory => '', :sector => 'printed')
  Indicator.create(:name => 'Ni', :unit => 'g', :category => '', :subcategory => '', :sector => 'printed')
  Indicator.create(:name => 'Sn', :unit => 'g', :category => '', :subcategory => '', :sector => 'printed')
  Indicator.create(:name => 'Ag', :unit => 'g', :category => '', :subcategory => '', :sector => 'printed')
  Indicator.create(:name => 'Glass', :unit => 'g', :category => '', :subcategory => '', :sector => 'printed')  
  Indicator.create(:name => 'Resin', :unit => 'g', :category => '', :subcategory => '', :sector => 'printed')  
end


if UserFirstAnswer.count == 0
  UserFirstAnswer.create(:name=>"LCA")
  UserFirstAnswer.create(:name=>"Carbon Footprint")
  UserFirstAnswer.create(:name=>"Ecodesign")
  UserFirstAnswer.create(:name=>"Neither")
  UserFirstAnswer.create(:name=>"Other (please specify)")
end

if UserSecondAnswer.count == 0
  UserSecondAnswer.create(:name=>"In the media (trade press, journals, newspapers, blogs etc. online or in print)")
  UserSecondAnswer.create(:name=>"Via the LCA to go website")
  UserSecondAnswer.create(:name=>"I received an invitation to LCA to go")
  UserSecondAnswer.create(:name=>"Personal contact with an LCA to go partner")
  UserSecondAnswer.create(:name=>"Referred to LCA to go by another organisation")
  UserSecondAnswer.create(:name=>"Other (please specify)")
end

if UserThirdAnswer.count == 0
  UserThirdAnswer.create(:name=>"To feed into your organisation's sustainable reporting")
  UserThirdAnswer.create(:name=>"To increase sales/branding/marketing")
  UserThirdAnswer.create(:name=>"To reduce costs")
  UserThirdAnswer.create(:name=>"To adhere to environmental regulations")
  UserThirdAnswer.create(:name=>"To make environmental performance improvements")
  UserThirdAnswer.create(:name=>"To update your personal professional knowledge of LCA")
  UserThirdAnswer.create(:name=>"To update your organisation's professional knowledge of LCA")
  UserThirdAnswer.create(:name=>"Other (please specify)")
end

