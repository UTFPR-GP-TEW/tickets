class Admin::ConversationsController < ApplicationController
  before_action :set_conversation, only: [:update, :destroy]

  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      @conversations =  Conversation.where(ticket_id: @conversation.ticket.id)
      render :show
    else
      render :failure
    end
  end

  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to admin_conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:content, :ticket_id)
    end
end
