class VendorsController < ApplicationController
  def index
    @filters = params.fetch(:filters, "").split(",")
    @vendors = Vendor.scopes_for(filters: @filters)
  end
end
