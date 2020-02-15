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

    def destroy
        member = Member.find(params[:id]) #データ(レコード)を1件取得
        member.destroy #データ（レコード）を削除
        redirect_to members_top_path
    end

    private
        def member_params
        params.require(:member).permit(:id,:first_name,:last_name,:first_name_kana,:last_name_kana,:address,:phone_number, :postal_code,:member_status, :email)
    end

end
