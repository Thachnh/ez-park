class MetersController < ApplicationController
  before_action :set_meter, only: [:show, :edit, :update, :destroy]

  # GET /meters
  # GET /meters.json
  def index
      max = 1650
      dmax = 50
      n = 20
      b = (1..max).to_a.shuffle[0,n]
      c = (1..dmax).to_a.shuffle[0,n]
      t = 0

      b.each do |bid|
        block = Block.find(bid)
        block.count = c[t] - 10
        t = (t + 1)%dmax
        block.save
      end
    @meters = Meter.all
  end

  # GET /meters/1
  # GET /meters/1.json
  def show
  end

  # GET /meters/new
  def new
    @meter = Meter.new
  end

  # GET /meters/1/edit
  def edit
  end

  # POST /meters
  # POST /meters.json
  def create
    @meter = Meter.new(meter_params)

    respond_to do |format|
      if @meter.save
        format.html { redirect_to @meter, notice: 'Meter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meter }
      else
        format.html { render action: 'new' }
        format.json { render json: @meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meters/1
  # PATCH/PUT /meters/1.json
  def update
    respond_to do |format|
      if @meter.update(meter_params)
        format.html { redirect_to @meter, notice: 'Meter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meters/1
  # DELETE /meters/1.json
  def destroy
    @meter.destroy
    respond_to do |format|
      format.html { redirect_to meters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meter
      @meter = Meter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meter_params
      params.require(:meter).permit(:lat, :long, :block_id, :meter_number, :rate, :status)
    end
end
