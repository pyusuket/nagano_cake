class Public::CustomersController < ApplicationController
  def show 
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end
  
  def confirm
    
  end
  
  def withdraw
    @customer = current_customer
    @customer.is_active = false
    @customer.update(is_active: false)
    sign_out @customer
    redirect_to top_path
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code , :address, :telephone_number, :email, :is_active)
  end
end
