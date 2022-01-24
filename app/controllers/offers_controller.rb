class OffersController < ApplicationController
  def new_offer
    @offer = Offer.new
  end

  def create
   @recrutor = current_user.recrutor = true
   @recrutor.save!
    job_id = params[:offer][:job_id][1].to_i
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @offer.job_id = job_id
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render 'offers/new_offer'
    end
  end

  def index
    @user = current_user
    @offers = Offer.where(job_id: @user.jobs.ids)
    @selected_offers = []
    @offers.each do |offer| # iterate through offers
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
