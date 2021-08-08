class Public::CustomersController < ApplicationController
  def show
    @user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    @end_user.update(customers_params)
    redirect_to customers_path
  end

  def confirm
    @end_user = current_end_user
  end

  def quit
    @end_user = current_end_user
    
    @end_user.update(is_active: true)
      reset_session
      redirect_to root_path
    
  end
  private
  
  def customers_params
    params.require(:end_user).permit(:last_name,:first_name,:last_name_furigana,:first_name_furigana,:postal_code,:address,:phone_number,:email)
  end
end
