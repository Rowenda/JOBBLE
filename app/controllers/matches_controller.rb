class MatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @match = Match.find(params[:id])
    @chatroom = Chatroom.where(user_id: @match.user.id).find_by_recrutor(@match.offer.user.id)
  end

  def like # like
    set_offer_user
    # check if match exists
    if @user.matches.find_by_offer_id(@offer.id).present?
      change_candidate_status(true)
      if @match.save
        # render 'shared/animation'
        chatroom
        if @match.recrutor_status == true
          redirect_to match_path(@match)
        else
          redirect_to offers_path
        end
      else
        redirect_to root_path
      end
    else
      create_match(true)
      match_save
    end
  end

  def reject
    set_offer_user
    # check if match exists
    if @user.matches.find_by_offer_id(@offer.id).present?
      change_candidate_status(false)
      match_save
    else
      create_match(false)
      match_save
    end
  end

  private

  # identify user and offer
  def set_offer_user
    @offer = Offer.find(params[:offer_id])
    @user = current_user
  end

  # set candidate status if match already exists -> true or false
  def change_candidate_status(status)
    @match = @user.matches.find_by_offer_id(@offer.id)
    @match.candidate_status = status
  end

  # create match with candidate status if no match exists -> true or false
  def create_match(status)
    @match = Match.new
    @match.offer_id = @offer.id
    @match.user_id = @user.id
    @match.candidate_status = status
  end

  def match_save
    if @match.save
      redirect_to offers_path
    else
      redirect_to root_path
    end
  end

  def chatroom
    unless Chatroom.where(user_id: current_user, recrutor: @offer.user_id).count.positive?
      @chatroom = Chatroom.new(name: @offer.title, user_id: @user.id, recrutor: @offer.user_id)
      if @chatroom.save
        teste = User.find_by_first_name('bot')
        Message.create(content: 'Ceci est le début de votre conversation', user_id: teste.id, chatroom_id: @chatroom.id )
      end
    end
  end
end
