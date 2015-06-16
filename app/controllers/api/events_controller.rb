class API::EventsController < ApplicationController
  before_filter :cors_preflight_check
  after_filter :set_headers
  skip_before_action :verify_authenticity_token

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if registered_application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = registered_application.events.build(event_params)
        if @event.save
          render json: @event, status: :created
        else
          render @event.errors, status: :unprocessable_entity
        end
    end
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end

  ## curl statement used that works
  #curl -v -H "Accept: application/json" -H "Origin: http://localhost:3000" --header "Content-type: application/json" -X POST -d '{"name":"foobar8"}'  http://localhost:4000/api/events
  
  # Allows resources to be shared across domains -- cross-origin resource sharing
  def set_headers
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Allow-Methods'] = "POST, GET, OPTIONS"
    headers['Access-Control-Allow-Headers'] = "Access-Control-Allow-Origin, Content-Type"
  end

  # A CORS preflight check allows poorly designd and legacy servers to support CORS by executing a sanity check
  # between client and server
  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, X-Requested-With, X-Prototype-Version, Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'
    render text: "" if request.method == "OPTIONS"
  end

end