class GtsController < ApplicationController
    before_action :authenticate_user!
    def index
        @q = Gt.ransack(params[:q])
        @x = Gt.ransack(params[:x])
        @gts = @q.result.order(priority: :desc).order("deliver_date").where(done: false)
        @gts_done = @x.result.order(priority: :desc).order("deliver_date").where(done: true).where("deliver_date < ?", Date.today + 2.weeks)
        respond_to do |format|
            format.html
            format.js
        end
    end

    def show
        @gt = Gt.find(params[:id])
    end

    def update
        @gt = Gt.find(params[:id])
        @flash_hash = {}
        if @gt.update(gt_params)
            @customer   = Customer.where(name: @gt.customer_name).first_or_create(name: @gt.customer_name)
            @worker     = Worker.where(name: @gt.worker_name).first_or_create!(name: @gt.worker_name) if @gt.worker_name != ""
            @approver   = Worker.where(name: @gt.approver_name).first_or_create!(name: @gt.approver_name) if @gt.approver_name != ""
            @flash_hash[:success] = "Uppdaterade Order"
            if @gt.done?
                redirect_to root_path, flash: @flash_hash
            else
                redirect_to gt_path(@gt), flash: @flash_hash
            end
        else
            flash.now[:error] = @gt.errors.full_messages[0]
            render "new"
        end
        @gt.update(customer: @customer) if @customer
        @gt.update(worker_id: @worker.id) if @worker
        @gt.update(approver_id: @approver.id) if @approver
        if @gt.etching == "Standard" || @gt.etching == "standard" 
            @gt.update(etching: @gt.ref_num)
        end
    end

    def new
        @gt = Gt.new
    end
    
    def create
        @gt = Gt.new(gt_params)
        @customer   = Customer.where(name: @gt.customer_name).first_or_create(name: @gt.customer_name)
        @worker     = Worker.where(name: @gt.worker_name).first_or_create!(name: @gt.worker_name) if @gt.worker_name != ""
        @approver   = Worker.where(name: @gt.approver_name).first_or_create!(name: @gt.approver_name) if @gt.approver_name != ""
        if @gt.save
            redirect_to root_path
        else
            flash.now[:error] = @gt.errors.full_messages[0]
            render "new"
        end
        @gt.update(customer: @customer) if @customer
        @gt.update(worker_id: @worker.id) if @worker
        @gt.update(approver_id: @approver.id) if @approver
    end

    def destroy
        @gt = Gt.find(params[:id])
        @gt.delete
        redirect_to :back
    end

    def statistik
        @q = Gt.ransack(params[:q])
        @gts = @q.result
        @gts_ordered = @gts.order('deliver_date')
        @gts_month = @gts_ordered.group_by { |t| t.deliver_date.beginning_of_month }
        @gts_grouped = @gts.group(:width, :length, :degree).order(:width).order(:length).order(:degree).count
    end

    def sortera
        @q = Gt.ransack(params[:q])
        @gts = @q.result
        @gts_ordered = @gts.order('deliver_date')
        @gts_month = @gts_ordered.group_by { |t| t.deliver_date.beginning_of_month }
    end

    def update_prio
        @gt = Gt.find(params[:id])
        respond_to do |format|
            format.js
        end
    end

    def update_checkboxes
        @gt = Gt.find(params[:id])
        respond_to do |format|
            format.js
        end
    end

    def senast_levererad
        @q = Gt.ransack(params[:q])
        @gts_done = @q.result.order(priority: :desc).order("deliver_date").where(done: true).where("deliver_date < ?", Date.today + 2.weeks)
        respond_to do |format|
            format.js
        end
    end

    def arkiv
        @q = Gt.ransack(params[:q])
        @gts_arkiv = @q.result.order(priority: :desc).order("deliver_date")
        respond_to do |format|
            format.js
            format.html
        end
    end

    def gt_params
        params.require(:gt).permit(:order_date, :deliver_date, :customer_id, :ref_num, :length, :amount, :width,
                                   :degree, :rivet, :under_steel, :quality, :precut_gt, :precut_extra_steel,
                                   :etching, :pipe, :packing, :gt_tool, :gt_flexo, :gt_engraving, :comment,
                                   :worker_id, :approver_id, :customer_name, :worker_name, :approver_name, :done)
    end
end
