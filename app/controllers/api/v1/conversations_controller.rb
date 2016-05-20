class Api::V1::ConversationsController < ApplicationController

  before_action :set_conversation, only: [:show, :update, :destroy]

  def index
    conversations = Conversation.all
    render json: conversations, status: 200
  end

  def show
    render json: @conversation, status: 200
  end

  def create
    conversation = Conversation.new(conversation_params)
    if conversation.save
      render json: conversation, status: :created
    else
      render json: conversation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @conversation.update(conversation_params)
      render json: @conversation, status: 200
    else
      render json: @conversation.errors, status: 422
    end
  end

  def destroy
    @conversation.destroy
    head 204
  end
  private
  def conversation_params
    params.require(:conversation).permit(:content, :ticket_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
end
