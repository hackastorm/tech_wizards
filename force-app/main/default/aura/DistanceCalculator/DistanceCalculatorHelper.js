({
    /*
     This method is to make a callout to Google Distance Matrix API and get the distance between
     the source and destination point.
   */
	calculateSourceDestinationDistance : function(component, event, helper) {
        var action = component.get("c.getDistance");
        action.setParams({"source" : component.get('v.source') ,
                          "destination" : component.get('v.destination')}); 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               var distance = response.getReturnValue();
               component.set('v.distance',distance);
            }
            else if (state === "INCOMPLETE") {
               console.log('==========State Incomplete========');
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
		
	},
    
    /*
        This method is to show map.
    */
    plotMapMarker : function(component, event, helper) {
       	component.set('v.mapMarkers', [
            {
                location: {
                    Country: component.get('v.source'),
                },
			 },
            {
                location: {
                   Country: component.get('v.destination'),
                },
			}
        ]); 
      
	}
})