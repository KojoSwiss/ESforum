class MessagesController < ApplicationController
  # before_action: find_message: only: [:show, ]
  def index
    @messages = Message.all.order("created_at DESC")
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params.require(:message).permit(:title, :description))
    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end



  private

  def message_params
    @message = Message.new(params.require(:message).permit(:title, :description))
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
