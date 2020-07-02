class SignUpController < ApplicationController
  def index
  end


  def sign_up
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to posts_path
  end


  private
  def user_params
    params.require(:user).permit(:nickname,:email,:encrypted_password,:family_name,:first_name,:family_name_kana,:first_name_kana,:birthday,:destination_family_name,:destination_first_name,:destination_family_name_kana,:destination_first_name_kana,:postal_code,:prefecture,:prefecture,:city,:address,:building_name,:phone_number,)
  end


end
