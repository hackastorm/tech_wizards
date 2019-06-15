@isTest
global class HTTPMockResponseGenerator implements HttpCalloutMock{
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setStatus('OK');
        response.setStatusCode(200);
        //if(req.getBody().contains('Pune') && req.getBody().contains('Mumbai')){
            response.setBody( '{'
                             + '"destination_addresses" : [ "Mumbai, Maharashtra, India" ],'
                             + '"origin_addresses" : [ "Pune, Maharashtra, India" ],'
                             + '      "rows" : ['
                             + '         {'
                             + '            "elements" : ['
                             + '               {'
                             + '                  "distance" : {'
                             + '                     "text" : "93.2 mi",'
                             + '                     "value" : 149936'
                             + '                  },'
                             + '                  "duration" : {'
                             + '                     "text" : "2 hours 49 mins",'
                             + '                     "value" : 10135'
                             + '                 },'
                             + '                 "status" : "OK"'
                             + '              }'
                             + '            ]'
                             + '         }'
                             + '      ], '
                             + '      "status" : "OK" '
                             + '}');
            return response;
        //}
    }
}