namespace :db do
  desc "Import bio-plastic BpExcelValue data"

  #DOC definition
  PATH_FILE = "doc/"
  DOC_NAME = "BD_KEPIs_biobased plastics_29_07_2013.xlsx"
  PAGE_BP_KEPIS = 0
  
  #COL definition
  FIRST_COL = 5
  LAST_COL = 192
  
  #Indicator value position
  FLOW_NAME = 2
  FUNCTIONAL_UNIT = 3
  LOCAL_NAME = 4
  LIFE_CYCLE_PHASE = 5
  CATEGORY = 6
  FAMILY = 7
  
  GLOBAL_WARMING = 9
  WATER_FOOTPRINT = 10
  LAND_USE = 11
  CED_NON_RENEWABLE = 12
  CED_RENEWABLE = 13
  EUTROPHICATION = 14
  ACIDIFICATION = 15
  POCP = 16
  RESPIRATORY_INORGANICS = 17

  GLOBAL_WARMING_NAME = "Global Warming"
  WATER_FOOTPRINT_NAME = "Water Footprint"
  LAND_USE_NAME = "Land Use"
  CED_NON_RENEWABLE_NAME = "Cumulative Energy Demand (CED) - non-renewable"
  CED_RENEWABLE_NAME = "Cumulative Energy Demand (CED) - renewable"
  EUTROPHICATION_NAME = "Eutrophication"
  ACIDIFICATION_NAME = "Acidification"
  POCP_NAME = "Photochemical Ozone Creation Potential"
  RESPIRATORY_INORGANICS_NAME = "Respiratory Inorganics"
  
  #Sector
  SECTOR = "bio-plastic"
  

  def load_excel_value_data
  	begin
		BpExcelValue.delete_all

		workbook = RubyXL::Parser.parse(PATH_FILE + DOC_NAME, "false")  		
		general_data = workbook.worksheets[PAGE_BP_KEPIS].extract_data

		(FIRST_COL..LAST_COL).each do |col|

			base_excel_val = BpExcelValue.new
			base_excel_val.flow_name = general_data[FLOW_NAME][col]
			base_excel_val.functional_unit = general_data[FUNCTIONAL_UNIT][col]
			base_excel_val.local_name = general_data[LOCAL_NAME][col]
			base_excel_val.life_cycle_phase = general_data[LIFE_CYCLE_PHASE][col]
			base_excel_val.category = general_data[CATEGORY][col]
			base_excel_val.family = general_data[FAMILY][col]

			create_bp_excel_values(base_excel_val,general_data,col,GLOBAL_WARMING_NAME)
			create_bp_excel_values(base_excel_val,general_data,col,WATER_FOOTPRINT_NAME)
			create_bp_excel_values(base_excel_val,general_data,col,LAND_USE_NAME)
			create_bp_excel_values(base_excel_val,general_data,col,CED_NON_RENEWABLE_NAME)
			create_bp_excel_values(base_excel_val,general_data,col,CED_RENEWABLE_NAME)
			create_bp_excel_values(base_excel_val,general_data,col,EUTROPHICATION_NAME)
			create_bp_excel_values(base_excel_val,general_data,col,ACIDIFICATION_NAME)
			create_bp_excel_values(base_excel_val,general_data,col,POCP_NAME)
			create_bp_excel_values(base_excel_val,general_data,col,RESPIRATORY_INORGANICS_NAME)
		end
	      	
  	rescue Exception => e
		puts e.message
	end	

  end  	

  def create_bp_excel_values(base_excel_val,general_data,col,indicator_name)
  	ev = base_excel_val.clone
  	
  	if indicator_name == GLOBAL_WARMING_NAME
      ev.indicator_id = @bp_global_warming.id
      ev.value = general_data[GLOBAL_WARMING][col]
    elsif indicator_name == WATER_FOOTPRINT_NAME
      ev.indicator_id = @bp_water_footprint.id
      ev.value = general_data[WATER_FOOTPRINT][col]
    elsif indicator_name == LAND_USE_NAME
      ev.indicator_id = @bp_land_use.id
      ev.value = general_data[LAND_USE][col]
    elsif indicator_name == CED_NON_RENEWABLE_NAME
      ev.indicator_id = @bp_ced_non_renewable.id
      ev.value = general_data[CED_NON_RENEWABLE][col]
    elsif indicator_name == CED_RENEWABLE_NAME
      ev.indicator_id = @bp_ced_renewable.id
      ev.value = general_data[CED_RENEWABLE][col]
    elsif indicator_name == EUTROPHICATION_NAME
      ev.indicator_id = @bp_eutrophication.id
      ev.value = general_data[EUTROPHICATION][col]
    elsif indicator_name == ACIDIFICATION_NAME
      ev.indicator_id = @bp_acidification.id
      ev.value = general_data[ACIDIFICATION][col]
    elsif indicator_name == POCP_NAME
      ev.indicator_id = @bp_pocp.id
      ev.value = general_data[POCP][col]
    elsif indicator_name == RESPIRATORY_INORGANICS_NAME
      ev.indicator_id = @bp_respiratory_inorganics.id
      ev.value = general_data[RESPIRATORY_INORGANICS][col]
    else
      puts red('ERROR: ') + "indicator -> \"#{indicator_name}\" not found!"
  	end

    if excel_value_is_valid?(ev)
      if ev.save
        puts green('DONE: ') + "indicator -> \"#{indicator_name}\" saved. Column: #{col}/#{LAST_COL}"
      else
        puts red('ERROR: ') + "indicator -> \"#{indicator_name}\" unsaved. Column: #{col}/#{LAST_COL}"
      end
    else
        puts red('ERROR: ') + "indicator -> \"#{indicator_name}\" invalid data. Column: #{col}/#{LAST_COL}"
        puts "indicator_id: " + ev.indicator_id.to_s
        puts "flow_name: " + ev.flow_name.to_s
        puts "functional_unit: " + ev.functional_unit.to_s
        puts "local_name: " + ev.local_name.to_s
        puts "life_cycle_phase: " + ev.life_cycle_phase.to_s
        puts "category: " + ev.category.to_s
        puts "family: " + ev.family.to_s
        puts "value: " + ev.value.to_s
    end

  end	

  def load_indicators
    @bp_global_warming = Indicator.find_by_name_and_sector(GLOBAL_WARMING_NAME,SECTOR)
	  @bp_water_footprint = Indicator.find_by_name_and_sector(WATER_FOOTPRINT_NAME,SECTOR)
	  @bp_land_use = Indicator.find_by_name_and_sector(LAND_USE_NAME,SECTOR)
	  @bp_ced_non_renewable = Indicator.find_by_name_and_sector(CED_NON_RENEWABLE_NAME,SECTOR)
	  @bp_ced_renewable = Indicator.find_by_name_and_sector(CED_RENEWABLE_NAME,SECTOR)
	  @bp_eutrophication = Indicator.find_by_name_and_sector(EUTROPHICATION_NAME,SECTOR)
	  @bp_acidification = Indicator.find_by_name_and_sector(ACIDIFICATION_NAME,SECTOR)
	  @bp_pocp = Indicator.find_by_name_and_sector(POCP_NAME,SECTOR)
	  @bp_respiratory_inorganics = Indicator.find_by_name_and_sector(RESPIRATORY_INORGANICS_NAME,SECTOR)


    if @bp_global_warming.nil? || @bp_water_footprint.nil? || @bp_land_use.nil? ||
        @bp_ced_non_renewable.nil? || @bp_ced_renewable.nil? || @bp_eutrophication.nil? || @bp_acidification.nil? ||
        @bp_pocp.nil? || @bp_respiratory_inorganics.nil?

      puts "**** ERROR LOADING INDICATORS ****"
          puts "Global warming: #{@bp_global_warming.inspect}"
          puts "Water footprint: #{@bp_water_footprint.inspect}"
          puts "Land use: #{@bp_land_use.inspect}"
          puts "Ced non renewable: #{@bp_ced_non_renewable.inspect}"
          puts "Ced renewable: #{@bp_ced_renewable.inspect}"
          puts "Eutrophication: #{@bp_eutrophication.inspect}"
          puts "Acidification: #{@bp_acidification.inspect}"
          puts "Pocp: #{@bp_pocp.inspect}"
          puts "Respiratory inorganics: #{@bp_respiratory_inorganics.inspect}"
          puts "**** END OF ERROR ****"
    end
  end

  def colorize(text, color_code)
  	"\e[#{color_code}m#{text}\e[0m"
  end

  def red(text); colorize(text, 31); end
  def green(text); colorize(text, 32); end

  def excel_value_is_valid?(ev)
  	if ev.indicator_id.nil? || ev.functional_unit.nil? || ev.local_name.nil? || ev.life_cycle_phase.nil? || ev.category.nil? || ev.family.nil? || ev.value.nil?
  		#ev.flow_name.nil? trec aquest filtre perque a partir del registre 73 hi ha registres en blanc.
  		return false
  	else
  		return true
  	end		
  end

  task :import_bio_plastic_kepis => :environment do
    require 'rubyXL'

    BpExcelValue.transaction do
      load_indicators
      load_excel_value_data
    end
  end
end