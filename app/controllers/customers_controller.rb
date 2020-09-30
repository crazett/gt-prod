class CustomersController < ApplicationController
    #before_action :authenticate_user!
    def index
        @customers = Customer.all
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(gt_params)
            redirect_to root_path
        end
    end

    def show
        @customer = Customer.find(params[:id])
        @q = @customer.gts.ransack(params[:q])
        @gts = @q.result
    end
    
    def new
        @customer = Customer.new
    end
        
    def create
        @customer = Customer.new(customer_parm)
        if @customer.save
            redirect_to root_path
        end
    end

    def destroy
        @customer = Customer.find(params[:id])
        @customer.delete
        redirect_to customers_path
    end

    def customer_parm
        params.require(:customer).permit(:name)
    end
   
end
