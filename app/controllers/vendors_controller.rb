class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all

    @filters = params.fetch(:filters, "").split(",")

    logger.info "Filters: #{@filters}"
    @vendors = @vendors.on(Time.now.strftime("%A")) if @filters.include? "open"
    @vendors = @vendors.delivers if @filters.include? "delivers"
  end
end
