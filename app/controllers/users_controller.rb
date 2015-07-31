class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin" , password:"pass"
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
    #@user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
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

  def download
     # send_file '/home/it184/Project/Todo_app/non_public/images.jpeg',
     #  :type => 'image/jpeg'
    user = User.find(params[:user_id])
    send_file user.document.path, :type => user.document_content_type
  end

  def delete_selected_user
    puts "````````````````#{params[:check_user][:user_ids]}"
    User.where(:id => params[:check_user][:user_ids]).delete_all
    redirect_to users_url,
    notice: "User's where deleted Successfully !!!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      #params.require(:user).permit(:name, :email, :contact, :file)
      params.require(:user).permit(:name, :email, :contact, :document,:check_user)
    end
end
