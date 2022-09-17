class ChatgroupsController < ApplicationController

  def index
    @chatgroups = Chatgroup.all
  end
  
  def new
    @chatgroup = Chatgroup.new
  end  
  
  def create
    @chatgroup = Chatgroup.new(chatgroup_params)
      if @chatgroup.save
      redirect_to chatgroups_path, notice: 'チャットグループを作成しました'
      else
      render new,alert: 'チャットグループ作成に失敗しました'
      end
  end  
  
  private
  
  def chatgroup_params
    params.require(:chatgroup).permit(:group_name,:introduction,:group_image)
  end  
end
