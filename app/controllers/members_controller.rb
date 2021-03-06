class MembersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to root_path, notice: 'Successfully created member'
    else
      render 'new'
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :role, :gender, :email, :photo_url)
  end
end
