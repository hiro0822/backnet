class ConnectsController < ApplicationController
  def destroy
   @connect = Connect.find(params[:id])
   @connect.destroy
   redirect_to chatgroups_path
  end
end
