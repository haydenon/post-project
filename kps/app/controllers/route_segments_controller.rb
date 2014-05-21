require 'helpers/helper'

class RouteSegmentsController < ApplicationController
  before_action :set_route_segment, only: [:show, :edit, :update, :destroy]

  # GET /route_segments
  # GET /route_segments.json
  def index
    @route_segments = RouteSegment.all
  end

  # GET /route_segments/1
  # GET /route_segments/1.json
  def show
  end

  # GET /route_segments/new
  def new
    @route_segment = RouteSegment.new
  end

  # GET /route_segments/1/edit
  def edit
  end

  # POST /route_segments
  # POST /route_segments.json
  def create
    @route_segment = RouteSegment.new(route_segment_params)

    respond_to do |format|
      if @route_segment.save
        format.html { redirect_to @route_segment, notice: 'Route segment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @route_segment }
      else
        format.html { render action: 'new' }
        format.json { render json: @route_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /route_segments/1
  # PATCH/PUT /route_segments/1.json
  def update
	if ((@route_segment.costVolume != params[:route_segment][:costVolume]) or (@route_segment.costWeight != params[:route_segment][:costWeight])) then
        CostEvent.create!(:route_id => @route.id,:costWeight => @route_segment.costWeight, 
          :costVolume => @route_segment.costVolume)       
		end
	if(@route_segment.active != params[:route_segment][:active]) then
		DiscontinueEvent.create!(:route_id => @route.id)
		end
    respond_to do |format|
      if @route_segment.update(route_segment_params)
        format.html { redirect_to @route_segment, notice: 'Route segment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @route_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /route_segments/1
  # DELETE /route_segments/1.json
  def destroy
    @route_segment.destroy
    respond_to do |format|
      format.html { redirect_to route_segments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route_segment
      @route_segment = RouteSegment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_segment_params
      params.require(:route_segment).permit(:from_id, :to_id, :active, :cost, :duration, :costVolume, :costWeight, :company_id, :day, :frequency)
    end
end
