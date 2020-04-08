module VendorsHelper
  def filter_class(filter:, filters:)
    filters.include?(filter) ? "btn active" : "btn"
  end

  def filter_toggle_for(filter: , filters:)
    if filters.include? filter
      logger.info "Removing #{filter}"
      filters.reject {|i| i ==  filter }
    else
      [*filters, filter]
    end.join(",")
  end
end
