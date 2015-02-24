  require 'rubyXL'

  #DOC definition
  PATH_FILE = "doc/"
  DOC_NAME = "Smart_textile_Database_Conversion_07082013_a.xlsx"
  PAGE_LCATO_GO_FORMAT = 1

  #COL definition
  FIRST_COL = 5
  LAST_COL = 186

  #Indicator value position
  FLOW_NAME = 3
  FUNCTIONAL_UNIT = 4
  LOCAL_NAME = 5
  LIFE_CYCLE_PHASE = 6
  CATEGORY = 7
  FAMILY = 8

  ECO_COST = 10

  ECO_COST_NAME = "Eco-cost"

  #Sector
  SECTOR = "textiles"

  def load_excel_value_data
    begin
      StExcelValue.delete_all

      workbook = RubyXL::Parser.parse(PATH_FILE + DOC_NAME, "false")
      general_data = workbook.worksheets[PAGE_LCATO_GO_FORMAT].extract_data

      (FIRST_COL..LAST_COL).each do |col|
        base_excel_val = StExcelValue.new
        base_excel_val.flow_name = general_data[FLOW_NAME][col]
        base_excel_val.functional_unit = general_data[FUNCTIONAL_UNIT][col]
        base_excel_val.local_name = general_data[LOCAL_NAME][col]
        base_excel_val.life_cycle_phase = general_data[LIFE_CYCLE_PHASE][col]
        base_excel_val.category = general_data[CATEGORY][col]
        base_excel_val.family = general_data[FAMILY][col]

        create_excel_values(base_excel_val,general_data,col,ECO_COST_NAME)
      end

    rescue Exception => e
      puts e.message
    end

  end

  def create_excel_values(base_excel_val,general_data,col,indicator_name)
    ev = base_excel_val.clone

    if indicator_name == ECO_COST_NAME
      ev.indicator_id = @eco_cost.id
      ev.value = general_data[ECO_COST][col]

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
    @eco_cost = Indicator.find_by_name_and_sector(ECO_COST_NAME,SECTOR)

    if @eco_cost.nil?
      puts "**** ERROR LOADING INDICATORS ****"
      puts "Eco-cost: #{@eco_cost.inspect}"
      puts "**** END OF ERROR ****"
    else
      puts "**** INDICATORS LOAD OK ****"
      puts "#{@eco_cost.name}: OK"
      puts "**** END OF ERROR ****"
    end
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def red(text); colorize(text, 31); end
  def green(text); colorize(text, 32); end

  def excel_value_is_valid?(ev)
    puts ev.inspect
    if ev.indicator_id.nil? || ev.functional_unit.nil? ||
        ev.local_name.nil? || ev.life_cycle_phase.nil? ||
        ev.category.nil? || ev.family.nil? || ev.value.nil?
      #ev.flow_name.nil? trec aquest filtre perque a partir del registre 73 hi ha registres en blanc.
      #puts ev.inspect
      return false
    else
      return true
    end
  end

  load_indicators
  load_excel_value_data