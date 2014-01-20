class GamesController < ApplicationController
  def index

    @last_guess = Member.find(session[:last_member_id]) if session[:last_member_id]

    if @last_guess.id && params[:guess].to_i == @last_guess.id
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
    @random_member = Member.random_member
    session[:last_member_id] = @random_member.id
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
