class ProfilesController < ApplicationController
def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_path, notice: 'Yeah.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'index' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Yupi!' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user.profile || Profile.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit()
    end
end
