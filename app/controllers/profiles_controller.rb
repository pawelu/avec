class ProfilesController < ApplicationController

  before_action :set_skill

  def new
    @profile = Profile.new
  end

  def create
    @skill = @current_user.skills.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to profile_path, notice: 'Yeah.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'show' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @skills = @current_user.skills
  end

  def edit
    @skill = Skill.new
  end

  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to profile_path, notice: 'Yupi!' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user.profile || Profile.new
    end

    def set_skill

      @skill = Skill.new
      @skill = @current_user.skills.find(params[:ids]) if params[:ids]
      @skill = @current_user.skills(params[:current_user_id])
    end

    def skill_params
      params.require(:skill).permit(:name, :level, :skill_type)
    end
end
