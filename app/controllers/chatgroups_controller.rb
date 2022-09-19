class ChatgroupsController < ApplicationController

  def index
    @chatgroups = Chatgroup.all
    @chatgroup_join = Connect.where(user_id: current_user.id)
    @nogroup = "参加しているグループはありません"
  end

  def show
    @chatgroup = Chatgroup.find(params[:id])
    @connects = @chatgroup.connects
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

  def edit
    @chatgroup = Chatgroup.find(params[:id])
  end

  def update
    if groupuser_params[:user_id].present?
       connect = Connect.new(groupuser_params)
       connect.chatgroup_id = params[:id]
       connect.save
       redirect_to chatgroup_path(params[:id])
    else
      @chatgroup = Chatgroup.find(params[:id])
      @chatgroup.update(chatgroup_params)
      redirect_to chatgroups_path#(@chatgroup)
    end
  end

  def destroy
    @chatgroup = Chatgroup.find(params[:id])
    @chatgroup.destroy
    redirect_to chatgroups_path
  end

  private

  def groupuser_params
    params.require(:chatgroup).permit(:user_id)
  end

  def chatgroup_params
    params.require(:chatgroup).permit(:group_name,:introduction,:group_image,user_ids: [])
  end
end
