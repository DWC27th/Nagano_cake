class Admins::MembersController < ApplicationController

    def index
	    @members = Member.page(params[:page])
    end

    def show
	    @member = Member.find(params[:id])
    end

    def edit
	    @member = Member.find(params[:id])

    end

    def update
    	member = Member.find(params[:id])
    	if member.update(member_params)
    	  redirect_to admins_orders_path
        else
          redirect_to admins_members_path
        end
    end

    private
        def member_params
        params.require(:member).permit(:id,:first_name,:last_name,:first_name_kana,:last_name_kana,:address,:phone_number, :postal_code,:member_status, :email)
    end

end
