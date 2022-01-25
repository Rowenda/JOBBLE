class MatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @match = Match.find(params[:id])
    @chatroom = Chatroom.where(user_id: @match.user.id).find_by_recrutor(@match.offer.user.id)
  end

  def create # like
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    # check if match exists

    if @user.matches.find_by_offer_id(@offer.id).present?
      @match = @user.matches.find_by_offer_id(@offer.id)
      @match.candidate_status = true
      if @match.save
        # render 'shared/animation'
        unless Chatroom.where(user_id: current_user, recrutor: @offer.user_id).count.positive?
          @chatroom = Chatroom.new(name: @offer.title, user_id: @user.id, recrutor: @offer.user_id)
          if @chatroom.save
            teste = User.find_by_first_name('bot')
            Message.create(content: 'Ceci est le début de votre conversation', user_id: teste.id, chatroom_id: @chatroom.id )
          end
        end
        if @match.recrutor_status == true
          redirect_to match_path(@match)
        else
          redirect_to offers_path
        end
      else
        redirect_to root_path
      end
    else
      @match = Match.new
      @match.offer_id = @offer.id
      @match.candidate_status = true
      @match.user_id = @user.id
      if @match.save
        redirect_to offers_path
      else
        redirect_to root_path
      end
    end
  end


  def reject
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    # check if match exists

    if @user.matches.find_by_offer_id(@offer.id).present?
      @match = @user.matches.find_by_offer_id(@offer.id)
      @match.candidate_status = false
      if @match.save
        redirect_to offers_path
      else
        redirect_to root_path
      end
    else
      @match = Match.new
      @match.offer_id = @offer.id
      @match.candidate_status = false
      @match.user_id = @user.id
      if @match.save
        redirect_to offers_path
      else
        redirect_to root_path
      end
    end
  end

  # add a private method (refacto)

end
