module VendorsHelper
  def filter_class(filter:, filters:)
    filters.include?(filter) ? "btn active" : "btn"
  end

  def has_filter_class(filters:)
    filters.empty? ? "btn btn--disabled" : "btn btn"
  end

  def filter_toggle_for(filter: , filters:)
    if filters.include? filter
      logger.info "Removing #{filter}"
      filters.reject {|i| i ==  filter }
    else
      [*filters, filter]
    end.join(",")
  end

  def current_lang_class(locale:, current_locale:)
    if current_locale
      locale === current_locale ? "active" : ""
    elsif locale === 'en'
      "active"
    end
  end
end
