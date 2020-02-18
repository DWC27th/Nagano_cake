class Admins::MembersController < ApplicationController
    before_action :authenticate_admin!

    def index
	    @members = Member.with_deleted.search(params[:search])
      @members = @members.page(params[:page])
    end

    def show
	    @member = Member.with_deleted.find(params[:id])
    end

    def edit
	    @member = Member.with_deleted.find(params[:id])
    end

    def update
    	@member = Member.with_deleted.find(params[:id])
      #binding.pry
      if params[:member_status] == "2" && @member.deleted_at.blank?
        @member.destroy
      elsif params[:member_status] == "1" && @member.deleted_at.present?
        @member.restore
      end
      if @member.update(member_params)
        redirect_to admins_member_path(@member.id), notice: "会員情報が更新されました"
      else
        flash.now[:alert] = "#{@member.errors.count}件のエラーが有ります"
        render "edit"
      end
    end

    private
        def member_params
        params.require(:member).permit(:id,:first_name,:last_name,:first_name_kana,:last_name_kana,:address,:phone_number, :postal_code,:member_status, :email, :deleted_at)
    end

end
