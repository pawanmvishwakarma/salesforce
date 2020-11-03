@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountRestService {
    
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;

        ID accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);

        Account acc = [SELECT Id, Name, Phone, Website FROM Account WHERE Id=:accountId];

        return acc;
    }
}