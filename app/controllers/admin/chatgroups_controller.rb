class Admin::ChatgroupsController < ApplicationController
  def index
    @chatgroups = Chatgroup.all
  end

  def show
    @chatgroup = Chatgroup.find(params[:id])
    @connects = @chatgroup.connects
  end

  def destroy
    @chatgroup = Chatgroup.find(params[:id])
    @chatgroup.destroy
    redirect_to admin_chatgroups_path
  end

end
