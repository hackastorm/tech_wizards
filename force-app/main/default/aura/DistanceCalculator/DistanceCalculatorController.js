({
    /*
        This method is to make a call to a helper method.
     */
    init: function (component, event, helper) {
         helper.plotMapMarker(component, event, helper);
    },
    
    /*
        This method is to make a call to a helper method.
    */
	calculateDistance : function(component, event, helper) {
        helper.calculateSourceDestinationDistance(component, event, helper);
        helper.plotMapMarker(component, event, helper);
    }
	
})