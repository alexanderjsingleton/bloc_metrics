 class API::EventsController < ApplicationController
# #3
   skip_before_action :verify_authenticity_token
 
   def create
     application = Application.find_by(url: request.env['HTTP_ORIGIN'])
      if application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
      elsif @event = application.events.build(event_params)
         @event.save
         render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  

   private
   
   def event_params
     params.require(:event).permit(:name)
   end

 end

 # curl command for API
 # curl -v -H "Accept: application/json" -H "Origin: http://registered_application.com" -H "Content-Type: application/json" -X POST -d '{"event_name":"foobar"}'  http://localhost:3000/api/events