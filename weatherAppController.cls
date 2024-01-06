public with sharing class weatherAppController {

    @AuraEnabled(cacheable=true)
    public static string getWeatherDetails(String input){
        String url = 'https://api.openweathermap.org/data/2.5/weather?q=' + input + '&units=metric' + getKey();
        String response = getResponse(url);
        return response;
    }

    public static string getResponse(string strUrl){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint(strUrl);
        req.setTimeout(120000);
        res = h.send(req);
        String responseBody = res.getBody();
        return responseBody;
    }

    public static String getKey(){
        string key = '9489af3220e76e60be28223e1a3fa49c';
        string output = '&appid=' + key;
        return output;
    }
}