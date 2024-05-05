class ProductGroupController < ApplicationController
  def show_groups
    @group = ProductGroup.find_by(id: product_group_params[:id])

    return if @group

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def show_subgroups
    @group = ProductSubgroup.find_by(id: product_group_params[:id])

    return if @group

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def product_group_params
    params.permit(:id)
  end
end
