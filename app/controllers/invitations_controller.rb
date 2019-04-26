class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:update, :destroy]

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      redirect_to @invitation.event
    else
      redirect_to root_path
    end
  end

  def update
    @invitation.update(accepted: true)
    @invitation.event.attendees << @invitation.receiver

    redirect_to @invitation.receiver
  end

  def destroy
    user = @invitation.receiver
    @invitation.destroy

    redirect_to user
  end

  private
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def invitation_params
      params.require(:invitation).permit(:event_id, :sender_id, :receiver_id)
    end

end
