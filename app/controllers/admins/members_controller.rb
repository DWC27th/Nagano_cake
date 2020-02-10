class Admins::MembersController < ApplicationController

def index
	@members = Member.all
end

def show
	@member = Member.find(params[:id])
end

def edit
	@member = Member.find(params[:id])

end

def update
end

private
    def member_params
      params.require(:member).permit(:id,:first_name,:last_name :address,:phone_number, :postal_code,:member_status)
    end

end
