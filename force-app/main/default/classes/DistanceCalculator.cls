/**
The DistanceCalculator Class implements an application to calculate distance between source and destination.
* @Amey Waze 
* @version 1.0
* @since 2019-06-15 
*/
public with sharing class DistanceCalculator {
    /**
    * This method is to make a callout to Google Distance Matrix API and get the distance between the source and destination point.
    * @param source - The first parameter is to pass the source address.
    * @param destination - The second parameter is to pass the destination address.
    */
    @AuraEnabled
    public static String getDistance(String source, String destination) {
        String distance = '';
        String url = 'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=' + source + '&destinations=' + destination + '&key=' + Label.API_key;
        System.debug('url = ' + url);
		Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(url);
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        //response.setBody('{"destination_addresses" : [ "New York, NY, USA" ],"origin_addresses" : [ "Washington, DC, USA" ],"rows" : [{"elements" : [{"distance" : {"text" : "226 mi","value" : 363999},"duration" : {"text" : "3 hours 51 mins","value" : 13885},"status" : "OK"}]}],"status" : "OK"}');
       	Map<String, Object> mapResult = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        for(String key : mapResult.keySet()) {
            if(String.valueOf(key) == 'rows') {
                List<Object> lstRows = (List<Object>)mapResult.get(key);
                for(Object row : lstRows) {
                    Map<String, Object> mapRows = (Map<String, Object>)row;
                    List<Object> lstEle = (List<Object>)mapRows.get('elements');
                    for(Object elem : lstEle) {
                        Map<String, Object> mapElem = (Map<String, Object>)elem;
                        System.debug('mapElem = ' + mapElem);
                        Map<String, Object> mapDist = (Map<String, Object>)mapElem.get('distance');
                        System.debug('distance = ' + mapDist.get('text'));
                        distance = String.valueOf(mapDist.get('text'));
                    }
                }
            }
        }
        return distance;
    }
}