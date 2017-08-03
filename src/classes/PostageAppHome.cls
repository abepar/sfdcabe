public class PostageAppHome{
    public String[] lstMethods{get; set;}
    
    public void getMethodList(){
        String strMethodListResponse = PostageApp.makePostCallout('get_method_list','{"api_key":"' + PostageApp.API_KEY + '"}');
        PostageApp.Wrapper wrap = (PostageApp.Wrapper)JSON.deserialize(strMethodListResponse, PostageApp.Wrapper.class);
        PostageApp.Data data = wrap.d;
        if(data != null){
            this.lstMethods = data.methods.split(', ');
        }else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, 'data is NULL!'));
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, strMethodListResponse));
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, 'wrap: ' + wrap));
        }
    }

}