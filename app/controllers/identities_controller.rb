class IdentitiesController < ApplicationController
  def index
    @identity = Identity.all
  end

  def new
    @identity = Identity.new
  end

  def create
    @identity = Identity.new(identity_params)
    if @identity.save
      redirect_to root_path, notice: 'Member information added!'
    else
      render 'new'
    end
  end

  private

  def identity_params
    params.require(:identity).permit(:member_id, :identity_type_id, :value)
  end
end
