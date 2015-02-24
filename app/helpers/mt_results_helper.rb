module MtResultsHelper
  include ApplicationHelper
  
  
  
  def mt_display_tree_recursive_first(root_result, indicators, is_percentage = false, is_root = true, old_bg_color = nil)
     precision = 0
     precision_perc = 2
     if is_root
       @first_id = root_result.id.to_s
       ret = "<tr id=\"node-" + root_result.id.to_s + "\"><td class=\"item_result\" style=\"color:white;background-color:" + TOTAL_COLOR + "\">TOTAL</td>"
       indicators.each do |indicator|
          result_values = MtResultValue.find(:all, :conditions => ["indicator_id = ? and mt_result_id = ?", indicator.id, root_result.id])
          if result_values.first 
            result_value = result_values.first
            ret += "<input type=\"hidden\" id=\"hiden_" + result_value.id.to_s + "\" value=\"" + result_value.value.to_s + "\">";  
            if I18n.locale == :en
               ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + result_value.percentage.to_s + "\">";              
               ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value, :delimiter => ',', :precision => precision, :locale => 'en').to_s + "\">";
            else
               ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.percentage, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision_perc}).to_s + "\">";
               ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision}).to_s + "\">";
            end  
            ret += "<td id=\"result_" + result_value.id.to_s + "\" class=\"result_cell\">".html_safe
            if result_value.value == 0
              ret += "0"
            else             
              if is_percentage
                 ret += number_with_precision(100, :precision => precision, :locale => 'en').to_s
                 ret += "%"
              else                                          
               if I18n.locale == :en
                 ret += number_with_precision(result_value.value, :delimiter => ',', :precision => precision, :locale => 'en').to_s
               else
                 ret += number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision})
               end                
              end
           end
           
            ret += "</td>".html_safe
          else
            ret += "<td class=\"results_very_low\">".html_safe
            ret += "0"

           ret += "</td>".html_safe
          end
       end
       ret += "<td></td>".html_safe
                                
       ret += "</tr>"
     else
       ret = ""
     end
     if is_root
        @array_expanded = Array.new
     end     
     root_result.children.each do |node|
        ret += "<tr id=\"node-" + node.id.to_s + "\" class=\"child-of-node-" + node.parent.id.to_s + "\" style=\"height:28px\">".html_safe
        bg_color = mt_get_color(node.name_en, node.parent.name_en)       
        if bg_color == DEFAULT_COLOR
          bg_color = old_bg_color
        end
        if is_root
           @array_expanded << node.id
        end          

        is_second_level = false
        if node.parent && node.parent.parent && node.parent.parent.id.to_s == @first_id.to_s
          is_second_level = true
        end
        
        ret += "<td class=\"item_result\" style=\"color:white;background-color:" + bg_color + "\">".html_safe
        if is_root || is_second_level
          if node.check_graphic.to_s == 'true'
           ret += "<input type=\"checkbox\" checked=\"true\" name=\"check_" + node.id.to_s + "\" id=\"check_" + node.id.to_s + "\"/>".html_safe
          else
           ret += "<input type=\"checkbox\" name=\"check_" + node.id.to_s + "\" id=\"check_" + node.id.to_s + "\"/>".html_safe
         end 
       else
          ret += "&nbsp;&nbsp;"        
       end  
        if node.name_ca.blank?
           ret += ""
        else
           ret += node.name_ca.html_safe
        end  
        ret += "</td>".html_safe
        indicators.each do |indicator|
           result_values = MtResultValue.find(:all, :conditions => ["indicator_id = ? and mt_result_id = ?", indicator.id, node.id])
           if result_values.first 
             result_value = result_values.first
             ret += "<input type=\"hidden\" id=\"hiden_" + result_value.id.to_s + "\" value=\"" + result_value.value.to_s + "\">";               
             if I18n.locale == :en
                ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.percentage, :delimiter => ',', :precision => precision_perc, :locale => 'en') + "\">";
                ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value, :delimiter => ',', :precision => precision, :locale => 'en').to_s + "\">";
             else
                ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.percentage, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision_perc}).to_s + "\">";
                ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => precision}).to_s + "\">";
             end  
             ret += "<td id=\"result_" + result_value.id.to_s + "\" class=\"result_cell\">".html_safe       
             if is_percentage
                ret += "0.0%".to_s
                ret += "%"
             else     
               if result_value.value == 0
                  ret += "0"
               else  
            #   ret += sprintf("%.2E", result_values.first.value).to_s
                  if I18n.locale == :en
                    ret += number_with_precision(result_value.value, :precision => precision, :delimiter => ',', :locale => 'en').to_s
                  else  
                    ret += number_to_currency(result_value.value, {:unit => '', :delimiter => ',', :precision => precision})
                  end
                end 
              # ret += result_values.first.value.to_s
             end  
           else
            ret += "<td class=\"results_very_low\">".html_safe
            if is_percentage
               ret += "0.0%"
            else
               ret += "0"
            end
            ret += "</td>".html_safe
           end
           ret += "</td>".html_safe
        end
        isDqi = false
        if node.name_en == 'MATERIALS'
           isDqi = true
           ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe           
           if @mt_product.mt_data_quality
             if @mt_product.mt_data_quality.materials == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @mt_product.mt_data_quality.materials == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @mt_product.mt_data_quality.materials == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
            end            
          end                  
           ret += "</td>".html_safe           
        end
        if node.name_en == 'MANUFACTURING'
           isDqi = true          
           ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe
           if @mt_product.mt_data_quality
             if @mt_product.mt_data_quality.manufacturing == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @mt_product.mt_data_quality.manufacturing == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @mt_product.mt_data_quality.manufacturing == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  

           ret += "</td>".html_safe           
        end
        if node.name_en == 'DISTRIBUTION'
           isDqi = true          
           ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe
           if @mt_product.mt_data_quality
             if @mt_product.mt_data_quality.distribution == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @mt_product.mt_data_quality.distribution == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @mt_product.mt_data_quality.distribution == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  

           ret += "</td>".html_safe           
        end
        if node.name_en == 'USE'
           isDqi = true          
           ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe
           if @mt_product.mt_data_quality
             if @mt_product.mt_data_quality.use == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @mt_product.mt_data_quality.use == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @mt_product.mt_data_quality.use == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  

           ret += "</td>".html_safe           
        end
        if node.name_en == 'END-OF-LIFE'
           isDqi = true          
           ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe
           if @mt_product.mt_data_quality
             if @mt_product.mt_data_quality.end_of_life == 'robust'
                ret += "<img src='/images/bullet-green-icon.png'/>" 
             end
             if @mt_product.mt_data_quality.end_of_life == 'indicative'
                ret += "<img src='/images/bullet-yellow-icon.png'/>"
             end
             if @mt_product.mt_data_quality.end_of_life == 'illustrative'
                ret += "<img src='/images/bullet-red-icon.png'/>"
             end
          end                  

           ret += "</td>".html_safe           
        end

        if !isDqi
          ret += "<td></td>"
        end
        
        ret += "</tr>".html_safe
        ret += mt_display_tree_recursive_first(node, indicators, is_percentage, false, bg_color)
      end
    ret.html_safe
  end  
end
