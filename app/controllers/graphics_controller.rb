class GraphicsController < ApplicationController
   include ActionView::Helpers::TextHelper
   include ApplicationHelper
   
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

   
   
   def do_graphics
    
     @product = get_product(params[:product_id])

     add_breadcrumb _("My products").html_safe, :products_url
     add_breadcrumb @product.name, product_url(@product)
     add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
     add_breadcrumb _("Results").html_safe, product_result_url(@product)
     
     begin
        @product_to_compare = get_product(params[:compareTo])
     rescue
     end
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
       @product.indicators.each do |indicator|
         @indicators_checked << indicator 
       end


      @compare_values_1 = Array.new
      @compare_values_2 = Array.new
      @compare_titles = Array.new
      @compare_max = 0
      @compare_min = 0    

      @product.indicators.each do |indicator|
        if @product_to_compare.product_result
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
         


       
      @product.indicators.each do |indicator|
          data = Array.new
          data_absolute = Array.new
           
          result_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', @product.product_result.id]).first
          result_total_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
          total = result_total_value.value
           
          data << 100
          data_absolute << total
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
                data_absolute << value_absolute
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
                    logger.info "RESULT CHILDREN VALUE --> " + value.to_s
                    data << value
                    data_absolute << value_absolute
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
       
       @product.indicators.each do |indicator|
           data_tmp = Array.new
           names = Array.new
           overhead = 0
           results_total = Result.find(:all, :conditions => ["(name_en=? or name_en=?) and product_result_id=?", 'Materials', 'Components', @product.product_result.id])
           total = 0
           results_total.each do |result_total|
              result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
              total += result_value.value
           end
           logger.info "TOTAL --> " + total.to_s
           index = 0
           results_total.each do |result_total|           
             result_total.children.each do |result| 
               if result.check_graphic
                  result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result.id], :order => "value desc").first
                  
                  if total == 0
                     value = 0
                  else
                     value = ((result_value.value / total) * 100).to_f
                  end
              
                  logger.info "RESULT NAME --> " + result.name_en.to_s
                  logger.info "RESULT VALUE --> " + result_value.value.to_s
                  logger.info "VALUE --> " + value.to_s
                  if result.family
                    logger.info "FAMILY --> " + result.family.name.to_s
                    if !names.include?result.family.name
                      names << result.family.name
                      data_tmp << value
                      labels_production_temp <<  (coder.decode(truncate(result.family.name.html_safe, :length => TRUNCATE)))
                      colors_production_temp << color_array[index % color_array.length]
                      index = index + 1
                    else
                      index_name = names.index(result.family.name)
                      data_tmp[index_name] = data_tmp[index_name].to_f + value.to_f
                    end
                   else
                     overhead += value
                   end 
 
                              #   end
                end
             end 
           end
           

         data_tmp << overhead
         labels_production_temp << "Overhead"
         colors_production_temp << "#0000FF"         
         names <<  "Overhead"   
           
           others = 0
           data = Array.new
           data_tmp.each_with_index do |data_item,index|           
              if data_item > 0
                 logger.info "Result name 1 --> " + labels_production_temp[index].to_s
                 logger.info "Result name 2 --> " + names[index].to_s
                 logger.info "Result value --> " + data_item.to_s
                 data << data_item.to_f
                 @labels_production << (coder.decode(truncate(labels_production_temp[index].html_safe, :length => TRUNCATE) + " (" + data_item.round.to_s + "%)"))   
                 @colors_production << colors_production_temp[index]
              else  
                 others += data_item
              end
           end

           if data.size > 0
              @datas_production << data           
           end                         
         end
         
       @combineds_production = Array.new 
       @datas_production.each do |data|
          one_item = Array.new
          threshold = 0
          others = 0
          index_color = 0
          data.each_with_index do |item, index|
            if item >= threshold
              temp = Array.new
              temp << item
              temp << @labels_production[index].to_s
              temp << color_array[index_color].to_s
              one_item << temp
              index_color = index_color + 1
            else
              others += item
            end
          end

          @combineds_production << one_item
       end
         

       ## END PRODUCTION

       ## INIT USE
         
       color_array_use = Array.new
       color_array_use[0] = "#600000"
       color_array_use[1] = "#800000"
       color_array_use[2] = "#B80000"       
       color_array_use[3] = "#E80000"
         
       data = Array.new 
       index = 0
       results_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Energy Consumption', @product.product_result.id])
       total_value = results_total.first.result_value.value

       results_total.first.children.each do |result|
         value = (result.result_value.value / total_value) * 100
         data << result.result_value.value
         @labels_use <<  (coder.decode(truncate(result.name_en.html_safe, :length => TRUNCATE) + " (" + value.round.to_s + "%)"))
         @colors_use << color_array_use[index % 6]
         index = index + 1
       end

        if data.size > 0
          @datas_use << data           
        end                         
         
         
       @combineds_use = Array.new 
       @datas_use.each do |data|
          one_item = Array.new
          data.each_with_index do |item, index|
            temp = Array.new
            temp << item
            temp << @labels_use[index].to_s
            temp << @colors_use[index].to_s
            one_item << temp
          end
          @combineds_use << one_item
       end
         
         
         
       else  
        respond_to do |format|
          format.html { redirect_to(products_url) }
          format.xml { head :ok }
        end
       end    
     end 





   def generate_pdf
     pdf = Prawn::Document.new
     coder = HTMLEntities.new
     
     @product = get_product(params[:product_id])    
     
     
     
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
       @product.indicators.each do |indicator|
         @indicators_checked << indicator 
       end

       
       @product.indicators.each do |indicator|
           data = Array.new
           data_absolute = Array.new
           
           result_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', @product.product_result.id]).first
           result_total_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
           total = result_total_value.value    
           
           data << 100
           data_absolute << total
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
                data_absolute << value_absolute
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
                    data_absolute << value_absolute
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
       
     min = @combineds[0].sort_by { |x| x[0] }.collect {|x| x[0] }[0]
     max = @combineds[0].sort_by { |x| x[0] }.collect {|x| x[0] }.reverse[0]
     
     serieValues = @combineds[0].collect {|x| x[0] }
     values = ""
     serieValues.each_with_index do |value, index|
         if (index + 1) < serieValues.size
            values += value.to_s + ","
         else
            values += value.to_s
         end   
     end     
          
     seriesColors = @combineds[0].collect {|x| x[2] }
     colors = ""
     seriesColors.each_with_index do |seriesColor, index|  
        if (index + 1) < seriesColors.size      
            colors += seriesColor.to_s.gsub("#","") + "|"
        else 
            colors += seriesColor.to_s.gsub("#","")
        end   
     end     
     
     height = @labels.size * 28
     num_ticks = 0 
     i = 0
     if max
         while i < max
            i += 10
         end
     end    
       max = i
       if i > 100
          max = (i + 10)
       end
       if max < 100
          max = 100
       end
       max = 110
       if !min || min > 0
          min = 0
       else   
          modulo = min.modulo(10)
          min -= modulo
       end         
     max_min_array = ""
     min_tmp = min
     while min_tmp <= max
        max_min_array += "|" + min_tmp.to_s
        min_tmp += 10
     end
     max_min_array += "|"
     
     seriesTicks = @combineds[0].collect {|x| x[1] }.reverse
     ticks_to_array = ""
     seriesTicks.each do |tick|
         ticks_to_array += "|" + tick.to_s
     end     
     require 'open-uri'
     
     src_img1 = "http://chart.googleapis.com/chart?chf=bg,s,EBEEDB|c,s,FFFDF6&chbh=18&chts=2B4950,16,l&chxt=x,y&cht=bhg"
     src_img1 += "&chds=" + min.to_s + "," + max.to_s + "&chd=t:" + values + "&chco=" + colors
     src_img1 += "&chls=2.0&chs=600x" + height.to_s + "&chxl=0:" + max_min_array + "1:" + ticks_to_array
     src_img1 += "&chm=N*f0*%,000000,0,-1,11,,:10:&chxs=1,,11,-1,lt"

     # END IMAGE 1

     min = @combineds_absolute[0].sort_by { |x| x[0] }.collect {|x| x[0] }[0]
     max = @combineds_absolute[0].sort_by { |x| x[0] }.collect {|x| x[0] }.reverse[0]
     
     serieValues = @combineds_absolute[0].collect {|x| x[0] }
     values = ""
     serieValues.each_with_index do |value, index|
         if (index + 1) < serieValues.size
            values += value.to_s + ","
         else
            values += value.to_s
         end   
     end     
          
     seriesColors = @combineds_absolute[0].collect {|x| x[2] }
     colors = ""
     seriesColors.each_with_index do |seriesColor, index|  
        if (index + 1) < seriesColors.size      
            colors += seriesColor.to_s.gsub("#","") + "|"
        else 
            colors += seriesColor.to_s.gsub("#","")
        end   
     end     
     
     height = @labels.size * 28
       num_ticks = 0 
       i = 0
       if max
         while i < max
            i += 10
         end
     end    
       max = i
       if i > 100
          max = (i + 10)
       end
       if max < 100
          max = 100
       end
       if !min || min > 0
          min = 0
       else   
          modulo = min.modulo(10)
          min -= modulo
       end         
     max_min_array = ""
     min_tmp = min
     step = (max - min) / 10
   
     while min_tmp <= max
        max_min_array += "|" + min_tmp.to_s
        min_tmp += step
     end
     max_min_array += "|"
     
     seriesTicks = @combineds_absolute[0].collect {|x| x[1] }.reverse
     ticks_to_array = ""
     seriesTicks.each do |tick|
         ticks_to_array += "|" + tick.to_s
     end     


     src_img2 = "http://chart.googleapis.com/chart?chf=bg,s,EBEEDB|c,s,FFFDF6&chbh=18&chts=2B4950,16,l&chxt=x,y&cht=bhg"
     src_img2 += "&chds=" + min.to_s + "," + max.to_s + "&chd=t:" + values + "&chco=" + colors
     src_img2 += "&chls=2.0&chs=600x" + height.to_s + "&chxl=0:" + max_min_array + "1:" + ticks_to_array
     src_img2 += "&chm=N*f0*,000000,0,-1,11,,:10:&chxs=1,,11,-1,lt"



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
       
       @product.indicators.each do |indicator|
           data_tmp = Array.new
           names = Array.new
           overhead = 0
           results_total = Result.find(:all, :conditions => ["(name_en=? or name_en=?) and product_result_id=?", 'Materials', 'Components', @product.product_result.id])
           total = 0
           results_total.each do |result_total|
              result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
              total += result_value.value
           end
           logger.info "TOTAL --> " + total.to_s
           index = 0
           results_total.each do |result_total|           
             result_total.children.each do |result| 
               if result.check_graphic
                  result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result.id], :order => "value desc").first
                  
                  if total == 0
                     value = 0
                  else
                     value = ((result_value.value / total) * 100).to_f
                  end   
              #    if (value > 1)
              
                  logger.info "RESULT NAME --> " + result.name_en.to_s
                  logger.info "RESULT VALUE --> " + result_value.value.to_s
                  logger.info "VALUE --> " + value.to_s
                  if result.family
                    logger.info "FAMILY --> " + result.family.name.to_s
                    if !names.include?result.family.name
                      names << result.family.name
                      data_tmp << value
                      labels_production_temp <<  (coder.decode(truncate(result.family.name.html_safe, :length => TRUNCATE)))
                      colors_production_temp << color_array[index % color_array.length]
                      index = index + 1
                    else
                      logger.info "REPEATED! "                    
                      index_name = names.index(result.family.name)
                      data_tmp[index_name] = data_tmp[index_name].to_f + value.to_f
                      logger.info "REPEATED! -> " +  data_tmp[index_name].to_s                    
                    end
                   else
                     overhead += value
                   end 
 
                              #   end
                end
             end 
           end
           

         data_tmp << overhead
