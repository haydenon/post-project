class MailRoutesController < ApplicationController
  before_action :set_mail_route, only: [:show, :edit, :update, :destroy]

  # GET /mail_routes
  # GET /mail_routes.json
  def index
    @mail_routes = MailRoute.all
  end

  # GET /mail_routes/1
  # GET /mail_routes/1.json
  def show
  end

  # GET /mail_routes/new
  def new
    @mail_route = MailRoute.new
  end

  # GET /mail_routes/1/edit
  def edit
  end

  # POST /mail_routes
  # POST /mail_routes.json
  def create
    @mail_route = MailRoute.new(mail_route_params)

    respond_to do |format|
      if @mail_route.save
        format.html { redirect_to @mail_route, notice: 'Mail route was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mail_route }
      else
        format.html { render action: 'new' }
        format.json { render json: @mail_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_routes/1
  # PATCH/PUT /mail_routes/1.json
  def update
    respond_to do |format|
      if @mail_route.update(mail_route_params)
        format.html { redirect_to @mail_route, notice: 'Mail route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mail_route.errors, status: :unprocessable_entity }
      end
    end
	if (@mail_route.margin != params[:mail_route][:margin]) then
        PriceEvent.create!(:route_id => @mail_route.id,:margin => @mail_route.margin)       
		end
  end

  # DELETE /mail_routes/1
  # DELETE /mail_routes/1.json
  def destroy
    @mail_route.destroy
    respond_to do |format|
      format.html { redirect_to mail_routes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_route
      @mail_route = MailRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_route_params
      params.require(:mail_route).permit(:to_id, :from_id, :margin, :priority_id)
    end
end
