class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: {"usuarios": @users, "total": @users.count}
  end

  # GET /users/1
  def show
      render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.id
      render json: {"error": "No se puede crear usuario con id"}, status: :bad_request
    else
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: {"error": "La creación ha fallado"}, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update_attributes(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if User.exists?(params[:id])
        @user = User.find(params[:id])
      else
        render json: {"error": "Usuario no encontrado"}, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :usuario, :nombre, :apellido, :twitter)
    end
end
