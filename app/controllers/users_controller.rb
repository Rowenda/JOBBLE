class UsersController < ApplicationController
 ################################# USER ################################
  def profile
    @user = current_user
    @profile_user = User.find(params[:format])
  end

  def sign_out
  end

  def update_users
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path(@user)
  end

  # Update of the description of the current_user

  def description_maj
    @user = current_user
    @description = params[:user][:description]
    @user.description = @description
    @user.save!
    redirect_to professional_update_path
  end

########################################################################################
  def dashboard
    @user = current_user
  end # end du dashboard

  def mes_offres
    @offers = Offer.where(user_id: current_user.id)
  end

  def message_index
   @chatrooms = Chatroom.where(user_id: current_user) + Chatroom.where(recrutor: current_user)
  end

  def job_show
    @job_user = UserJob.where(user_id: current_user.id)
    @job = UserJob.new
    @jobs = Job.order(name: :asc)
    if params[:query].present?
      @jobs = @jobs.where('name ILIKE ?', "%#{params[:query]}%")
    end

  respond_to do |format|
    format.html # Follow regular flow of Rails
    format.text { render partial: 'users/list_jobs', locals: { jobs: @jobs }, formats: [:html] }
  end
  end



  def job_update_test
        @user = current_user
    @experience = params[:user_job][:experience].to_i
    @idjob = params[:job_id].split[1].to_i
    if @user.jobs.ids.include?(@idjob)
      @user_job = UserJob.where(job_id: @idjob)
      @user_job.update(experience: @experience)
    else
      @user_job = UserJob.new(experience: @experience, job_id: @idjob)
      @user_job.user = @user
      @user_job.save
    end
        redirect_to job_show_path
  end

  def skill_show
    @job_skill = UserSkill.where(user_id: current_user.id)
    @skill = UserSkill.new
    @skills = Skill.order(name: :asc)
    if params[:query].present?
      @skills = @skills.where('name ILIKE ?', "%#{params[:query]}%")
    end

  respond_to do |format|
    format.html
    format.text { render partial: 'users/list_skills', locals: { skills: @skills }, formats: [:html] }
  end
  end

  def skill_update
    @user = current_user
    @level = params[:user_skill][:level]
    @idskill = params[:skill_id].split[1].to_i
    if @user.skills.ids.include?(@idskill)
      @user_skill = UserSkill.where(skill_id: @idskill)
      @user_skill.update(level: @level)
    else
      @user_skill = UserSkill.new(level: @level, skill_id: @idskill)
      @user_skill.user = @user
      @user_skill.save
    end
    redirect_to skill_show_path
  end

  private

####################### PARAMS_USER_SKILLS #########################################
  def params_user_skills
    params.require(:user_skill).permit(:level, :skill_id)
  end

########################################################################################

####################### PARAMS_USER_JOBS #########################################

  def params_user_jobs
    params.require(:user_job).permit(:experience, :job_id)
  end
##################################################################################
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :city, :gender, :birthdate, :recrutor, :description)
  end

    ########################################################################################
end
