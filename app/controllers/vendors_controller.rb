class VendorsController < ApplicationController
  before_action :load_filters
  before_action :sanitise_filters

  def index
    @vendors = Vendor.filtered_by(filters: @filters)
  end

  private

  def load_filters
    @filters = params.fetch(:filters, "").split(",")
  end

  def sanitise_filters
    unhandled_filters = @filters - Vendor::FILTER_SCOPES.keys

    return if unhandled_filters.empty?

    logger.warn "Unhandled vendor filters [#{unhandled_filters.join(",")}], removing from filter list"
    @filters = @filters - unhandled_filters
  end
end
