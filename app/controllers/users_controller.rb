class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def download_file
    @user = User.friendly.find(params[:user_id])
    authorize @user
    send_file @user.resume.download.path, disposition: :inline, filename: @user.resume_filename
  end

  def download_image
    @user = User.find(params[:user_id])
    authorize @user
    processor = Refile.processor(:fill, Refile::MiniMagick.new(:fill))
    temp_file = Tempfile.new('profile_image')
    temp_file.binmode
    temp_file.write @user.profile_image.read
    temp_file.rewind
    image_file = MiniMagick::Image.new(temp_file.path)
    file = processor.fill(image_file, 150, 150)
    temp_file.close
    send_file file.path, disposition: :inline, filename: @user.profile_image_filename
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :profile_image)
    end
end
