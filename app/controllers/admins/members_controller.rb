class Admins::MembersController < ApplicationController
    before_action :authenticate_admin!

    def index
	    @members = Member.with_deleted.page(params[:page])
    end

    def show
	    @member = Member.with_deleted.find(params[:id])
    end

    def edit
	    @member = Member.with_deleted.find(params[:id])

    end

    def update
    	member = Member.with_deleted.find(params[:id])
        if params[:member_status] == "2"
           member.destroy
           redirect_to admins_member_path(member.id)

        elsif params[:member_status] == "1"
                   member.update(member_params)

                  if member.deleted_at.present?
                      member.restore
                  end
                      redirect_to admins_member_path(member.id)

        end
    end

    private
        def member_params
        params.require(:member).permit(:id,:first_name,:last_name,:first_name_kana,:last_name_kana,:address,:phone_number, :postal_code,:member_status, :email, :deleted_at)
    end

end
