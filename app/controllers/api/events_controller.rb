 class API::EventsController < ApplicationController
# #3
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

 end

 # curl command for API
 # curl -v -H "Accept: application/json" -H "Origin: www.yahoo.com" -H "Content-Type: application/json" -X POST -d '{"event_name":"foobar"}'  http://localhost:3000/api/events