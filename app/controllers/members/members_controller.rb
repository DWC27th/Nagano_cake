class Members::MembersController < ApplicationController

    def edit
    	@member = Member.find(params[:id])
    end

    def update
        member = Member.find(params[:id])
        if member.update(member_params)
          redirect_to members_member_path(member.id)
        else
          redirect_to edit_members_member_path(member.id)
        end
    end

    def show
    	@member = Member.find(params[:id])
    end

    def cancel
    	@member = Member.find(params[:id])
    end

    def withdraw
    end

    private
        def member_params
        params.require(:member).permit(:id,:first_name,:last_name, :address,:phone_number, :postal_code,:member_status, :email)
    end

end
