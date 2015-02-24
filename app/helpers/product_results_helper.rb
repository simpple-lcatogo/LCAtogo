module ProductResultsHelper
  include ApplicationHelper
  
 
  

  def display_tree_recursive_first(root_result, indicators, divisor, is_percentage = false, is_root = true, old_bg_color = nil, is_year = false)

    if is_root
      @first_id = root_result.id.to_s

      ret = "<tr id=\"node-" + root_result.id.to_s + "\"><td class=\"item_result\" style=\"color:white;background-color:" + TOTAL_COLOR + "\"><span id=\"total_title\">TOTAL per product lifecycle</span></td>"

      indicators.each do |indicator|
        result_values = ResultValue.find_all_by_indicator_id_and_result_id(indicator.id, root_result.id)
        if result_values.first
          result_value = result_values.first
          ret += "<input type=\"hidden\" id=\"hiden_" + result_value.id.to_s + "\" value=\"" + result_value.value.to_s + "\">";
          if result_value.value == 0
            ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"0\">";
            ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"-\">";
            ret += "<input type=\"hidden\" id=\"year_" + result_value.id.to_s + "\" value=\"-\">";
          else
            if I18n.locale == :en
              ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + result_value.percentage.to_s + "\">";
              ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value, :precision => 2, :locale => 'en').to_s + "\">";
              ret += "<input type=\"hidden\" id=\"year_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value / divisor, :precision => 2, :locale => 'en').to_s + "\">";
            else
              ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.percentage, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";
              ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";
              ret += "<input type=\"hidden\" id=\"year_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value / divisor, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";
            end
          end
            ret += "<td id=\"result_" + result_value.id.to_s + "\" class=\"result_cell\">".html_safe
          if result_value.value == 0
            ret += "-"
          else
            if is_percentage
              ret += number_with_precision(100, :precision => 2, :locale => 'en').to_s
              ret += "%"
            else
              if I18n.locale == :en
                ret += number_with_precision(result_value.value, :precision => 2, :locale => 'en').to_s
              else
                ret += number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2})
              end
            end
          end

          ret += "</td>".html_safe
        else
          ret += "<td class=\"results_very_low\">".html_safe
          ret += "-"
          ret += "</td>".html_safe
        end
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
      bg_color = get_color(node.name_en, node.parent.name_en)
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

      ret += node.name_ca.html_safe
      ret += "</td>".html_safe
      indicators.each do |indicator|
        result_values = ResultValue.find_all_by_indicator_id_and_result_id(indicator.id, node.id)
        if result_values.first
          result_value = result_values.first
          ret += "<input type=\"hidden\" id=\"hiden_" + result_value.id.to_s + "\" value=\"" + result_value.value.to_s + "\">";
          if result_value.value == 0
            ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"0\">";
            ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"-\">";
            ret += "<input type=\"hidden\" id=\"year_" + result_value.id.to_s + "\" value=\"-\">";
          else
            if I18n.locale == :en
              ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.percentage, :precision => 2, :locale => 'en') + "\">";
              ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value, :precision => 2, :locale => 'en').to_s + "\">";
              ret += "<input type=\"hidden\" id=\"year_" + result_value.id.to_s + "\" value=\"" + number_with_precision(result_value.value / divisor, :precision => 2, :locale => 'en').to_s + "\">";
            else
              ret += "<input type=\"hidden\" id=\"hidden_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.percentage, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";
              ret += "<input type=\"hidden\" id=\"absolute_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";
              ret += "<input type=\"hidden\" id=\"year_" + result_value.id.to_s + "\" value=\"" + number_to_currency(result_value.value / divisor, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2}).to_s + "\">";
            end
          end
          ret += "<td id=\"result_" + result_value.id.to_s + "\" class=\"result_cell\">".html_safe
          if is_percentage
            ret += "0.0%".to_s
            ret += "%"
          else
            if result_value.value == 0
              ret += "-"
            else
              if I18n.locale == :en
                ret += number_with_precision(result_value.value, :precision => 2, :locale => 'en').to_s
              else
                ret += number_to_currency(result_value.value, {:unit => '', :separator => ',', :delimiter => '.', :precision => 2})
              end
            end
          end
        else
          ret += "<td class=\"results_very_low\">".html_safe
          if is_percentage
            ret += "0.0%"
          else
            ret += "-"
          end
          ret += "</td>".html_safe
        end
        ret += "</td>".html_safe
      end

      isDqi = false
      if node.name_en == 'MANUFACTURING'
        isDqi = true
        ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe
        if @product.data_quality
          if @product.data_quality.manufacturing == 'robust'
            ret += "<img src='/images/bullet-green-icon.png'/>"
          end
          if @product.data_quality.manufacturing == 'indicative'
            ret += "<img src='/images/bullet-yellow-icon.png'/>"
          end
          if @product.data_quality.manufacturing == 'illustrative'
            ret += "<img src='/images/bullet-red-icon.png'/>"
          end
        end

        ret += "</td>".html_safe
      end
      if node.name_en == 'DISTRIBUTION'
        isDqi = true
        ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe
        if @product.data_quality
          if @product.data_quality.distribution == 'robust'
            ret += "<img src='/images/bullet-green-icon.png'/>"
          end
          if @product.data_quality.distribution == 'indicative'
            ret += "<img src='/images/bullet-yellow-icon.png'/>"
          end
          if @product.data_quality.distribution == 'illustrative'
            ret += "<img src='/images/bullet-red-icon.png'/>"
          end
        end

        ret += "</td>".html_safe
      end
      if node.name_en == 'USE'
        isDqi = true
        ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe
        if @product.data_quality
          if @product.data_quality.use == 'robust'
            ret += "<img src='/images/bullet-green-icon.png'/>"
          end
          if @product.data_quality.use == 'indicative'
            ret += "<img src='/images/bullet-yellow-icon.png'/>"
          end
          if @product.data_quality.use == 'illustrative'
            ret += "<img src='/images/bullet-red-icon.png'/>"
          end
        end

        ret += "</td>".html_safe
      end
      if node.name_en == 'END-OF-LIFE'
        isDqi = true
        ret += "<td rowspan=\"1\" style=\"text-align:center\">".html_safe
        if @product.data_quality
          if @product.data_quality.end_of_life == 'robust'
            ret += "<img src='/images/bullet-green-icon.png'/>"
          end
          if @product.data_quality.end_of_life == 'indicative'
            ret += "<img src='/images/bullet-yellow-icon.png'/>"
          end
          if @product.data_quality.end_of_life == 'illustrative'
            ret += "<img src='/images/bullet-red-icon.png'/>"
          end
        end

        ret += "</td>".html_safe
      end

      if !isDqi
        ret += "<td></td>"
      end



      ret += "</tr>".html_safe
      ret += display_tree_recursive_first(node, indicators, divisor, is_percentage, false, bg_color)
    end



    ret.html_safe
  end

end