#         labels_production_temp << "Overhead (" +  overhead.to_i.to_s + "%)"  
         labels_production_temp << "Overhead"
         colors_production_temp << "#0000FF"         
         names <<  "Overhead"   
           
         others = 0
         data = Array.new
         data_tmp.each_with_index do |data_item,index|
            if data_item > 0
               logger.info "RESULT NAME 1 --> " + labels_production_temp[index].to_s
               logger.info "RESULT NAME 2 --> " + names[index].to_s
               logger.info "RESULT VALUE --> " + data_item.to_s
               data << data_item.to_f
               @labels_production << (coder.decode(truncate(labels_production_temp[index].html_safe, :length => TRUNCATE) + " (" + data_item.round.to_s + "%)"))
               @colors_production << colors_production_temp[index]
            else
               others += data_item
            end
         end

         if data.size > 0
            @datas_production << data
         end
       end
         
       @combineds_production = Array.new 
       @datas_production.each do |data|
          one_item = Array.new

          threshold = 0
          others = 0
          index_color = 0
          data.each_with_index do |item, index|
            if item >= threshold
              temp = Array.new
              temp << item
              temp << @labels_production[index].to_s
              temp << color_array[index_color].to_s
              one_item << temp
              index_color = index_color + 1
            else
              others += item
            end
          end

          @combineds_production << one_item
       end

     seriesValues = @combineds_production[0].collect {|x| x[0] }
     seriesTicks = @combineds_production[0].collect {|x| x[1] }   
     seriesColors = @combineds_production[0].collect {|x| x[2] }
     
     ticks_to_array = ""
     seriesTicks.each_with_index do |tick, index|
        if index == 0
           ticks_to_array += tick.to_s
        else
           ticks_to_array += "|" + tick.to_s
        end   
     end
     values_to_array = ""
     seriesValues.each_with_index do |value, index|
         if (index + 1) < seriesValues.size
            values_to_array += value.to_s + ","
         else
            values_to_array += value.to_s
         end   
     end    
     seriesColors_to_array = ""
     seriesColors.each_with_index do |seriesColor, index|  
         if (index + 1) < seriesColors.size      
             seriesColors_to_array += seriesColor.to_s.gsub("#","") + "|"
         else 
             seriesColors_to_array += seriesColor.to_s.gsub("#","")
         end   
     end

     src_img3 = "http://chart.googleapis.com/chart?chbh=13&chf=c,s,FFFDF6&chts=00632E,14,l&chxt=x,y&cht=p3&chd=t:" + values_to_array
     src_img3 += "&chco=" + seriesColors_to_array + "&chls=2.0&chs=600x200&chl=" + ticks_to_array 
  


       ## END PRODUCTION

       ## INIT USE
         
       color_array_use = Array.new
       color_array_use[0] = "#600000"
       color_array_use[1] = "#800000"
       color_array_use[2] = "#B80000"       
       color_array_use[3] = "#E80000"
         
       data = Array.new 
       index = 0
       results_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Energy Consumption', @product.product_result.id])
       total_value = results_total.first.result_value.value

       results_total.first.children.each do |result|
         value = (result.result_value.value / total_value) * 100
         data << result.result_value.value
         @labels_use <<  (coder.decode(truncate(result.name_en.html_safe, :length => TRUNCATE) + " (" + value.round.to_s + "%)"))
         @colors_use << color_array_use[index % 6]
         index = index + 1
       end

       if data.size > 0
         @datas_use << data
       end
         
         
       @combineds_use = Array.new 
       @datas_use.each do |data|
          one_item = Array.new
          data.each_with_index do |item, index|
            temp = Array.new
            temp << item
            temp << @labels_use[index].to_s
            temp << @colors_use[index].to_s
            one_item << temp
          end
          @combineds_use << one_item
       end


     seriesValues = @combineds_use[0].collect {|x| x[0] }
     seriesTicks = @combineds_use[0].collect {|x| x[1] }   
     seriesColors = @combineds_use[0].collect {|x| x[2] }
     
     ticks_to_array = ""
     seriesTicks.each_with_index do |tick, index|
        if index == 0
           ticks_to_array += tick.to_s
        else
           ticks_to_array += "|" + tick.to_s
        end   
     end
     values_to_array = ""
     seriesValues.each_with_index do |value, index|
         if (index + 1) < seriesValues.size
            values_to_array += value.to_s + ","
         else
            values_to_array += value.to_s
         end   
     end    
     seriesColors_to_array = ""
     seriesColors.each_with_index do |seriesColor, index|  
         if (index + 1) < seriesColors.size      
             seriesColors_to_array += seriesColor.to_s.gsub("#","") + "|"
         else 
             seriesColors_to_array += seriesColor.to_s.gsub("#","")
         end   
     end


     src_img4 = "http://chart.googleapis.com/chart?chbh=13&chf=c,s,FFFDF6&chts=00632E,14,l&chxt=x,y&cht=p3&chd=t:" + values_to_array
     src_img4 += "&chco=" + seriesColors_to_array + "&chls=2.0&chs=600x200&chl=" + ticks_to_array 


     logger.info "src img1 --> " + src_img1
     logger.info "src img2 --> " + src_img2
     logger.info "src img3 --> " + src_img3
     logger.info "src img4 --> " + src_img4
     # END IMAGE 2
     
     pdf.font Rails.public_path + "/fonts/arialbd.ttf" do     
        pdf.font_size 30
        pdf.text "<color rgb='20BFE8'>LCA to go</color>", :align => :center, :inline_format => true
        pdf.move_down 10
        pdf.font_size 18
        pdf.text "<color rgb='20BFE8'>" + _("RESULTS SUMMARY") + "</color>", :align => :center, :inline_format => true
        pdf.move_down 10
        pdf.font_size 14
        pdf.text "<color rgb='7C7C7C'>" + coder.encode(@product.name) + "</color>", :align => :center, :inline_format => true        
        pdf.move_down 10
     end

     pdf.font Rails.public_path + "/fonts/arialbd.ttf" do     
        pdf.font_size 14
        pdf.text "<color rgb='2B4950'>" + _("Carbon footprint (kg CO2-eq) - Absolute values") + "</color>", :align => :left, :inline_format => true
        pdf.move_down 10
        pdf.font_size 11
        if @product.kepi_explanation       
           pdf.text @product.kepi_explanation
           pdf.move_down 10            
        end
     end                 
     pdf.image open(URI.escape(src_img2)), :scale =>0.55, :at => [0,pdf.cursor]  

     pdf.move_down 270
       
     pdf.font Rails.public_path + "/fonts/arialbd.ttf" do     
        pdf.font_size 14
        pdf.text "<color rgb='2B4950'>" + _("Carbon footprint - Production") + "</color>", :align => :left, :inline_format => true
        pdf.move_down 10
        pdf.font_size 11
        if @product.production_comments       
           pdf.text @product.production_comments
           pdf.move_down 10          
        end
     end                 
     
     pdf.image open(URI.escape(src_img3)), :scale =>0.55, :at => [0,pdf.cursor]  

     pdf.move_down 110
     
     pdf.font Rails.public_path + "/fonts/arialbd.ttf" do   
        pdf.move_down 10
        pdf.font_size 14
        pdf.text "<color rgb='2B4950'>" + _("Carbon footprint - Use") + "</color>", :align => :left, :inline_format => true
        pdf.move_down 10
        pdf.font_size 11

        if @product.use_comments              
           pdf.text @product.use_comments
           pdf.move_down 10         
        end
     end                 
     
     
     pdf.image open(URI.escape(src_img4)), :scale =>0.55, :at => [0,pdf.cursor]
     pdf.render_file coder.decode(@product.name) + ".pdf"
     send_file coder.decode(@product.name) + ".pdf"
     
     
   end   

   def show
    
     @product = get_product(params[:id])

     add_breadcrumb _("My products").html_safe, :products_url
     add_breadcrumb @product.name, product_url(@product)
     add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
     add_breadcrumb _("Results").html_safe, product_result_url(@product)
     
     begin
        @product_to_compare = get_product(params[:compareTo])
     rescue
     end
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
       @product.indicators.each do |indicator|
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
         


       
       @product.indicators.each do |indicator|
           data = Array.new
           data_absolute = Array.new
           
           result_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Total', @product.product_result.id]).first
           result_total_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
           total = result_total_value.value    
           
           data << 100
           data_absolute << total
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
                data_absolute << value_absolute
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
       
       @product.indicators.each do |indicator|
           data_tmp = Array.new
           names = Array.new
           overhead = 0
           results_total = Result.find(:all, :conditions => ["(name_en=? or name_en=?) and product_result_id=?", 'Materials', 'Components', @product.product_result.id])
           total = 0
           results_total.each do |result_total|
              result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result_total.id]).first
              total += result_value.value
           end
           logger.info "TOTAL --> " + total.to_s
           index = 0
           results_total.each do |result_total|           
             result_total.children.each do |result| 
               if result.check_graphic
                  result_value = ResultValue.find(:all, :conditions => ["indicator_id = ? AND result_id = ?", indicator.id, result.id], :order => "value desc").first
                  
                  if total == 0
                     value = 0
                  else
                     value = ((result_value.value / total) * 100).to_f
                  end
                  logger.info "RESULT NAME --> " + result.name_en.to_s
                  logger.info "RESULT VALUE --> " + result_value.value.to_s
                  logger.info "VALUE --> " + value.to_s
                  if result.family
                    if !names.include?result.family.name
                      names << result.family.name
                      data_tmp << value
                      labels_production_temp <<  (coder.decode(truncate(result.family.name.html_safe, :length => TRUNCATE)))
                      colors_production_temp << color_array[index % color_array.length]
                      index = index + 1
                    else
                      index_name = names.index(result.family.name)
                      data_tmp[index_name] = data_tmp[index_name].to_f + value.to_f
                    end
                   else
                     overhead += value
                   end
                end
             end 
           end
           

         data_tmp << overhead
