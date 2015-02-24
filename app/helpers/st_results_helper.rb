module StResultsHelper
  include ApplicationHelper
  
  

  def st_display_tree_recursive_first(root_result, is_percentage = false, is_root = true, old_bg_color = nil)
     precision = 2
     if is_root
       @first_id = root_result.id.to_s
       ret = "<tr id=\"node-" + root_result.id.to_s + "\"><td class=\"item_result\" style=\"color:white;background-color:" + TOTAL_COLOR + "\">Life Cycle Stages</td>"
          result_values = StResultValue.find(:all, :conditions => ["st_result_id = ?", root_result.id])
          if result_values.first 
            result_value = result_values.first
            ret += "<input type=\"hidden\" id=\"hiden_" + result_value.id.to_s + "\" value=\"" + result_value.value.to_s + "\">";  
            if I18n.locale == :en
               ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + result_value.percentage.to_s + "\">";              
               ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value, :precision => 2, :locale => 'en').to_s + "\">";
               ret += "<input type=\"hidden\" id=\"absolute_year_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value_year, :precision => 2, :locale => 'en').to_s + "\">";               
            else
               ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.percentage, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";              
               ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";
               ret += "<input type=\"hidden\" id=\"absolute_year_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value_year, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";               
            end  
            ret += "<td id=\"result_" + result_value.id.to_s + "\" class=\"result_cell\">".html_safe
            if result_value.value == 0
              ret += "-"
            else             
               if I18n.locale == :en
                 ret += number_with_precision(result_value.value, :precision => precision, :locale => 'en').to_s
               else
                 ret += number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision})
               end                
            end           
            ret += "</td>".html_safe
            
            ret += "<td id=\"year_result_" + result_value.id.to_s + "\" class=\"result_cell\">".html_safe
            if result_value.value == 0
              ret += "-"
            else             
               if I18n.locale == :en
                 ret += number_with_precision(result_value.value_year, :precision => precision, :locale => 'en').to_s
               else
                 ret += number_to_currency(result_value.value_year, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision})
               end                
            end           
            ret += "</td>".html_safe
            
            
          else
            ret += "<td class=\"results_very_low\">".html_safe
            ret += "-"
            ret += "</td>".html_safe
          end
       ret += "</tr>"
     else
       ret = ""
     end
     if is_root
        @array_expanded = Array.new
     end     
     root_result.children.each do |node|
        ret += "<tr id=\"node-" + node.id.to_s + "\" class=\"child-of-node-" + node.parent.id.to_s + "\" style=\"height:28px\">".html_safe
        bg_color = st_get_color(node.name_en, node.parent.name_en)       
        if bg_color == DEFAULT_COLOR
          bg_color = old_bg_color
        end
        if is_root
           @array_expanded << node.id
        end          
        
        ret += "<td class=\"item_result\" style=\"color:white;background-color:" + bg_color + "\">".html_safe
        
        is_second_level = false
        if node.parent && node.parent.parent && node.parent.parent.id.to_s == @first_id.to_s
          is_second_level = true
        end
        if is_root || is_second_level
          if node.check_graphic.to_s == 'true'
             ret += "<input type=\"checkbox\" checked=\"true\" name=\"check_" + node.id.to_s + "\" id=\"check_" + node.id.to_s + "\"/>".html_safe
          else
             ret += "<input type=\"checkbox\" name=\"check_" + node.id.to_s + "\" id=\"check_" + node.id.to_s + "\"/>".html_safe
          end
        else 
          ret += "&nbsp;&nbsp;"
        end 
        ret += node.name_ca.html_safe
        ret += "</td>".html_safe
      #  indicators.each do |indicator|
           result_values = StResultValue.find(:all, :conditions => ["st_result_id = ?", node.id])
           if result_values.first 
             result_value = result_values.first
             ret += "<input type=\"hidden\" id=\"hiden_" + result_value.id.to_s + "\" value=\"" + result_value.value.to_s + "\">";               
             if I18n.locale == :en
                ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.percentage, :precision => precision, :locale => 'en') + "\">";
                ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value, :precision => precision, :locale => 'en').to_s + "\">";
                ret += "<input type=\"hidden\" id=\"absolute_year_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value_year, :precision => precision, :locale => 'en').to_s + "\">";
                
             else
                ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.percentage, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision}).to_s + "\">";               
                ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision}).to_s + "\">";
                ret += "<input type=\"hidden\" id=\"absolute_year_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value_year, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision}).to_s + "\">";                
             end  
             ret += "<td id=\"result_" + result_value.id.to_s + "\" class=\"result_cell\">".html_safe       
             if result_value.value == 0
                ret += "-"
             else  
                if I18n.locale == :en
                  ret += number_with_precision(result_value.value, :precision => precision, :locale => 'en').to_s
                else  
                  ret += number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision})
                end
              end 
              ret += "</td>".html_safe
              
              
             ret += "<td id=\"year_result_" + result_value.id.to_s + "\" class=\"result_cell\">".html_safe       
             if result_value.value == 0
                ret += "-"
             else  
                if I18n.locale == :en
                  ret += number_with_precision(result_value.value_year, :precision => precision, :locale => 'en').to_s
                else  
                  ret += number_to_currency(result_value.value_year, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision})
                end
              end 
              ret += "</td>".html_safe
              
              
           else
              ret += "<td class=\"results_very_low\">".html_safe
              ret += "-"
              ret += "</td>".html_safe
           end
          

        if node.name_en == 'MATERIALS'
           ret += "<td rowspan=\"2\" style='text-align:center'>".html_safe
           if @st_product.st_data_quality
             if @st_product.st_data_quality.materials == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @st_product.st_data_quality.materials == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @st_product.st_data_quality.materials == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  
           ret += "</td>".html_safe           
        end
        if node.name_en == 'MANUFACTURING'
           ret += "<td rowspan=\"3\" style='text-align:center'>".html_safe
           if @st_product.st_data_quality
             if @st_product.st_data_quality.manufacturing == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @st_product.st_data_quality.manufacturing == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @st_product.st_data_quality.manufacturing == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  

           ret += "</td>".html_safe           
        end
        if node.name_en == 'DISTRIBUTION'
           ret += "<td rowspan=\"3\" style='text-align:center'>".html_safe
           if @st_product.st_data_quality
             if @st_product.st_data_quality.distribution == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @st_product.st_data_quality.distribution == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @st_product.st_data_quality.distribution == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  

           ret += "</td>".html_safe           
        end
        if node.name_en == 'USE'
           ret += "<td rowspan=\"3\" style='text-align:center'>".html_safe
           if @st_product.st_data_quality
             if @st_product.st_data_quality.use == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @st_product.st_data_quality.use == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @st_product.st_data_quality.use == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  

           ret += "</td>".html_safe           
        end
        if node.name_en == 'END-OF-LIFE'
           ret += "<td rowspan=\"2\" style='text-align:center'>".html_safe
           if @st_product.st_data_quality
             if @st_product.st_data_quality.end_of_life == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @st_product.st_data_quality.end_of_life == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @st_product.st_data_quality.end_of_life == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  

           ret += "</td>".html_safe           
        end

        
        
        ret += "</tr>".html_safe
        ret += st_display_tree_recursive_first(node, is_percentage, false, bg_color)
     end
    ret.html_safe
  end  
end
