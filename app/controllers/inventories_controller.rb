class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]

  # GET /inventories or /inventories.json
  def index
    if(params.has_key?(:location_type))
      @inventories = Inventory.where(location_type: params[:location_type]).order("date_added desc")
    else
      @inventories = Inventory.all.order("date_added desc")
    end
    if (params[:location_type] == "")
      @inventories = Inventory.all.order("date_added desc")
    end
    if params[:searchmin] && params[:searchmax]
      @searchmin = params[:searchmin]
      @searchmax = params[:searchmax]
      #if invalid input return no results
      if (params[:searchmin] == "") && (params[:searchmax] == "")
        @inventories = @inventories
      elsif params[:searchmin] == ""
        @inventories = @inventories.between_range(1, @searchmax)
      elsif params[:searchmax] == ""
        @inventories = @inventories.largerthan(@searchmin)
      elsif params[:searchmin].to_i > params[:searchmax].to_i || @searchmin.to_i < 0|| @searchmax.to_i < 0
        @inventories = @inventories.between_range(1, 1)
      else
        @inventories = @inventories.between_range(@searchmin, @searchmax)
      end

    end
  end

  # GET /inventories/1 or /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)
    location_type = params[:location_type]



    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_url, notice: "Inventory was successfully created." }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventories_url, notice: "Inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: "Inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:item_name, :location_type, :quantity, :date_added)
    end
end
