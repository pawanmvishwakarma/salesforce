public with sharing class ApexCallOut {
    private String endPoint = 'https://th-apex-http-callout.herokuapp.com/animals';
    
    public ApexCallOut() { }

    public List<Object> makeCallOut(){
        List<Object> animals = new List<Object>();
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint(endPoint);
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

            animals = (List<Object>) result.get('animals');

            for (Object animal : animals) {
                System.debug(animal);
            }

            
        }
        return animals;
    }

    public void makeCallPostOut(){
        List<Object> animals = new List<Object>();
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint(endPoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);

        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
    }
}