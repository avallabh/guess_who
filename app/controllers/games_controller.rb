class GamesController < ApplicationController
  def index
    @last_guess = session[:last_member]
    if @last_guess && params[:guess] == @last_guess
      flash[:notice] = 'right on playa!'
      set_new_member
    elsif params[:guess].present?
      flash[:notice] = 'dont you know anyone?'
      @random_member = @last_guess
    else
      set_new_member
    end
  end

  def set_new_member
    @random_member = Member.random_member.full_name
    session[:last_member] = @random_member
  end

  def create
  #   # @game = Game.new
  #   # if @game.persisted?
  #   #   render '/guess_who/play'
  #   # else
  #   #   notice: 'Incorrect guess. Try again.'
  #   # end
  end
  def new
    @game = Game.new
  end
end
