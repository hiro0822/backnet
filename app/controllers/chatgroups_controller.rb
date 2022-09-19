class ChatgroupsController < ApplicationController

  def index
    @chatgroups = Chatgroup.all
    @chatgroup_join = Connect.where(user_id: current_user.id)
    @nogroup = "参加しているグループはありません"
  end

  def show
    @chatgroup = Chatgroup.find(params[:id])
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
    @chatgroup = Chatgroup.find(params[:id])
    @chatgroup.update(chatgroup_params)
    redirect_to chatgroup_path(@chatgroup)
  end

  def destroy
    @chatgroup = Chatgroup.find(params[:id])
    @chatgroup.destroy
    redirect_to chatgroups_path
  end

  private

  def chatgroup_params
    params.require(:chatgroup).permit(:group_name,:introduction,:group_image,user_ids: [])
  end
end
