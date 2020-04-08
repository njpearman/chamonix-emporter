class VendorsController < ApplicationController
  def index
    @filters = params.fetch(:filters, "").split(",")
    @vendors = Vendor.filtered_by(filters: @filters)
  end
end
