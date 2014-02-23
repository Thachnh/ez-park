class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  # GET /blocks
  # GET /blocks.json
  def index
    # @block = Block.all
    d_lat = 0.0001
    d_lon = 0.0001
    if (params.has_key?(:limit))
      limit = params[:limit]
    else
      limit = 10
    end
    if (params.has_key?(:address))
      address = params[:address]
      @blocks = Block.where("address = ?", address)
    elsif (params.has_key?(:lat) and params.has_key?(:lon))
      lat_max = params[:lat].to_f + d_lat
      lat_min = params[:lat].to_f - d_lat
      lon_max = params[:lon].to_f + d_lon
      lon_min = params[:lon].to_f - d_lon
      if (params.has_key?(:status))
        status = params[:status]
        @blocks = Block.where("lat between ? AND ? AND lon between ? AND ? AND status = ?", lat_min,
          lat_max, lon_min, lon_max, status).limit(limit)
      else
        @blocks = Block.where("lat between ? AND ? AND lon between ? AND ?", lat_min,
          lat_max, lon_min, lon_max).limit(limit)
      end
    elsif (params.has_key?(:status))
      @blocks = Block.where("status = ?", status).limit(limit)
    else
      @blocks = Block.all.limit(limit)
    end
    
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
  end

  # GET /blocks/new
  def new
    @block = Block.new
  end

  # GET /blocks/1/edit
  def edit
  end

  # POST /blocks
  # POST /blocks.json
  def create
    @block = Block.new(block_params)

    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.json { render action: 'show', status: :created, location: @block }
      else
        format.html { render action: 'new' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blocks/1
  # PATCH/PUT /blocks/1.json
  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:address, :lat, :lon, :rate, :limit, :count, :fromDay, :toDay, :fromHour, :toHour, :status)
    end
end
