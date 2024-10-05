public class httpCalloutCtrl
{
  @AuraEnabled
    public static Map<String,Object> getCalloutResponseContents(String url)
    {
        Http h=new Http();
        HttpRequest req=new HttpRequest(); //Creating Request
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res=h.send(req);
        System.debug('response-->: '+res.getBody());
       Map<String,object> resultsMap=  (Map<String,object>)JSON.deserializeUntyped(res.getBody());
       System.debug('resultsMap '+resultsMap);
       return resultsMap;
    }

}