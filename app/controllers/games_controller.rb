class GamesController < ApplicationController

  before_filter :authenticate_user!

  def index
    correct_guess = Member.find(session[:correct_guess_id]) if session[:correct_guess_id]

    if correct_guess != nil && params[:guess] != nil

      if correct_guess.id && params[:guess].to_i == correct_guess.id

        flash[:notice] = 'Good job! You guessed the correct name!'
        set_new_member

      elsif params[:guess].present?
        flash[:notice] = 'Oh no!  That is not the correct name, try again!'
        @random_member = correct_guess

      end
    else
      set_new_member
    end

  end

  def set_new_member
    @random_member = Member.random_member
    session[:correct_guess_id] = @random_member.id
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
