({
    getCityDetails : function(component, event, helper){		 
 
	var selectedItem = event.currentTarget;
        var placeid = selectedItem.dataset.placeid;
 
	var params = {
	   "placeId" : placeid  	
	} 
 
	helper.callServer(component,"c.getPlaceDetails",function(response){
		var placeDetails = JSON.parse(response); 		 
		component.set('v.location',placeDetails.result.name);	
		component.set('v.predictions',[]); 
	},params);	
 
}
})