class ProductResultsController < ApplicationController
  require 'csv'
  include ActionView::Helpers::TextHelper
  include ApplicationHelper
  include ScenariosHelper

  TRUNCATE = 30

  BLUE_COLOR = "#000000"
  RED_COLOR = "#303030"
  GREEN_COLOR = "#585858"
  WHITE_COLOR = "#808080"
  BLACK_COLOR = "#A8A8A8"
  GRAY_COLOR = "#D8D8D8"
  GRAY_COLOR_2 = "#E8E8E8"
  GRAY_COLOR_3 = "#F8F8F8"

  @materials_selected = false
  @manufacturing_selected = false
  @distribution_selected = false
  @use_selected = false
  @endoflife_selected = false
  @total_selected = false

  def next_step
    @product = Product.find(params[:product_id].to_i)
    # do_results_production @product

    respond_to do |format|
      format.html { redirect_to product_result_graphic_path(@product)}
    end
  end


  def generate_csv
    product = get_product(params[:product_id])
    limit1 = params[:limit1_csv]
    limit2 = params[:limit2_csv]
    limit3 = params[:limit3_csv]
    result_type = params[:result_type]

    # you can change it for no yearly results
    divisor = 1

    if product
      coder = HTMLEntities.new

      save_path = Rails.root.join('xls','excel_' + product.id.to_s + '.xls')
      if File.exists?(save_path)
        File.delete(save_path)
      end


      workbook = WriteExcel.new(save_path.to_s)
      # green
      workbook.set_custom_color(17, 185, 196, 91)
      # http://writeexcel.web.fc2.com/en/doc_en.html#set_custom_color
      # 20   =>   purple
      # 22   =>   silver
      # 23   =>   gray
      # 33   =>   pink
      workbook.set_custom_color(20, 223, 140, 0)
      workbook.set_custom_color(22, 255, 185, 0)
      workbook.set_custom_color(23, 255, 226, 111)
      workbook.set_custom_color(33, 255, 242, 191)

      # Add worksheet(s)
      worksheet  = workbook.add_worksheet


      format_color_1_title = workbook.add_format
      format_color_1_title.set_color('black')
      format_color_1_title.set_align('center')
      format_color_1_title.set_bg_color('purple')
      format_color_1_title.set_border(2)
      format_color_1_title.set_border_color('purple')


      format_color_2_title = workbook.add_format
      format_color_2_title.set_color('black')
      format_color_2_title.set_align('center')
      format_color_2_title.set_bg_color('silver')
      format_color_2_title.set_border(2)
      format_color_2_title.set_border_color('silver')
      format_color_2_title.set_right_color('black')

      format_color_3_title = workbook.add_format
      format_color_3_title.set_color('black')
      format_color_3_title.set_align('center')
      format_color_3_title.set_bg_color('gray')
      format_color_3_title.set_border(2)
      format_color_3_title.set_border_color('gray')
      format_color_3_title.set_right_color('black')

      format_color_4_title = workbook.add_format
      format_color_4_title.set_color('black')
      format_color_4_title.set_align('center')
      format_color_4_title.set_bg_color('pink')
      format_color_4_title.set_border(2)
      format_color_4_title.set_border_color('pink')
      format_color_4_title.set_right_color('black')


      format_color_1 = workbook.add_format
      format_color_1.set_color('black')
      format_color_1.set_align('center')
      format_color_1.set_bg_color('purple')
      format_color_1.set_border(2)
      format_color_1.set_border_color('white')
      format_color_1.set_num_format(0x01)

      format_color_2 = workbook.add_format
      format_color_2.set_color('black')
      format_color_2.set_align('center')
      format_color_2.set_bg_color('silver')
      format_color_2.set_border(2)
      format_color_2.set_border_color('white')
      format_color_2.set_num_format(0x01)

      format_color_3 = workbook.add_format
      format_color_3.set_color('black')
      format_color_3.set_align('center')
      format_color_3.set_bg_color('gray')
      format_color_3.set_border(2)
      format_color_3.set_border_color('white')
      format_color_3.set_num_format(0x01)

      format_color_4 = workbook.add_format
      format_color_4.set_color('black')
      format_color_4.set_align('center')
      format_color_4.set_bg_color('pink')
      format_color_4.set_border(2)
      format_color_4.set_border_color('white')
      format_color_4.set_num_format(0x01)

      worksheet.set_column('A:A', 25) # Column  A   width set to 20
      worksheet.set_column('B:B', 25) # Column  A   width set to 20
      worksheet.set_column('C:C', 25) # Column  A   width set to 20
      worksheet.set_column('D:D', 25) # Column  A   width set to 20
      worksheet.set_column('E:E', 25) # Column  A   width set to 20
      worksheet.set_column('F:F', 25) # Column  A   width set to 20
      worksheet.set_column('G:G', 25) # Column  A   width set to 20
      worksheet.set_column('H:H', 25) # Column  A   width set to 20

      # Add and define a format
      format_bold = workbook.add_format
      format_bold.set_bold
      format_bold.set_color('black')
      format_bold.set_align('center')
      format_bold.set_bg_color('green')
      format_bold.set_border(2)
      format_bold.set_border_color('white')

      format_bold_left = workbook.add_format
      format_bold_left.set_bold
      format_bold_left.set_color('black')
      format_bold_left.set_align('left')
      format_bold_left.set_bg_color('green')
      format_bold_left.set_border(2)
      format_bold_left.set_border_color('white')

      format_bold_right = workbook.add_format
      format_bold_right.set_bold
      format_bold_right.set_color('black')
      format_bold_right.set_align('right')
      format_bold_right.set_bg_color('green')
      format_bold_right.set_border(2)
      format_bold_right.set_border_color('white')

      format_bold_left_no_bg = workbook.add_format
      format_bold_left_no_bg.set_bold
      format_bold_left_no_bg.set_color('black')
      format_bold_left_no_bg.set_align('left')


      format = workbook.add_format
      format.set_color('black')
      format.set_align('right')

      format_num = workbook.add_format
      format_num.set_color('black')
      format_num.set_align('center')
      format_num.set_border(1)
      format_num.set_border_color('white')
      # format_num.set_num_format('0.00E+00')
      format_num.set_num_format('0.00')

      title = _('INDICATOR')
      title_2 = _('UNITS')
      worksheet.write(0, 0, title, format_bold_right)
      worksheet.write(1, 0, title_2, format_bold_right)
      product.indicators.sort_by{ |k| k['id'] }.each_with_index do |indicator, index|
        worksheet.write(0, index + 1, coder.decode(indicator.name), format_bold)  # cell B2
        if indicator.name == 'Carbon footprint' || indicator.name == 'Copper' || indicator.name == 'Aluminium' || indicator.name == 'Cobalt' || indicator.name == 'Steel'
          worksheet.write(1, index + 1, coder.decode(indicator.unit.gsub('<sub>','').gsub('</sub>','').gsub('<sup>','').gsub('</sup>','')), format_bold)  # cell B2
        else
          worksheet.write(1, index + 1, coder.decode("mg"), format_bold)  # cell B2
        end
      end

      first_node = Result.find(:all, :conditions => ["name_en=? and product_result_id = ?", 'Total', product.product_result.id]).first

      worksheet.write(2, 0, coder.decode("TOTAL"), format_bold_left)
      product.indicators.sort_by{ |k| k['id'] }.each_with_index do |indicator, index|
        result_value = ResultValue.find(:all, :conditions => ["result_id=? and indicator_id=?", first_node.id, indicator.id]).first
        worksheet.write_number(2, index + 1, result_value.value / divisor, format_color_1)  # cell B2
      end

      generate_worksheet first_node, first_node, product, worksheet, 2, product.indicators.sort_by{ |k| k['id'] }, format_bold, format_bold_left, format_bold_right, format_color_1, format_color_2, format_color_3, format_color_4, limit1, limit2, limit3, divisor

      worksheet.write(80, 3, coder.decode(_('Significance assessment')), format_bold_left_no_bg)
      worksheet.write(81, 3, "", format_color_4_title)
      worksheet.write(81, 4, "", format_color_3_title)
      worksheet.write(81, 5, "", format_color_2_title)
      worksheet.write(81, 6, "", format_color_1_title)

      worksheet.write(82, 2, "0%", format)
      worksheet.write(82, 3, "" + limit1 + "%", format)
      worksheet.write(82, 4, "" + limit2 + "%", format)
      worksheet.write(82, 5, "" + limit3 + "%", format)
      worksheet.write(82, 6, "100%", format)

      # write to file
      workbook.close

      # send_file "results.csv", :type => 'text/csv;charset=iso-8859-1'
      # send_file coder.decode(product.name) + ".xls"  
      send_file save_path
    else
      respond_to do |format|
        format.html { redirect_to(product_url) }
        format.xml { head :ok }
      end
    end
  end


  # GET /product_results
  # GET /product_results.xml

  def index
    @product_results = ProductResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_results }
    end
  end

  # GET /product_results/1
  # GET /product_results/1.xml
  def show
    @product = get_product(params[:id])
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
    add_breadcrumb _("Results").html_safe, product_result_url(@product)



    result_type = params[:result_type]
    @result_type = params[:result_type]
    @is_year = false
    if @result_type == 'year'
      @is_year = true
    end
    generate_results(result_type)
    @step = 1
  end


  def pdf

    @product = Product.find(params[:product_result_id])

    generate_results("year")
    generate_graphic


    save_path = Rails.root.join('pdfs','report_' + @product.id.to_s + '.pdf')
    if File.exists?(save_path)
      File.delete(save_path)
    end

    pdf_test = false
    if pdf_test
      render :layout => false
    else
      pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/product_results/pdf.html.erb', :layout => false))
      File.open(save_path, 'wb') do |file|
        file << pdf
      end
      send_file save_path
    end
  end


  def pdf_compare
    @step = 2

    @product_1 = Product.find(params[:product_id])
    # @product_to_compare = Product.find(params[:compareTo])
    @product = @product_1

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
    add_breadcrumb _("Comparison").html_safe, product_result_url(@product)

    do_comparison

    save_path = Rails.root.join('pdfs','comparison_' + @product_1.id.to_s + '.pdf')
    if File.exists?(save_path)
      File.delete(save_path)
    end


    pdf_test = false
    if pdf_test
      render :layout => false
    else
      pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/product_results/pdf_compare.html.erb', :layout => false).force_encoding("UTF-8"))
      File.open(save_path, 'wb') do |file|
        file << pdf.force_encoding("UTF-8")
      end
      send_file save_path
    end
  end

  # GET /product_results/1
  # GET /product_results/1.xml
  def graphic

    @product = get_product(params[:product_result_id])

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
    add_breadcrumb _("Results").html_safe, product_result_graphic_path(@product)


    result_type = params[:result_type]

    generate_results(result_type)
    generate_graphic
    @step = 2
  end

  def generate_graphic

    begin
      @product_to_compare = get_product(params[:compareTo])
    rescue
    end
    if @product
      @line_charts = Array.new
      @datas = Array.new
      @datas_absolute = Array.new
      @datas_year = Array.new
      @datas_production = Array.new
      @datas_use = Array.new

      @labels = Array.new
      @labels_absolute = Array.new
      @labels_production = Array.new
      @labels_use = Array.new

      @colors = Array.new
      @colors_absolute = Array.new
      @colors_production = Array.new
      @colors_use = Array.new
      coder = HTMLEntities.new

      @indicators_checked = Array.new
      @product.indicators.sort_by{ |k| k['id'] }.each do |indicator|
        @indicators_checked << indicator
      end


      @compare_values_1 = Array.new
      @compare_values_2 = Array.new
      @compare_titles = Array.new
      @compare_max = 0
      @compare_min = 0

      @product.indicators.each do |indicator|
        if @product_to_compare && @product_to_compare.product_result
          if params[:total]
            result_total_1 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', @product.product_result.id]).first
            if result_total_1
              result_total_value_1 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total_1.id]).first
            end

            result_total_2 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', @product_to_compare.product_result.id]).first
            if result_total_2
              result_total_value_2 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total_2.id]).first
            end
            if result_total_value_1
              @compare_values_1 << result_total_value_1.value
            else
              @compare_values_1 << 0
            end
            if result_total_value_2
              @compare_values_2 << result_total_value_2.value
            else
              @compare_values_2 << 0
            end
            @compare_titles << "TOTAL"

          end


          if params[:materials]
            result_materials_1 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'MATERIALS', @product.product_result.id]).first
            if result_materials_1
              result_materials_value_1 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_materials_1.id]).first
            end
            result_materials_2 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'MATERIALS', @product_to_compare.product_result.id]).first
            if result_materials_2
              result_materials_value_2 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_materials_2.id]).first
            end

            if result_materials_value_1
              @compare_values_1 << result_materials_value_1.value
            else
              @compare_values_1 << 0
            end
            if result_materials_value_2
              @compare_values_2 << result_materials_value_2.value
            else
              @compare_values_2 << 0
            end

            @compare_titles << "MATERIALS"
          end

          if params[:manufacturing]
            result_manufacturing_1 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'MANUFACTURING', @product.product_result.id]).first
            if result_manufacturing_1
              result_manufacturing_value_1 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_manufacturing_1.id]).first
            end
            result_manufacturing_2 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'MANUFACTURING', @product_to_compare.product_result.id]).first
            if result_manufacturing_2
              result_manufacturing_value_2 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_manufacturing_2.id]).first
            end
            if result_manufacturing_value_1
              @compare_values_1 << result_manufacturing_value_1.value
            else
              @compare_values_1 << 0
            end
            if result_manufacturing_value_2
              @compare_values_2 << result_manufacturing_value_2.value
            else
              @compare_values_2 << 0
            end


            @compare_titles << "MANUFACTURING"
          end

          if params[:distribution]
            result_distribution_1 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'DISTRIBUTION', @product.product_result.id]).first
            if result_distribution_1
              result_distribution_value_1 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_distribution_1.id]).first
            end
            result_distribution_2 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'DISTRIBUTION', @product_to_compare.product_result.id]).first
            if result_distribution_2
              result_distribution_value_2 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_distribution_2.id]).first
            end

            if result_distribution_value_1
              @compare_values_1 << result_distribution_value_1.value
            else
              @compare_values_1 << 0
            end
            if result_distribution_value_1
              @compare_values_2 << result_distribution_value_2.value
            else
              @compare_values_2 << 0
            end

            @compare_titles << "DISTRIBUTION"

          end

          if params[:use]
            result_use_1 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'USE', @product.product_result.id]).first
            if result_use_1
              result_use_value_1 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_use_1.id]).first
            end
            result_use_2 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'USE', @product_to_compare.product_result.id]).first
            if result_use_2
              result_use_value_2 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_use_2.id]).first
            end
            if result_use_value_1
              @compare_values_1 << result_use_value_1.value
            else
              @compare_values_1 << 0
            end
            if result_use_value_2
              @compare_values_2 << result_use_value_2.value
            else
              @compare_values_2 << 0
            end
            @compare_titles << "USE"


          end

          if params[:end_of_life]
            result_endoflife_1 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'END-OF-LIFE', @product.product_result.id]).first
            if result_endoflife_1
              result_endoflife_value_1 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_endoflife_1.id]).first
            end
            result_endoflife_2 = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'END-OF-LIFE', @product_to_compare.product_result.id]).first
            if result_endoflife_2
              result_endoflife_value_2 = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_endoflife_2.id]).first
            end
            if result_endoflife_value_1
              @compare_values_1 << result_endoflife_value_1.value
            else
              @compare_values_1 << 0
            end
            if result_endoflife_value_2
              @compare_values_2 << result_endoflife_value_2.value
            else
              @compare_values_2 << 0
            end
            @compare_titles << "END-OF-LIFE"

          end
        end
      end


      ## AVERAGE TECHNICAL DEFAULT
      average_technical_lifetime = calculate_average_technical_lifetime(@product)

      @product.indicators.sort_by{ |k| k['id'] }.each do |indicator|
        data = Array.new
        data_absolute = Array.new
        data_year = Array.new

        result_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', @product.product_result.id]).first
        result_total_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
        total = result_total_value.value

        data << 100
        if indicator.name == 'Carbon footprint' || indicator.name == 'Copper' || indicator.name == 'Aluminium' ||indicator.name == 'Cobalt' || indicator.name == 'Steel'
          data_absolute << total
          data_year << total / average_technical_lifetime
        else
          data_absolute << total * 1000
          data_year << total * 1000 / average_technical_lifetime
        end
        @labels << _('TOTAL')
        @labels_absolute << _('TOTAL')
        @colors << TOTAL_COLOR
        @colors_absolute  << TOTAL_COLOR


        logger.info "TOTAL --> " + total.to_s
        result_total.children.each do |result|
          if result.check_graphic
            result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result.id]).first
            if !result_value || total == 0
              value = 0
              value_absolute = 0
            else
              value = ((result_value.value / total) * 100).to_i
              value_absolute = result_value.value
            end
            logger.info "RESULT VALUE --> " + value.to_s
            data << value
            if indicator.name == 'Carbon footprint' || indicator.name == 'Copper' || indicator.name == 'Aluminium' ||indicator.name == 'Cobalt' || indicator.name == 'Steel'
              data_absolute << value_absolute
              data_year << value_absolute / average_technical_lifetime
            else
              data_absolute << value_absolute * 1000
              data_year << value_absolute * 1000 / average_technical_lifetime
            end
            @labels <<  coder.decode(truncate(result.name_ca.html_safe, :length => TRUNCATE))
            @labels_absolute <<  coder.decode(truncate(result.name_ca.html_safe, :length => TRUNCATE))
            @colors << get_color(result.name_en, result.parent.name_en)
            @colors_absolute << get_color(result.name_ca, result.parent.name_en)

            result.children.each do |result|
              if result.check_graphic
                result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result.id]).first
                if !result_value || total == 0
                  value = 0
                  value_absolute = 0
                else
                  value = ((result_value.value / total) * 100).to_i
                  value_absolute = result_value.value
                end

                data << value
                data_absolute << value_absolute
                data_year << value_absolute / average_technical_lifetime
                @labels <<  coder.decode(truncate(result.name_ca.html_safe.gsub('&', '%26'), :length => TRUNCATE))
                @labels_absolute <<  coder.decode(truncate(result.name_ca.html_safe.gsub('&', '%26'), :length => TRUNCATE))
                @colors << get_color(result.name_en, result.parent.name_en)
                @colors_absolute << get_color(result.name_en, result.parent.name_en)
              end
            end



          end
        end
        if data.size > 0
          @datas << data
        end
        if data_absolute.size > 0
          @datas_absolute << data_absolute
        end
        if data_year.size > 0
          @datas_year << data_year
        end

      end

      @combineds = Array.new
      @datas.each do |data|
        one_item = Array.new
        data.each_with_index do |item, index|
          temp = Array.new
          temp << item
          temp << @labels[index].to_s
          temp << @colors[index].to_s
          one_item << temp
        end
        @combineds << one_item
      end

      @combineds_absolute = Array.new
      @datas_absolute.each do |data|
        one_item = Array.new
        data.each_with_index do |item, index|
          temp = Array.new
          temp << item
          temp << @labels_absolute[index].to_s
          temp << @colors_absolute[index].to_s
          one_item << temp
        end
        @combineds_absolute << one_item
      end


      @combineds_year = Array.new
      @datas_year.each do |data|
        one_item = Array.new
        data.each_with_index do |item, index|
          temp = Array.new
          temp << item
          temp << @labels_absolute[index].to_s
          temp << @colors_absolute[index].to_s
          one_item << temp
        end
        @combineds_year << one_item
      end

      @sort = 'no'


      ## END FASES

      ## INIT PRODUCTION
      color_array = Array.new
      color_array[0] = BLUE_COLOR
      color_array[1] = RED_COLOR
      color_array[2] = GREEN_COLOR
      color_array[3] = WHITE_COLOR
      color_array[4] = BLACK_COLOR
      color_array[5] = GRAY_COLOR
      color_array[6] = GRAY_COLOR_2
      color_array[7] = GRAY_COLOR_3


      labels_production_temp = Array.new
      colors_production_temp = Array.new

      #  @product.indicators.each do |indicator|
      indicator = Indicator.find_by_sector_and_abbr("electronics", "CF")
      @colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00"]

      @manufacturing_ticks = ''
      @manufacturing_values = ''
      @manufacturing_colors = ''

      result_total = Result.find_by_name_en_and_product_result_id('MANUFACTURING', @product.product_result.id)
      total = 0
      if result_total
        result_value = ResultValue.find_by_result_id_and_indicator_id(result_total.id, indicator.id)
        if result_value
          total = result_value.value
        end
      end
      families = Family.all
      others = 0
      num_items = 0
      families.each_with_index do |family, index|
        subtotal = 0
        result_total.children.each do |subresult|
          if subresult.name_en == family.name
            result_value = ResultValue.find_by_result_id_and_indicator_id(subresult.id, indicator.id)
            if result_value
              subtotal += result_value.value
            end
          end
        end
        percentage = 0
        if subtotal != 0
          percentage = ((subtotal / total).to_f * 100).round(2)
        end
        if percentage >= 1
          if @manufacturing_ticks != ''
            @manufacturing_ticks += "|"
            @manufacturing_values += ","
            @manufacturing_colors += "|"
          end
          percentage = ((subtotal / total).to_f * 100).round(2)
          @manufacturing_ticks += family.name.gsub('&','and').html_safe + "(" + percentage.to_s + " %)"
          @manufacturing_values += percentage.to_s
          @manufacturing_colors += @colors[index].to_s
          num_items = num_items + 1
        else
          others += percentage
        end
      end
      if others > 0
        #   percentage = ((others / total).to_f * 100).round(2)
        @manufacturing_ticks += "|"
        @manufacturing_values += ","
        @manufacturing_colors += "|"
        @manufacturing_ticks += _("Others") + "(" + others.round(2).to_s + " %)"
        @manufacturing_values += others.to_s
        @manufacturing_colors += @colors[num_items].to_s
      end




      ## END PRODUCTION

      ## INIT USE

      @use_ticks = ''
      @use_values = ''
      @use_colors = ''

      result_total = Result.find_by_name_en_and_product_result_id('USE', @product.product_result.id)
      total = 0
      if result_total
        result_value = ResultValue.find_by_result_id_and_indicator_id(result_total.id, indicator.id)
        if result_value
          total = result_value.value
        end
      end

      result_replacement = Result.find_by_name_en_and_product_result_id_and_parent_id('Replacement', @product.product_result.id, result_total.id)
      result_value_replacement = ResultValue.find_by_result_id_and_indicator_id(result_replacement.id, indicator.id)
      if total && total !=0 && result_value_replacement && result_value_replacement.value && result_value_replacement.value != 0
        percentage = ((result_value_replacement.value / total).to_f * 100).round(2)
      else
        percentage = 0
      end

      @use_ticks += result_replacement.name_en.html_safe + "(" + percentage.to_s + " %)"
      @use_values += percentage.to_s
      @use_colors += @colors[0].to_s

      result_power = Result.find_by_name_en_and_product_result_id_and_parent_id('Power consumption', @product.product_result.id, result_total.id)


      result_power.children.each_with_index do |subresult, index|
        result_value = ResultValue.find_by_result_id_and_indicator_id(subresult.id, indicator.id)
        subtotal = 0
        if result_value
          subtotal = result_value.value
        end

        if subtotal != 0
          if @use_ticks != ''
            @use_ticks += "|"
            @use_values += ","
            @use_colors += "|"
          end
          percentage = ((subtotal / total).to_f * 100).round(2)
          @use_ticks += subresult.name_en.html_safe + "(" + percentage.to_s + " %)"
          @use_values += percentage.to_s
          @use_colors += @colors[index + 1].to_s
        end
      end



    else
      respond_to do |format|
        format.html { redirect_to(products_url) }
        format.xml { head :ok }
      end
    end
  end



  def generate_results(result_type)
    # 11.157420262
    time_init = Time.new
    divisor = 1


    if @product
      @step = 1


      if !@product.product_result
        @product.product_result = ProductResult.new
        @product.product_result.save
      end
      @product_result = @product.product_result


      results_created = false
      results_to_delete = Result.find_all_by_product_result_id(@product_result.id)
      results_to_delete.each do |result|
        result_values_to_delete = ResultValue.find(:all, :conditions => ["result_id = ?" , result.id])
        ResultValue.delete(result_values_to_delete)
        if !result.has_checkbox
          result.delete
        end
        results_created = true
      end

      if !results_created
        root_result = Result.new(:product_result_id => @product_result.id, :name_en => "Total", :name_ca => "Total", :name_es => "Total", :parent_id => -1, :has_checkbox => true)
        root_result.save

        ## MANUFACTURING
        manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "MANUFACTURING", :name_ca => "MANUFACTURING", :name_es => "MANUFACTURING", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
        manufacturing_result.save

        housing_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Housing & internal structural elements", :name_ca => "Housing & internal structural elements", :name_es => "Housing & internal structural elements", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        housing_manufacturing_result.save

        display_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Display", :name_ca => "Display", :name_es => "Display", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        display_manufacturing_result.save

        printed_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Printed Circuit Board Assemblies", :name_ca => "Printed Circuit Board Assemblies", :name_es => "Printed Circuit Board Assemblies", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        printed_manufacturing_result.save

        tantalum_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Tantalum capacitors", :name_ca => "Tantalum capacitors", :name_es => "Tantalum capacitors", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        tantalum_manufacturing_result.save

        memory_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Memory", :name_ca => "Memory", :name_es => "Memory", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        memory_manufacturing_result.save

        processor_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Processor", :name_ca => "Processor", :name_es => "Processor", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        processor_manufacturing_result.save

        storage_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Storage", :name_ca => "Storage", :name_es => "Storage", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        storage_manufacturing_result.save

        optical_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Optical Disc Drive", :name_ca => "Optical Disc Drive", :name_es => "Optical Disc Drive", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        optical_manufacturing_result.save

        connectivity_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Connectivity", :name_ca => "Connectivity", :name_es => "Connectivity", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        connectivity_manufacturing_result.save

        power_supply_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Power supply", :name_ca => "Power supply", :name_es => "Power supply", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        power_supply_manufacturing_result.save

        cables_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Cables", :name_ca => "Cables", :name_es => "Cables", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        cables_manufacturing_result.save

        battery_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Battery", :name_ca => "Battery", :name_es => "Battery", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        battery_manufacturing_result.save

        overhead_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Overhead miscellaneous parts", :name_ca => "Overhead miscellaneous parts", :name_es => "Overhead miscellaneous parts", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
        overhead_manufacturing_result.save


        ## DISTRIBUTION

        distribution_result = Result.new(:product_result_id => @product_result.id, :name_en => "DISTRIBUTION", :name_ca => "DISTRIBUTION", :name_es => "DISTRIBUTION", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
        distribution_result.save

        packaging_result = Result.new(:product_result_id => @product_result.id, :name_en => "Packaging", :name_ca => "Packaging", :name_es => "Packaging", :parent_id => distribution_result.id, :check_graphic => false, :has_checkbox => true)
        packaging_result.save

        transport_result = Result.new(:product_result_id => @product_result.id, :name_en => "Transport", :name_ca => "Transport", :name_es => "Transport", :parent_id => distribution_result.id, :check_graphic => false, :has_checkbox => true)
        transport_result.save


        ## USE

        use_result = Result.new(:product_result_id => @product_result.id, :name_en => "USE", :name_ca => "USE", :name_es => "USE", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
        use_result.save


        power_supply_result = Result.new(:product_result_id => @product_result.id, :name_en => "Power consumption", :name_ca => "Power consumption", :name_es => "Power consumption", :parent_id => use_result.id, :check_graphic => false, :has_checkbox => true)
        power_supply_result.save

        power_off_result = Result.new(:product_result_id => @product_result.id, :name_en => "Power off", :name_ca => "Power off", :name_es => "Power off", :parent_id => power_supply_result.id, :check_graphic => false, :has_checkbox => true)
        power_off_result.save

        power_sleep_result = Result.new(:product_result_id => @product_result.id, :name_en => "Power sleep", :name_ca => "Power sleep", :name_es => "Power sleep", :parent_id => power_supply_result.id, :check_graphic => false, :has_checkbox => true)
        power_sleep_result.save

        power_long_idle_result = Result.new(:product_result_id => @product_result.id, :name_en => "Power long idle", :name_ca => "Power long idle", :name_es => "Power long idle", :parent_id => power_supply_result.id, :check_graphic => false, :has_checkbox => true)
        power_long_idle_result.save

        power_short_idle_result = Result.new(:product_result_id => @product_result.id, :name_en => "Power short idle", :name_ca => "Power short idle", :name_es => "Power short idle", :parent_id => power_supply_result.id, :check_graphic => false, :has_checkbox => true)
        power_short_idle_result.save

        power_other_result = Result.new(:product_result_id => @product_result.id, :name_en => "Other", :name_ca => "Other", :name_es => "Other", :parent_id => power_supply_result.id, :check_graphic => false, :has_checkbox => true)
        power_other_result.save



        replacement_result = Result.new(:product_result_id => @product_result.id, :name_en => "Replacement", :name_ca => "Replacement", :name_es => "Replacement", :parent_id => use_result.id, :check_graphic => false, :has_checkbox => true)
        replacement_result.save

        spare_parts_result = Result.new(:product_result_id => @product_result.id, :name_en => "Spare parts", :name_ca => "Spare parts", :name_es => "Spare parts", :parent_id => replacement_result.id, :check_graphic => false, :has_checkbox => true)
        spare_parts_result.save

        use_transport_result = Result.new(:product_result_id => @product_result.id, :name_en => "Transport", :name_ca => "Transport", :name_es => "Transport", :parent_id => replacement_result.id, :check_graphic => false, :has_checkbox => true)
        use_transport_result.save


        ## END_OF_LIFE

        endoflife_result = Result.new(:product_result_id => @product_result.id, :name_en => "END-OF-LIFE", :name_ca => "END-OF-LIFE", :name_es => "END-OF-LIFE", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
        endoflife_result.save

        reuse_result = Result.new(:product_result_id => @product_result.id, :name_en => "Reuse", :name_ca => "Reuse", :name_es => "Reuse", :parent_id => endoflife_result.id, :check_graphic => false, :has_checkbox => true)
        reuse_result.save

        reuse_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Manufacturing comp.", :name_ca => "Manufacturing comp.", :name_es => "Manufacturing comp.", :parent_id => reuse_result.id, :check_graphic => false, :has_checkbox => true)
        reuse_manufacturing_result.save

        reuse_replacement_result = Result.new(:product_result_id => @product_result.id, :name_en => "Replacement comp.", :name_ca => "Replacement comp.", :name_es => "Replacement comp.", :parent_id => reuse_result.id, :check_graphic => false, :has_checkbox => true)
        reuse_replacement_result.save


        recycling_result = Result.new(:product_result_id => @product_result.id, :name_en => "Recycling", :name_ca => "Recycling", :name_es => "Recycling", :parent_id => endoflife_result.id, :check_graphic => false, :has_checkbox => true)
        recycling_result.save

      else
        root_result = Result.find_by_product_result_id_and_name_en(@product_result.id, "Total")
        manufacturing_result = Result.find_by_product_result_id_and_name_en_and_parent_id(@product_result.id, "MANUFACTURING", root_result.id)
        distribution_result = Result.find_by_product_result_id_and_name_en_and_parent_id(@product_result.id, "DISTRIBUTION", root_result.id)
        use_result = Result.find_by_product_result_id_and_name_en_and_parent_id(@product_result.id, "USE", root_result.id)
        endoflife_result = Result.find_by_product_result_id_and_name_en_and_parent_id(@product_result.id, "END-OF-LIFE", root_result.id)
        results = Result.find_all_by_product_result_id(@product_result.id, :order => "id")
        results.each do |result|
            if result.name_en == 'Housing & internal structural elements' && result.parent_id == manufacturing_result.id
              housing_manufacturing_result = result
            end
            if result.name_en == 'Display' && result.parent_id == manufacturing_result.id
              display_manufacturing_result = result
            end
            if result.name_en == 'Printed Circuit Board Assemblies' && result.parent_id == manufacturing_result.id
              printed_manufacturing_result = result
            end
            if result.name_en == 'Tantalum capacitors' && result.parent_id == manufacturing_result.id
              tantalum_manufacturing_result = result
            end
            if result.name_en == 'Memory' && result.parent_id == manufacturing_result.id
              memory_manufacturing_result = result
            end
            if result.name_en == 'Processor' && result.parent_id == manufacturing_result.id
              processor_manufacturing_result = result
            end
            if result.name_en == 'Storage' && result.parent_id == manufacturing_result.id
              storage_manufacturing_result = result
            end
            if result.name_en == 'Optical Disc Drive' && result.parent_id == manufacturing_result.id
              optical_manufacturing_result = result
            end
            if result.name_en == 'Connectivity' && result.parent_id == manufacturing_result.id
              connectivity_manufacturing_result = result
            end
            if result.name_en == 'Power supply' && result.parent_id.to_i == manufacturing_result.id.to_i
              power_supply_manufacturing_result = result
            end
            if result.name_en == 'Cables' && result.parent_id == manufacturing_result.id
              cables_manufacturing_result = result
            end
            if result.name_en == 'Battery' && result.parent_id == manufacturing_result.id
              battery_manufacturing_result = result
            end
            if result.name_en == 'Overhead miscellaneous parts' && result.parent_id == manufacturing_result.id
              overhead_manufacturing_result = result
            end
            if result.name_en == 'Packaging' && result.parent_id == distribution_result.id
              packaging_result = result
            end
            if result.name_en == 'Transport' && result.parent_id == distribution_result.id
              transport_result = result
            end
            if result.name_en == 'Power consumption' && result.parent_id.to_i == use_result.id.to_i
              power_supply_result = result
            end
            if result.name_en == 'Replacement' && result.parent_id == use_result.id
              replacement_result = result
            end
            if result.name_en == 'Reuse' && result.parent_id == endoflife_result.id
              reuse_result = result
            end
        end

        ## MANUFACTURING

        results.each do |result|
          if result.name_en == 'Power off' && result.parent_id == power_supply_result.id
            power_off_result = result
          end
          if result.name_en == 'Power sleep' && result.parent_id == power_supply_result.id
            power_sleep_result = result
          end
          if result.name_en == 'Power long idle' && result.parent_id == power_supply_result.id
            power_long_idle_result = result
          end
          if result.name_en == 'Power short idle' && result.parent_id == power_supply_result.id
            power_short_idle_result = result
          end
          if result.name_en == 'Other' && result.parent_id == power_supply_result.id
            power_other_result = result
          end
          if result.name_en == 'Spare parts' && result.parent_id == replacement_result.id
            spare_parts_result = result
          end
          if result.name_en == 'Transport' && result.parent_id == replacement_result.id
            use_transport_result = result
          end
          if result.name_en == 'Manufacturing comp.' && result.parent_id == reuse_result.id
            reuse_manufacturing_result = result
          end
          if result.name_en == 'Replacement comp.' && result.parent_id == reuse_result.id
            reuse_replacement_result = result
          end
          if result.name_en == 'Recycling' && result.parent_id == endoflife_result.id
            recycling_result = result
          end
        end


        if !overhead_manufacturing_result
           overhead_manufacturing_result = Result.new(:product_result_id => @product_result.id, :name_en => "Overhead miscellaneous parts", :name_ca => "Overhead miscellaneous parts", :name_es => "Overhead miscellaneous parts", :parent_id => manufacturing_result.id, :check_graphic => false, :has_checkbox => true)
           overhead_manufacturing_result.save
        end


          # USE
         if !power_supply_result
            power_supply_result = Result.find_by_product_result_id_and_name_en_and_parent_id(@product_result.id, "Power supply", use_result.id)
            if power_supply_result
              power_supply_result.name_en = 'Power consumption'
              power_supply_result.name_es = 'Power consumption'
              power_supply_result.name_ca = 'Power consumption'
              power_supply_result.save
            end
          end
        if !power_other_result
          power_other_result = Result.new(:product_result_id => @product_result.id, :name_en => "Other", :name_ca => "Other", :name_es => "Other", :parent_id => power_supply_result.id, :check_graphic => false, :has_checkbox => true)
          power_other_result.save
        end
      end


      # COMMON DATA
      manufacturing_datas =  @product.manufacturing_datas
      families = Family.find_all_by_stage("Manufacturing").sort_by{ |k| k['name'] }
      family_results = Array.new
      families.each_with_index do |family, index|
        family_results << Result.find_by_product_result_id_and_name_en(@product_result.id, family.name)
      end




      packaging_distributions = @product.packaging_distributions
      transport_distributions = @product.transport_distributions
      consumption_uses = @product.consumption_uses
      vehicle = Vehicle.find_by_name("Delivery van")
      c155 = 0
      if @product.end_of_life.collection_rate
        c155 = @product.end_of_life.collection_rate
      end
      component_lifetime = 0
      if @product.scenario
        component_lifetime = @product.scenario.use_lifetime
      end
      ## AVERAGE TECHNICAL DEFAULT
      average_technical_lifetime = calculate_average_technical_lifetime(@product)

      #     average_technical_lifetime = average_technical_lifetime / 12;
      if result_type == 'year'
        divisor = average_technical_lifetime
      end
      all_result_values = []

      @product.indicators.each do |indicator|
        total = 0

        manufacturing = 0

        distribution = 0
        packaging = 0
        transport = 0

        use = 0
        power_supply = 0
        replacement = 0
        spare_parts = 0
        use_transport = 0

        end_of_life = 0
        reuse = 0
        recycling = 0





        ## MANUFACTURING
        result_values = []

        families.each_with_index do |family, index|
          subtotal = 0
          family_result = family_results[index]

          # family_result = Result.find_by_product_result_id_and_name_en(@product_result.id, family.name)
          manufacturing_datas.each do |manufacturing_data|
            if manufacturing_data.family.id.to_s == family.id.to_s

              excel_value = get_excel_value("MANUFACTURING", indicator, manufacturing_data.material)
              overhead_cutoffs = 0
              component_age = 0
              component_total_lifetime = 0
              overhead_cutoffs_stamped = 0
              overhead_milled = 0



              quantity = manufacturing_data.quantity
              if manufacturing_data.overhead_cutoffs
                overhead_cutoffs = manufacturing_data.overhead_cutoffs
              end
              if !manufacturing_data.material
                if indicator.abbr == 'CF'
                  excel_value = manufacturing_data.user_global_warming
                else
                  excel_value = 0
                end
              end
              if manufacturing_data.component_age
                component_age = manufacturing_data.component_age
              end
              if manufacturing_data.component_total_lifetime
                component_total_lifetime = manufacturing_data.component_total_lifetime
              else
                component_total_lifetime = average_technical_lifetime + component_age
              end
              if manufacturing_data.overhead_cutoffs_stamped
                overhead_cutoffs_stamped = manufacturing_data.overhead_cutoffs_stamped
              end
              if manufacturing_data.overhead_milled
                overhead_milled = manufacturing_data.overhead_milled
              end
              value = 0

              if manufacturing_data.material
                material_name = manufacturing_data.material.name
              else
                material_name = manufacturing_data.material_user_name
              end

              if material_name == 'steel' || material_name == 'aluminium'
                value = quantity + quantity * overhead_cutoffs_stamped / 100 + quantity * overhead_milled / 100
              else
                value = quantity + quantity * overhead_cutoffs / 100
              end

              if !excel_value
                excel_value = 0
              end
#                     =(C81*KEPIs_LCAtogo!BB10+KEPIs_LCAtogo!BA10)*(R81-O81)/R81

              if manufacturing_data.family.name == 'Power supply' && indicator.abbr == 'CF'
                value = (value * excel_value + 0.7869)* (component_total_lifetime - component_age)/component_total_lifetime
              else
                if manufacturing_data.family.name == 'Storage' && indicator.abbr == 'CF' && manufacturing_data.material.name.include?("HDD")
                  # HDD test
                  value = excel_value + 0.833 * value * (component_total_lifetime - component_age)/component_total_lifetime
                else
                  value = value * excel_value * (component_total_lifetime - component_age)/component_total_lifetime
                end
              end

              material_result = Result.find_by_product_result_id_and_name_en_and_parent_id(@product_result.id, material_name, family_result.id)
              if !material_result
                material_result = Result.new(:product_result_id => @product_result.id, :name_en => material_name, :name_ca => material_name, :name_es => material_name, :parent_id => family_result.id, :check_graphic => true)
                material_result.save
              end
              result_values << ResultValue.new(:result_id => material_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
              subtotal += value
            end
            #end
          end
          logger.info "FAMILY --> " + family.name
          logger.info "Adding result value to queue"
          result_values << ResultValue.new(:result_id => family_result.id, :indicator_id => indicator.id, :value => subtotal, :percentage => 0)
          logger.info "Added result value to queue"
          manufacturing += subtotal
        end

        overhead = manufacturing * @product.overhead_miscellaneous / 100
        result_values << ResultValue.new(:result_id => overhead_manufacturing_result.id, :indicator_id => indicator.id, :value => overhead, :percentage => 0)

        manufacturing += overhead



        ## DISTRIBUTION
        packaging_distributions.each do |packaging_distribution|
          excel_value = get_excel_value("DISTRIBUTION", indicator, packaging_distribution.packaging)
          packaging += packaging_distribution.quantity * excel_value
        end
        result_values << ResultValue.new(:result_id => packaging_result.id, :indicator_id => indicator.id, :value => packaging, :percentage => 0)

        transport_distributions.each do |transport_distribution|
          excel_value = get_excel_value("DISTRIBUTION", indicator, transport_distribution.vehicle)
          transport += transport_distribution.distance *  (transport_distribution.quantity / 1000.to_f).to_f * excel_value
        end
        result_values << ResultValue.new(:result_id => transport_result.id, :indicator_id => indicator.id, :value => transport, :percentage => 0)
        distribution = packaging + transport


        ## USE
        energy_modes = EnergyMode.all
        energy_modes.each do |energy_mode|
          sub_use_result = Result.find_by_product_result_id_and_name_en(@product_result.id, energy_mode.name)
          subtotal = 0
          if indicator.abbr == 'CF'
            consumption_uses.each do |consumption_use|
              if consumption_use.energy_mode && consumption_use.energy_mode.id == energy_mode.id
                subtotal += consumption_use.consumption * consumption_use.energy_type.consumption * (consumption_use.time_mode / 100).to_f * average_technical_lifetime * (8760.to_f/1000).to_f
              end
            end
          end
          logger.info "Energy mode --> " + energy_mode.name
          result_values << ResultValue.new(:result_id => sub_use_result.id, :indicator_id => indicator.id, :value => subtotal, :percentage => 0)
          power_supply += subtotal
        end

        other_subtotal = 0
        if indicator.abbr == 'CF'
          consumption_uses.each do |consumption_use|
            if !consumption_use.energy_mode
              if consumption_use.energy_type
                other_subtotal += consumption_use.consumption * consumption_use.energy_type.consumption * (consumption_use.time_mode / 100).to_f * average_technical_lifetime * (8760.to_f/1000).to_f
              end
            end
          end
          power_supply += other_subtotal
        end
        result_values << ResultValue.new(:result_id => power_other_result.id, :indicator_id => indicator.id, :value => other_subtotal, :percentage => 0)

        result_values << ResultValue.new(:result_id => power_supply_result.id, :indicator_id => indicator.id, :value => power_supply, :percentage => 0)


        # Delivery van

        excel_value = get_excel_value("DISTRIBUTION", indicator, vehicle)
        @product.transport_repair_datas.each do |transport_repair_data|
          use_transport += transport_repair_data.distance * (transport_repair_data.amount / 1000.to_f).to_f * excel_value
        end
        result_values << ResultValue.new(:result_id => use_transport_result.id, :indicator_id => indicator.id, :value => use_transport, :percentage => 0)


        ## RECYCLING


        reuse_manufacturing = 0
        reuse_replacement = 0
        manufacturing_datas.each do |manufacturing_data|
          overhead_cutoffs = (manufacturing_data.overhead_cutoffs.blank?)?0:manufacturing_data.overhead_cutoffs
          overhead_cutoffs_stamped = (manufacturing_data.overhead_cutoffs_stamped.blank?)?0:manufacturing_data.overhead_cutoffs_stamped
          overhead_milled = (manufacturing_data.overhead_milled.blank?)?0:manufacturing_data.overhead_milled

          ########
          ## SPARE PARTS
          ########
          repair_data = RepairData.find_by_manufacturing_data_id(manufacturing_data.id)

          if manufacturing_data.family.name != 'Housing & internal structural elements'
            excel_value = get_excel_value("MANUFACTURING", indicator, manufacturing_data.material)

            overhead = 0
            logger.info "SPARE PARTS manufacturing_data --> " + manufacturing_data.id.to_s
            if repair_data && repair_data.upgrade_year && !repair_data.upgrade_year.blank?
              logger.info "SPARE PARTS quantity --> " + manufacturing_data.quantity.to_s
              logger.info "SPARE PARTS excel_value --> " + excel_value.to_s

              if repair_data.overheads_cut_offs
                overhead = repair_data.overheads_cut_offs
              else

              end
              spare_parts += manufacturing_data.quantity * excel_value * (1 + overhead / 100)
            end
          end

          ########
          ## END SPARE PARTS
          ########
          ########
          ## REUSE
          ########
          m226 = 0
          component_total_lifetime = 0

          c180 = (manufacturing_data.contained_data.blank?)?0:manufacturing_data.contained_data
          p180 = (manufacturing_data.anticipated_data.blank?)?0:manufacturing_data.anticipated_data
          c226 = (manufacturing_data.repair_contained_data.blank?)?0:manufacturing_data.repair_contained_data
          p226 = (manufacturing_data.repair_anticipated_data.blank?)?0:manufacturing_data.repair_anticipated_data
          component_age = (manufacturing_data.component_age.blank?)?0:manufacturing_data.component_age
          m226 = average_technical_lifetime
          if manufacturing_data.repair_data && !manufacturing_data.repair_data.upgrade_year.blank?
            m226 = m226 - manufacturing_data.repair_data.upgrade_year
          end
          component_total_lifetime = component_age + average_technical_lifetime
          # REUSE - MANUFACTURING

          if manufacturing_data.material
            excel_value = get_excel_value("MANUFACTURING", indicator, manufacturing_data.material)
          else
            excel_value = manufacturing_data.user_global_warming
          end

          component_total_lifetime = 0

          value = 0
          quantity = manufacturing_data.quantity
          if repair_data
            quantity += repair_data.upgrade_year
          end

          material_name = ''
          if manufacturing_data.material
            material_name = manufacturing_data.material.name
          else
            material_name = manufacturing_data.material_user_name
          end
          if manufacturing_data.component_total_lifetime
            component_total_lifetime = manufacturing_data.component_total_lifetime
          else
            component_total_lifetime = average_technical_lifetime + component_age
          end

          if !excel_value
            excel_value = 0
          end

          if material_name == 'steel' || material_name == 'aluminium'
            value = quantity + quantity * overhead_cutoffs_stamped / 100 + quantity * overhead_milled / 100
          else
            value = quantity + quantity * overhead_cutoffs / 100
          end

          if manufacturing_data.family.name == 'Power supply' && indicator.abbr == 'CF'
            value = (value * excel_value + 0.7869)* (component_total_lifetime - component_age)/component_total_lifetime
          else
            if manufacturing_data.family.name == 'Storage' && indicator.abbr == 'CF' && manufacturing_data.material.name.include?("HDD")
              value = excel_value + 0.833 * value * (component_total_lifetime - component_age)/component_total_lifetime
            else
              value = value * excel_value * (component_total_lifetime - component_age)/component_total_lifetime
            end
          end

          w21 = manufacturing_data.quantity

          logger.info "excel_value --> " + excel_value.to_s
          logger.info "p180 --> " + p180.to_s
          logger.info "c180 --> " + c180.to_s
          logger.info "p226 --> " + p226.to_s
          logger.info "m226 --> " + m226.to_s
          logger.info "c226 --> " + c226.to_s
          logger.info "w21 --> " + (w21 * excel_value).to_s
          logger.info "component_total_lifetime --> " + component_total_lifetime.to_s

          reuse_manufacturing += -excel_value * w21 * p180/(component_total_lifetime + p180)*c180/100

          w22 = (repair_data.blank?)?0:repair_data.upgrade_year

          if manufacturing_data.material && manufacturing_data.family.name == 'Display'
            w22 = w22 * manufacturing_data.quantity
          end
          logger.info "w22 --> " + w22.to_s
          if p226 != 0 && c226/100.0 != 0
            reuse_replacement += -excel_value * w22 * p226/(m226 + p226)*c226/100.to_f
          end


          ########
          ## END REUSE
          ########
          ########
          ## RECYCLING
          ########
          if manufacturing_data.material
            recycling_data = RecyclingData.find_by_product_id_and_material_id(@product.id, manufacturing_data.material.id)
          else
            recycling_data = RecyclingData.find_by_product_id_and_family_id(@product.id, manufacturing_data.family.id)
            if !recycling_data
              recycling_data = RecyclingData.find_by_product_id_and_manufacturing_data_id(@product.id, manufacturing_data.id)
            end
          end
          if recycling_data
            e158 = recycling_data.value
          else
            e158 = get_default_recycling manufacturing_data.family,manufacturing_data.material
          end



          ## Chapuza SSD
          if manufacturing_data.family.name == 'Storage'
            if !manufacturing_data.material.name.include?("HDD")
              if @product.ssd_storage
                e158 = @product.ssd_storage
              else
                e158 = 30
              end
            end
          end


          if manufacturing_data.material
            r158 = get_credit_production manufacturing_data.family,manufacturing_data.material
            excel_value = get_excel_value("MANUFACTURING", indicator, manufacturing_data.material)
          else
            r158 = 0
            excel_value = manufacturing_data.user_global_warming
          end


          ## Chapuza SSD
          if manufacturing_data.family.name == 'Storage'
            if !manufacturing_data.material.name.include?("HDD")
              r158 = 10
            end
          end



          component_total_lifetime = 0

          value = 0
          quantity = manufacturing_data.quantity
          if repair_data
            quantity += repair_data.upgrade_year
          end

          if manufacturing_data.component_total_lifetime
            component_total_lifetime = manufacturing_data.component_total_lifetime
          else
            component_total_lifetime = average_technical_lifetime + component_age
          end

          if !excel_value
            excel_value = 0
          end

          if material_name == 'steel' || material_name == 'aluminium'
            value = quantity + quantity * overhead_cutoffs_stamped / 100 + quantity * overhead_milled / 100
          else
            value = quantity + quantity * overhead_cutoffs / 100
          end

          if manufacturing_data.family.name == 'Power supply' && indicator.abbr == 'CF'
            value = (value * excel_value + 0.7869)* (component_total_lifetime - component_age)/component_total_lifetime
          else
            if manufacturing_data.family.name == 'Storage' && indicator.abbr == 'CF' && manufacturing_data.material.name.include?("HDD")
              value = excel_value + 0.833 * value * (component_total_lifetime - component_age)/component_total_lifetime
            else
              value = value * excel_value * (component_total_lifetime - component_age)/component_total_lifetime
            end
          end

          w20 = value
          if indicator.abbr != 'CF'
            r158 = 100
          end
          logger.info "c155 --> " + c155.to_s
          logger.info "e158 --> " + e158.to_s
          logger.info "r158 --> " + r158.to_s
          logger.info "w20 --> " + w20.to_s
          if c155 != 0 && e158 != 0 && r158 != 0
            value = -(c155.to_f / 100.to_f) * (e158.to_f / 100.to_f) * (r158.to_f / 100.to_f) * w20
            factor = get_factor indicator, manufacturing_data.family

            material_result = Result.find_by_product_result_id_and_name_en_and_parent_id(@product_result.id, manufacturing_data.family.name, recycling_result.id)
            if !material_result
              material_result = Result.new(:product_result_id => @product_result.id, :name_en => manufacturing_data.family.name, :name_ca => manufacturing_data.family.name, :name_es => manufacturing_data.family.name, :parent_id => recycling_result.id, :check_graphic => true)
              material_result.save
            end
            result_value = ResultValue.find_by_result_id_and_indicator_id(material_result.id, indicator.id)
            if !result_value
              result_value = ResultValue.new(:result_id => material_result.id, :indicator_id => indicator.id, :value => 0, :percentage => 0)
            end
            result_value.value = result_value.value + (value * factor)
            logger.info "factor --> " + factor.to_s

            result_values << result_value

            recycling += (value * factor)
          end


        end
        result_values << ResultValue.new(:result_id => spare_parts_result.id, :indicator_id => indicator.id, :value => spare_parts, :percentage => 0)

        replacement = use_transport + spare_parts

        result_values << ResultValue.new(:result_id => replacement_result.id, :indicator_id => indicator.id, :value => replacement, :percentage => 0)

        use = power_supply + replacement

        reuse = reuse_manufacturing + reuse_replacement
        result_values << ResultValue.new(:result_id => reuse_manufacturing_result.id, :indicator_id => indicator.id, :value => reuse_manufacturing, :percentage => 0)
        result_values << ResultValue.new(:result_id => reuse_replacement_result.id, :indicator_id => indicator.id, :value => reuse_replacement, :percentage => 0)
        result_values << ResultValue.new(:result_id => reuse_result.id, :indicator_id => indicator.id, :value => reuse, :percentage => 0)
        result_values << ResultValue.new(:result_id => recycling_result.id, :indicator_id => indicator.id, :value => recycling, :percentage => 0)

        end_of_life = reuse + recycling

        # total
        total = manufacturing + distribution + use + end_of_life
        result_values << ResultValue.new(:result_id => root_result.id, :indicator_id => indicator.id, :value => total, :percentage => 100)
        result_values << ResultValue.new(:result_id => manufacturing_result.id, :indicator_id => indicator.id, :value => manufacturing, :percentage => 0)
        result_values << ResultValue.new(:result_id => distribution_result.id, :indicator_id => indicator.id, :value => distribution, :percentage => 0)
        result_values << ResultValue.new(:result_id => use_result.id, :indicator_id => indicator.id, :value => use, :percentage => 0)
        result_values << ResultValue.new(:result_id => endoflife_result.id, :indicator_id => indicator.id, :value => end_of_life, :percentage => 0)


        # check & percentages
        result_values.each do |result_value|
          result_value.value = result_value.value / divisor
          if total > 0
            result_value.percentage = (result_value.value / total) * 100
          else
            result_value.percentage = 0
          end
          if !result_value.value || result_value.value.blank? || result_value.value.nan?
            result_value.value = 0
          end
        end

        @main_result = root_result
        @max = total
        @limit1 = @max * 0.25
        @limit2 = @max * 0.50
        @limit3 = @max * 0.75

      end

      #ResultValue.import all_result_values


      time_end = Time.new
      @time_consumed = (time_end -time_init).to_s
      logger.info "Time consumed --> " + (time_end -time_init).to_s
      @divisor_to_graph = calculate_average_technical_lifetime(@product)


    else
      respond_to do |format|
        format.html { redirect_to(booklabels_url) }
        format.xml { head :ok }
      end
    end
  end



  def do_comparison
    if @product
      @step = 3
      @line_charts = Array.new
      @datas = Array.new
      @datas_absolute = Array.new
      @datas_production = Array.new
      @datas_use = Array.new

      @labels = Array.new
      @labels_absolute = Array.new
      @labels_production = Array.new
      @labels_use = Array.new

      @colors = Array.new
      @colors_absolute = Array.new
      @colors_production = Array.new
      @colors_use = Array.new
      coder = HTMLEntities.new

      @indicators_checked = Array.new
      @products_checked = Array.new

      @compare_values_1 = Array.new
      @compare_values_2 = Array.new
      @compare_titles = Array.new
      @compare_products = @product.name
      @compare_max = 0
      @compare_min = 0

      colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00"]

      @compare_arrays_1 = Array.new
      @compare_arrays_2 = Array.new

      @result_type = params[:result_type]

      @average_lifetimes = Array.new
      if @result_type == 'year'
        ## AVERAGE TECHNICAL DEFAULT
        average_technical_lifetime = calculate_average_technical_lifetime(@product)
        divisor = average_technical_lifetime
      else
        divisor = 1
      end
      @average_lifetimes << divisor

      params.each do |key, value|
        if key.match(/^compare_product_/)
          product_id = key[16..key.length]
          product = Product.find(product_id)
          @products_checked << product
          @compare_products += "|" + product.name
          if @result_type == 'year'
            ## AVERAGE TECHNICAL DEFAULT
            average_technical_lifetime = calculate_average_technical_lifetime(product)
            divisor = average_technical_lifetime
          else
            divisor = 1
          end
          @average_lifetimes << divisor
        end
      end

      @phases_selected = 0
      if params[:total]
        @compare_titles << "TOTAL"
        @total_check = true
        @total_array = Array.new
        @phases_selected += 1
      end

      if params[:manufacturing]
        @compare_titles << "MANUFACTURING"
        @manufacturing_check = true
        @manufacturing_array = Array.new
        @phases_selected += 1
      end

      if params[:distribution]
        @compare_titles << "DISTRIBUTION"
        @distribution_check = true
        @distribution_array = Array.new
        @phases_selected += 1
      end

      if params[:use]
        @compare_titles << "USE"
        @use_check = true
        @use_array = Array.new
        @phases_selected += 1
      end

      if params[:end_of_life]
        @compare_titles << "END-OF-LIFE"
        @end_of_life_check = true
        @end_of_life_array = Array.new
        @phases_selected += 1
      end

      @compare_titles_to_array = '|'
      @compare_titles.reverse.each_with_index do |compare_title, index|
        @compare_titles_to_array += compare_title
        if index != @compare_titles.size
          @compare_titles_to_array += '|'
        end
      end

      @colors_array = colors[0]
      @products_checked.reverse.each_with_index do |product, index|
        @colors_array += ',' + colors[index + 1]
      end

      @values_array = Array.new
      #  indicator = @product.indicators.first
      @product.indicators.sort_by{ |k| k['id'] }.each do |indicator|
        indicator_ok = false
        params.each do |key, value|
          if key == 'indicator_' + indicator.id.to_s
            indicator_ok = true
            @indicators_checked << indicator
          end
        end
        if indicator_ok
          if indicator.name == 'Carbon footprint' || indicator.name == 'Copper' || indicator.name == 'Aluminium' ||indicator.name == 'Cobalt' || indicator.name == 'Steel'
            multiplier = 1
          else
            multiplier = 1000
          end

          values_string = ''
          @total_array = Array.new
          @manufacturing_array = Array.new
          @distribution_array = Array.new
          @use_array = Array.new
          @end_of_life_array = Array.new

          if @total_check
            result_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', @product.product_result.id]).first
            if result_total
              result_total_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
              if result_total_value
                @total_array << (result_total_value.value * multiplier / @average_lifetimes[0])
              else
                @total_array << 0
              end
            else
              @total_array << 0
            end

            @products_checked.each_with_index do |product_to_compare, index|
              if product_to_compare.product_result
                result_total_compare = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', product_to_compare.product_result.id]).first
                if result_total_compare
                  result_total_compare_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total_compare.id]).first
                  @total_array << (result_total_compare_value ? result_total_compare_value.value * multiplier / @average_lifetimes[index + 1] : 0)
                else
                  @total_array << 0
                end
              end
            end
          end


          if @manufacturing_check
            result_manufacturing = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'MANUFACTURING', @product.product_result.id]).first
            if result_manufacturing
              result_manufacturing_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_manufacturing.id]).first
              @manufacturing_array << (result_manufacturing_value ? result_manufacturing_value.value * multiplier  / @average_lifetimes[0] : 0)
            else
              @manufacturing_array << 0
            end
            @products_checked.each_with_index do |product_to_compare, index|
              if product_to_compare.product_result
                result_total_compare = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'MANUFACTURING', product_to_compare.product_result.id]).first
                if result_total_compare
                  result_total_compare_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total_compare.id]).first
                  @manufacturing_array << (result_total_compare_value ? result_total_compare_value.value * multiplier / @average_lifetimes[index + 1] : 0)
                else
                  @manufacturing_array << 0
                end
              end
            end
          end



          if @distribution_check
            result_distribution = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'DISTRIBUTION', @product.product_result.id]).first
            if result_distribution
              result_distribution_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_distribution.id]).first
              @distribution_array << (result_distribution_value ? result_distribution_value.value * multiplier / @average_lifetimes[0] : 0)
            else
              @distribution_array << 0
            end
            @products_checked.each_with_index do |product_to_compare, index|
              if product_to_compare.product_result
                result_total_compare = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'DISTRIBUTION', product_to_compare.product_result.id]).first
                if result_total_compare
                  result_total_compare_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total_compare.id]).first
                  @distribution_array << (result_total_compare_value ? result_total_compare_value.value * multiplier / @average_lifetimes[index + 1] : 0)
                else
                  @distribution_array << 0
                end
              end
            end
          end


          if @use_check
            result_use = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'USE', @product.product_result.id]).first
            if result_use
              result_use_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_use.id]).first
              @use_array << (result_use_value ? result_use_value.value * multiplier / @average_lifetimes[0] : 0)
            else
              @use_array << 0
            end
            @products_checked.each_with_index do |product_to_compare, index|
              if product_to_compare.product_result
                result_total_compare = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'USE', product_to_compare.product_result.id]).first
                if result_total_compare
                  result_total_compare_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total_compare.id]).first
                  @use_array << (result_total_compare_value ? result_total_compare_value.value * multiplier / @average_lifetimes[index + 1] : 0)
                else
                  @use_array << 0
                end
              end
            end
          end

          if @end_of_life_check
            result_endoflife = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'END-OF-LIFE', @product.product_result.id]).first
            if result_endoflife
              result_endoflife_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_endoflife.id]).first
              @end_of_life_array << (result_endoflife_value ? result_endoflife_value.value * multiplier / @average_lifetimes[0] : 0)
            else
              @end_of_life_array << 0
            end
            @products_checked.each_with_index do |product_to_compare, index|
              if product_to_compare.product_result
                result_total_compare = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'END-OF-LIFE', product_to_compare.product_result.id]).first
                if result_total_compare
                  result_total_compare_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total_compare.id]).first
                  @end_of_life_array << (result_total_compare_value ? result_total_compare_value.value * multiplier / @average_lifetimes[index + 1] : 0)
                else
                  @end_of_life_array << 0
                end
              end
            end
          end


          # END INDICATOR
          values_string_all_products = ''
          values_string = ''
          if @total_check
            if values_string != ''
              values_string += ','
            end
            values_string += @total_array[0].to_s
          end
          if @manufacturing_check
            if values_string != ''
              values_string += ','
            end
            values_string += @manufacturing_array[0].to_s
          end
          if @distribution_check
            if values_string != ''
              values_string += ','
            end
            values_string += @distribution_array[0].to_s
          end
          if @use_check
            if values_string != ''
              values_string += ','
            end
            values_string += @use_array[0].to_s
          end
          if @end_of_life_check
            if values_string != ''
              values_string += ','
            end
            values_string += @end_of_life_array[0].to_s
          end
          values_string += '|'
          values_string_all_products += values_string


          @products_checked.each_with_index do |product_to_compare, index|
            values_string = ''

            if @total_check
              if values_string != ''
                values_string += ','
              end
              values_string += @total_array[index + 1].to_s
            end
            if @manufacturing_check
              if values_string != ''
                values_string += ','
              end
              values_string += @manufacturing_array[index + 1].to_s
            end
            if @distribution_check
              if values_string != ''
                values_string += ','
              end
              values_string += @distribution_array[index + 1].to_s
            end
            if @use_check
              if values_string != ''
                values_string += ','
              end
              values_string += @use_array[index + 1].to_s
            end
            if @end_of_life_check
              if values_string != ''
                values_string += ','
              end
              values_string += @end_of_life_array[index + 1].to_s
            end

            if index != @products_checked.size - 1
              values_string += '|'
            end
            values_string_all_products += values_string
          end

          @values_array << values_string_all_products
        end
      end



      @product.indicators.each do |indicator|
        data = Array.new
        data_absolute = Array.new

        result_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', @product.product_result.id]).first
        result_total_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
        total = result_total_value.value

        data << 100
        if indicator.name == 'Carbon footprint' || indicator.name == 'Copper' || indicator.name == 'Aluminium' ||indicator.name == 'Cobalt' || indicator.name == 'Steel'
          data_absolute << total
        else
          data_absolute << total * 1000
        end
        @labels << _('TOTAL')
        @labels_absolute << _('TOTAL')
        @colors << TOTAL_COLOR
        @colors_absolute  << TOTAL_COLOR


        logger.info "TOTAL --> " + total.to_s
        result_total.children.each do |result|
          if result.check_graphic
            result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result.id]).first
            if !result_value || total == 0
              value = 0
              value_absolute = 0
            else
              value = ((result_value.value / total) * 100).to_i
              value_absolute = result_value.value
            end
            logger.info "RESULT VALUE --> " + value.to_s
            data << value
            if indicator.name == 'Carbon footprint' || indicator.name == 'Copper' || indicator.name == 'Aluminium' ||indicator.name == 'Cobalt' || indicator.name == 'Steel'
              data_absolute << value_absolute
            else
              data_absolute << value_absolute * 1000
            end
            @labels <<  coder.decode(truncate(result.name_ca.html_safe, :length => TRUNCATE))
            @labels_absolute <<  coder.decode(truncate(result.name_ca.html_safe, :length => TRUNCATE))
            @colors << get_color(result.name_en, result.parent.name_en)
            @colors_absolute << get_color(result.name_ca, result.parent.name_en)

            result.children.each do |result|
              if result.check_graphic
                result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result.id]).first
                if !result_value || total == 0
                  value = 0
                  value_absolute = 0
                else
                  value = ((result_value.value / total) * 100).to_i
                  value_absolute = result_value.value
                end
                logger.info "RESULT VALUE CHILDREN --> " + value.to_s
                data << value
                if indicator.name == 'Carbon footprint' || indicator.name == 'Copper' || indicator.name == 'Aluminium' ||indicator.name == 'Cobalt' || indicator.name == 'Steel'
                  data_absolute << value_absolute
                else
                  data_absolute << value_absolute * 1000
                end
                @labels <<  coder.decode(truncate(result.name_ca.html_safe.gsub('&', '%26'), :length => TRUNCATE))
                @labels_absolute <<  coder.decode(truncate(result.name_ca.html_safe.gsub('&', '%26'), :length => TRUNCATE))
                @colors << get_color(result.name_en, result.parent.name_en)
                @colors_absolute << get_color(result.name_en, result.parent.name_en)
              end
            end



          end
        end
        if data.size > 0
          @datas << data
        end
        if data_absolute.size > 0
          @datas_absolute << data_absolute
        end
      end

      @combineds = Array.new
      @datas.each do |data|
        one_item = Array.new
        data.each_with_index do |item, index|
          temp = Array.new
          temp << item
          temp << @labels[index].to_s
          temp << @colors[index].to_s
          one_item << temp
        end
        @combineds << one_item
      end

      @combineds_absolute = Array.new
      @datas_absolute.each do |data|
        one_item = Array.new
        data.each_with_index do |item, index|
          temp = Array.new
          temp << item
          temp << @labels_absolute[index].to_s
          temp << @colors_absolute[index].to_s
          one_item << temp
        end
        @combineds_absolute << one_item
      end

      @sort = 'no'


      ## END FASES




    else
      respond_to do |format|
        format.html { redirect_to(products_url) }
        format.xml { head :ok }
      end
    end
  end



  def compare

    @product = Product.find(params[:product_id])

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
    add_breadcrumb _("Comparison").html_safe, product_result_url(@product)

    generate_results("lifecycle")

    @step = 3
    begin
      @product_to_compare = Product.find(params[:compareTo])
      @product = @product_to_compare
      generate_results("lifecycle")
    rescue
    end
    @product = Product.find(params[:product_id])

    do_comparison

  end



  def get_factor indicator, family
    factor = 1
    if indicator.name == 'Copper' || indicator.name == 'Steel' || indicator.name == 'Aluminium'
      factor = 0.95
    end
    if indicator.name == 'Cobalt'
      factor = 0.96
    end
    if indicator.name == 'Gold' || indicator.name == 'other Rare Earth metals (Yttrium, Cerbium, ...)'
      factor = 0.98
    end
    if family.name == 'Storage'
      if indicator.name == 'Gold' || indicator.name == 'Aluminium' || indicator.name == 'Neodymium' || indicator.name == 'Tantalum' || indicator.name == 'Platinum, Ruthenium, Palladium'
        factor = 0
      end
    end
    return factor
  end

  def get_default_recycling family,material
    value = 0
    if material
      if material.name == 'wood (oak)'
        value = 0
      end
      if material.name == 'steel'
        value = 80
      end
      if material.name == 'aluminium'
        value = 80
      end
      if material.name == 'PC/ABS'
        value = 0
      end
    end
    if family.name == 'Printed Circuit Board Assemblies'
      value = 30
    end
    if family.name == 'Processor' || family.name == 'Memory'
      value = 30
    end
    if family.name == 'Storage'
      value = 50
    end
    if family.name == 'Battery'
      value = 80
    end
    if family.name == 'Cables'
      value = 30
    end
    if family.name == 'Power supply'
      value = 30
    end

    return value
  end

  def get_credit_production family,material
    credit = 0

    if material
      if material.name == 'wood (oak)'
        credit = 100
      end
      if material.name == 'steel'
        credit = 74
      end
      if material.name == 'aluminium'
        credit = 95
      end
      if material.name == 'PC/ABS'
        credit = 30
      end
    end
    if family.name == 'Printed Circuit Board Assemblies'
      credit = 10
    end
    if family.name == 'Processor' || family.name == 'Memory'
      credit = 10
    end
    if family.name == 'Storage'
      credit = 50
    end
    if family.name == 'Battery'
      credit = 10
    end
    if family.name == 'Cables'
      credit = 65
    end
    if family.name == 'Power supply'
      credit = 20
    end

    logger.info "material credit --> " + credit.to_s
    return credit
  end

  def get_excel_value phase, indicator, item
    if item
      excel_value = ExcelValue.find_by_phase_and_indicator_id_and_name(phase, indicator.id, item.name)
      if excel_value
        return excel_value.value
      end
    end
    return 0
  end

  ## TODO --> Relacionar excel_value -> material -> family
  def material_value_from_excel material_name
    if material_name
      logger.info "Checking material --> " + material_name
      excel_value = ExcelValue.find(:all, :conditions => ["name = ?", material_name])
      if excel_value.first
        logger.info "Return value --> " + excel_value.first.value.to_s
        excel_value.first.value
      else
        0
      end
    else
      0
    end
  end

  def new_material_value_from_excel material, phase
    if material
      logger.info "Checking material --> " + material.name
      excel_value = ExcelValue.find(:all, :conditions => ["material_id = ? and phase = ?", material.id, phase])
      if excel_value.first
        logger.info "Return value --> " + excel_value.first.value.to_s
        excel_value.first.value
      else
        0
      end
    else
      0
    end
  end

  def display_value_from_excel
    logger.info "Checking material --> Display"
    excel_value = ExcelValue.find(:all, :conditions => ["name = ?", 'Display'])
    if excel_value.first
      logger.info "Return value --> " + excel_value.first.value.to_s
      excel_value.first.value
    else
      0
    end
  end


  def end_of_life_value_from_excel material_name
    if material_name
      excel_value = ExcelValue.find(:all, :conditions => ["name = ? and phase = 'END-OF LIFE'", material_name])
      if excel_value.first
        excel_value.first.value
      else
        0
      end
    else
      0
    end
  end


  # GET /product_results/new
  # GET /product_results/new.xml
  def new
    @product_result = ProductResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_result }
    end
  end

  # GET /product_results/1/edit
  def edit
    @product_result = ProductResult.find(params[:id])
  end

  # POST /product_results
  # POST /product_results.xml
  def create
    @product_result = ProductResult.new(params[:product_result])

    respond_to do |format|
      if @product_result.save
        format.html { redirect_to(@product_result, :notice => 'Product result was successfully created.') }
        format.xml  { render :xml => @product_result, :status => :created, :location => @product_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_results/1
  # PUT /product_results/1.xml
  def update
    @product_result = ProductResult.find(params[:id])

    respond_to do |format|
      if @product_result.update_attributes(params[:product_result])
        format.html { redirect_to(@product_result, :notice => 'Product result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_results/1
  # DELETE /product_results/1.xml
  def destroy
    @product_result = ProductResult.find(params[:id])
    @product_result.destroy

    respond_to do |format|
      format.html { redirect_to(product_results_url) }
      format.xml  { head :ok }
    end
  end






  def generate_worksheet (first_node, node, product, worksheet, col, indicators, format_bold, format_bold_left, format_bold_right, format_color_1, format_color_2, format_color_3, format_color_4, limit1, limit2, limit3, divisor)
    coder = HTMLEntities.new

    node.children.each do |child|
      col = col + 1
      if I18n.locale == :en
        name = child.name_en
      end
      if I18n.locale == :es
        name = child.name_es
      end
      if I18n.locale == :ca
        name = child.name_ca
      end
      # worksheet.set_column(col, col, coder.decode(name).length + 10)
      if node == first_node
        worksheet.write(col, 0, coder.decode(name), format_bold_left)
      else
        if node.parent == first_node
          worksheet.write(col, 0, "- " + coder.decode(name), format_bold_left)
        else
          worksheet.write(col, 0, coder.decode(name), format_bold_right)
        end
      end
      indicators.each_with_index do |indicator, index|
        result_value = ResultValue.find(:all, :conditions => ["result_id=? and indicator_id=?", child.id, indicator.id]).first
        if result_value
          if result_value.percentage.round < limit1.to_i
            worksheet.write_number(col, index + 1, result_value.value / divisor, format_color_4)  # cell B2
          end
          if result_value.percentage.round >= limit1.to_i && result_value.percentage.round < limit2.to_i
            worksheet.write_number(col, index + 1, result_value.value / divisor, format_color_3)  # cell B2
          end
          if result_value.percentage.round >= limit2.to_i && result_value.percentage.round < limit3.to_i
            worksheet.write_number(col, index + 1, result_value.value / divisor, format_color_2)  # cell B2
          end
          if result_value.percentage.round >= limit3.to_i
            worksheet.write_number(col, index + 1, result_value.value / divisor, format_color_1)  # cell B2
          end
        else
          worksheet.write_number(col, index + 1, 0, format_color_4)  # cell B2
        end
      end
      col = generate_worksheet first_node,child, product, worksheet, col, indicators, format_bold, format_bold_left, format_bold_right, format_color_1, format_color_2, format_color_3, format_color_4, limit1, limit2, limit3, divisor
    end
    return col
  end
end
