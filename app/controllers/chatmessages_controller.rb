class ChatmessagesController < ApplicationController

  def index
    @chatmessage = Chatmessage.new
    @group = Chatgroup.find(params[:chatgroup_id])
    @messages = @group.chatmessages.order(created_at: :desc)
  end

  def create
    @group = Chatgroup.find(params[:chatgroup_id])
    @chatmessage = Chatmessage.new(message_params)
     if @chatmessage.save
      redirect_to chatgroup_chatmessages_path(@group.id),notice: '送信しました'
     else
      render :index
     end
  end

  private

  def message_params
    params.require(:chatmessage).permit(:message,:chatgroup_id).merge(user_id: current_user.id)
  end
end
