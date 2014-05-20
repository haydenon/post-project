class MailRequestsController < ApplicationController
  before_action :set_mail_request, only: [:show, :edit, :update, :destroy]

  # GET /mail_requests
  # GET /mail_requests.json
  def index
    @mail_requests = MailRequest.all
  end

  # GET /mail_requests/1
  # GET /mail_requests/1.json
  def show
  end

  # GET /mail_requests/new
  def new
    @mail_request = MailRequest.new
  end

  # GET /mail_requests/1/edit
  def edit
  end

  # POST /mail_requests
  # POST /mail_requests.json
  def create
    @mail_request = MailRequest.new(mail_request_params)

    respond_to do |format|
      if @mail_request.save
        format.html { redirect_to @mail_request, notice: 'Mail request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mail_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @mail_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_requests/1
  # PATCH/PUT /mail_requests/1.json
  def update
    respond_to do |format|
      if @mail_request.update(mail_request_params)
        format.html { redirect_to @mail_request, notice: 'Mail request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mail_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_requests/1
  # DELETE /mail_requests/1.json
  def destroy
    @mail_request.destroy
    respond_to do |format|
      format.html { redirect_to mail_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_request
      @mail_request = MailRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_request_params
      params.require(:mail_request).permit(:mail_route_id, :price, :weight, :volume, :priority_id)
    end
end