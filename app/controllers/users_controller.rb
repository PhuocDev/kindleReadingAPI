class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:create, :login]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    head :no_content
  end

  # POST /users/login
  def login
    authenticate params[:email], params[:password]
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def authenticate(email, password)
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      token = encode_token({ user_id: user.id })
      render json: { auth_token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
