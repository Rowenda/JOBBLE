class OffersController < ApplicationController

  def new_offer
    @offer = Offer.new
    @jobs = Job.all
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @format_file = params[:offer][:photo].content_type # string

  if @format_file.first(5) == 'image'# condition verif du format de l'image
    if @offer.save
      current_user.recrutor = true
      current_user.save
      redirect_to offer_path(@offer)
    else
      render 'offers/new_offer'
    end
  else # else de la condi format
    render 'offers/new_offer'
  end # fin de condit du format


  end

  def index
    @user = current_user
    @offers = Offer.where(job_id: @user.jobs.ids)
    @selected_offers = []
    @offers.each do |offer| # iterate through offers
       if offer.user_id != current_user.id
        if offer.matches.count.positive? # check if offer.matches exist
          if offer.matches.find_by_user_id(@user.id).present? # if match belongs to the current user
            if offer.matches.find_by_user_id(@user.id).candidate_status.nil? # if candidate.status exist and is nil
              @selected_offers << offer
            end
          else
            @selected_offers << offer
          end
        else
          @selected_offers << offer
        end
      end
     end # fin du if n'est pas = au current user
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def matches
    @user = current_user
    @matches = Match.where(
      candidate_status: true,
      recrutor_status: true,
      user_id: @user.id
    )

    @offers = []
    @matches.each do |match|
      @offers << Offer.find(match.offer_id)
    end
  end


  private


  def offer_params
    params.require(:offer).permit(
      :title,
      :description,
      :location,
      :salary,
      :number_hour,
      :employement_type,
      :contract_type,
      :company_name,
      :job_id,
      :photo
    )
  end
end