#         labels_production_temp << "Overhead (" +  overhead.to_i.to_s + "%)"  
         labels_production_temp << "Overhead"
         colors_production_temp << "#0000FF"         
         names <<  "Overhead"   
           
           others = 0
           data = Array.new
           data_tmp.each_with_index do |data_item,index|           
              if data_item > 0
                 logger.info "RESULT NAME2 --> " + labels_production_temp[index].to_s
                 logger.info "RESULT NAME3 --> " + names[index].to_s                 
                  logger.info "RESULT VALUE2 --> " + data_item.to_s                
                 data << data_item.to_f
                 @labels_production << (coder.decode(truncate(labels_production_temp[index].html_safe, :length => TRUNCATE) + " (" + data_item.round.to_s + "%)"))   
                 @colors_production << colors_production_temp[index]
              else  
                 others += data_item
              end
           end
 #          if others > 1
  #           data << others
   #          @labels_production << 'Others' + " (" + others.to_s + "%)"  
    #         @colors_production << GRAY_COLOR_3
     #      end
           
           if data.size > 0
              @datas_production << data           
           end                         
         end
         
       @combineds_production = Array.new 
       @datas_production.each do |data|
          one_item = Array.new
          
         # data_sorted = data.sort.reverse
          threshold = 0
      #    if data_sorted.length > 6 
       #      threshold = data_sorted[5]
       #   end
          others = 0
          index_color = 0
          data.each_with_index do |item, index|
            if item >= threshold
              temp = Array.new
              temp << item
              temp << @labels_production[index].to_s
              temp << color_array[index_color].to_s
              one_item << temp
              index_color = index_color + 1
            else
              others += item
            end
          end

          
          
      #    temp = Array.new
       #   temp << others
       #   temp << "Others <" + threshold.to_i.to_s + "% (" + others.to_i.to_s + "%)" 
       #   temp << "#0000FF"
       #   one_item << temp         
          
          
          @combineds_production << one_item
       end
         

       ## END PRODUCTION

       ## INIT USE
         
       color_array_use = Array.new
       color_array_use[0] = "#600000"
       color_array_use[1] = "#800000"
       color_array_use[2] = "#B80000"       
       color_array_use[3] = "#E80000"
         
       data = Array.new 
       index = 0
#       @product.consumption_uses.each do |consumption_use|
 #          value = consumption_use.time_mode.to_i
           ##
           results_total = Result.find(:all, :conditions => ["name_en=? and product_result_id=?", 'Energy Consumption', @product.product_result.id])
           total_value = results_total.first.result_value.value
           
           results_total.first.children.each do |result|
           ##
             value = (result.result_value.value / total_value) * 100
             data << result.result_value.value
             @labels_use <<  (coder.decode(truncate(result.name_en.html_safe, :length => TRUNCATE) + " (" + value.round.to_s + "%)"))  
             @colors_use << color_array_use[index % 6]
             index = index + 1
           end
  #      end        
        if data.size > 0
          @datas_use << data           
        end                         
         
         
       @combineds_use = Array.new 
       @datas_use.each do |data|
          one_item = Array.new
          data.each_with_index do |item, index|
            temp = Array.new
            temp << item
            temp << @labels_use[index].to_s
            temp << @colors_use[index].to_s
            one_item << temp
          end
          @combineds_use << one_item
       end
         
         
         
       else  
        respond_to do |format|
          format.html { redirect_to(products_url) }
          format.xml { head :ok }
        end
       end    
     end 


  
end
