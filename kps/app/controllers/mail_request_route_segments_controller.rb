class MailRequestRouteSegmentsController < ApplicationController
  before_action :set_mail_request_route_segment, only: [:show, :edit, :update, :destroy]

  # GET /mail_request_route_segments
  # GET /mail_request_route_segments.json
  def index
    @mail_request_route_segments = MailRequestRouteSegment.all
  end

  # GET /mail_request_route_segments/1
  # GET /mail_request_route_segments/1.json
  def show
  end

  # GET /mail_request_route_segments/new
  def new
    @mail_request_route_segment = MailRequestRouteSegment.new
  end

  # GET /mail_request_route_segments/1/edit
  def edit
  end

  # POST /mail_request_route_segments
  # POST /mail_request_route_segments.json
  def create
    @mail_request_route_segment = MailRequestRouteSegment.new(mail_request_route_segment_params)

    respond_to do |format|
      if @mail_request_route_segment.save
        format.html { redirect_to @mail_request_route_segment, notice: 'Mail request route segment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mail_request_route_segment }
      else
        format.html { render action: 'new' }
        format.json { render json: @mail_request_route_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_request_route_segments/1
  # PATCH/PUT /mail_request_route_segments/1.json
  def update
    respond_to do |format|
      if @mail_request_route_segment.update(mail_request_route_segment_params)
        format.html { redirect_to @mail_request_route_segment, notice: 'Mail request route segment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mail_request_route_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_request_route_segments/1
  # DELETE /mail_request_route_segments/1.json
  def destroy
    @mail_request_route_segment.destroy
    respond_to do |format|
      format.html { redirect_to mail_request_route_segments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_request_route_segment
      @mail_request_route_segment = MailRequestRouteSegment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_request_route_segment_params
      params.require(:mail_request_route_segment).permit(:route_segment_id, :mail_request_id)
    end
end
