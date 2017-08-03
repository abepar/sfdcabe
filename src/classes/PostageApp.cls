public class PostageApp{
    public static final String API_KEY = 'asumQay8wCKePJXXhjZjncsLtpGJERKQ';
    private static final String BASEURL = 'https://api.postageapp.com/v.1.0/';
    
    public PostageApp(PostageAppHome controller) {
        
    }
    
    public static String makePostCallout(String service, String body){
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint(BASEURL + service + '.json');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(body);
        
        HttpResponse resp = h.send(req);
        return resp.getBody();
    }
    
    public class Wrapper{
        public PostageApp.Response resp{get; set;}
        public PostageApp.Data d{get; set;}
    }
    
    public class Response{
        public String status{get; set;}
        public String uid{get; set;}
    }
    
    public class Data{
        public String methods{get; set;}
    }
}