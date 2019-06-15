({
    getCities : function(component, event, helper){	
	 
	var params = {
	  "input" : component.get('v.location')	
	} 
 
	helper.callServer(component,"c.getSuggestions",function(response){
		var resp = JSON.parse(response);	
		console.log(resp.predictions);
		component.set('v.predictions',resp.predictions);	
	},params);	
 
}
})