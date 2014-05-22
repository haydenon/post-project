require 'helpers/helper'
require 'helpers/route_finder'

class MailRequestsController < ApplicationController
  before_action :set_mail_request, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

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

    Rails.logger.debug("My object: #{@mail_request.inspect}")

    route = MailRoute.where(:to_id => @mail_request.to_id, :from_id => @mail_request.from_id,
      :priority_id => @mail_request.priority_id).take

    if route.nil? # if the route doesn't exist, create it
      route = MailRoute.create(:to_id => @mail_request.to_id, :from_id => @mail_request.from_id,
        :priority_id => @mail_request.priority_id, :margin => 1.12) #NEED TO CREATE MECHANISM FOR DEFAULT MARGIN
    end

    @mail_request.price = 14.5 #TEMPORARY PRICE SETTING. EVENTUALLY WILL BE CALCULATED

    @mail_request.mail_route_id = route.id

    path_details = RouteFinder.find_route(Location.find(@mail_request.to_id),Location.find(@mail_request.from_id), DateTime.now , @mail_request.priority_id==1, RouteSegment.all)
    @mail_request.found_route = (!path_details.nil? && path_details[0].size!=0)

    @mail_request.post_completion_at = path_details[1] if !path_details.nil?

    respond_to do |format|
      if @mail_request.found_route & @mail_request.save
        i=0
        path_details[0].each do |seg_rev|
          seg = seg_rev[0]
          rev = seg_rev[1]
          MailRequestRouteSegment.create(:route_segment_id => seg.id, :mail_request_id => @mail_request.id,
            :order => i, :reversed => rev)
          i = i+1
        end
        format.html { redirect_to @mail_request, notice: 'Mail request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mail_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @mail_request.errors, status: :unprocessable_entity }
      end
    end
	 MailEvent.create!(:price => @mail_request.price, :weight => @mail_request.weight,
	 :volume => @mail_request.volume, :priority_id => @mail_request.priority_id)
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
      params.require(:mail_request).permit(:mail_route_id, :price, :weight, :volume, :priority_id, :from_id, :to_id)
    end
end
