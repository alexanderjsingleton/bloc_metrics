 class API::EventsController < ApplicationController
   before_filter :cors_preflight_check
   after_filter :set_headers
   skip_before_action :verify_authenticity_token
 
   def create
     application = Application.find_by(url: request.env['HTTP_ORIGIN'])
     puts application.inspect
      if application.nil?
        render json: "Unregistered application", status: :unprocessable_entity
      else
        @event = application.events.build(event_params)
        if @event.save
          render json: @event, status: :created
        else
          render @event.errors, status: :unprocessable_entity
        end
      end
    end
  

   private
   
  def event_params
    params.require(:event).permit(:event_name)
  end

  # https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest

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

 # curl command for API
 # curl -v -H "Accept: application/json" -H "Origin: www.yahoo.com" -H "Content-Type: application/json" -X POST -d '{"event_name":"foobar"}'  http://localhost:3000/api/events

 # curl -v -H "Accept: application/json" -H "Origin: http://localhost:3000" --header "Content-type: application/json" -X POST -d '{"name":"foobar"}'  http://localhost:3001/api/events


 # Running multiple servers
 # Specify port
 ## rails s for default localhost:3000 OR rails server -p 3001
 #Running on alternate address
 ## bundle exec rails s -p 3001 -P tmp/pids/server2.pid