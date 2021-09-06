@RestResource(urlMapping='/contact/*')
global with sharing class SimpleWebService {
    
    @HttpGet
    global static Contact getContactByLastName() {
        RestRequest request = RestContext.request;
        String lastName = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Contact contact = [ 
                    SELECT FirstName, LastName, Email 
                    FROM Contact 
                    WHERE LastName = :lastName
                    LIMIT 1
                  ];
        System.debug(contact);
        return contact;
    }
}