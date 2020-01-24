public class ConsumeAPI {
	public static void apiTest(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://dev.mond-cloud.com:443/FlashGlobalFT_ProofOfDelivery/submitProofOfDelivery');
		req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        req.setBody('{"PODDate":"2019-02-05T07:58:00","Signature":"Scott keeton","Customer":"RevolutionRetailSystems","CustomerRef":"373569","FlashOrderNumber":84270,"CustServiceCode":"Scheduled","CustCarrierCode":"","DepotCode":"111","CustomerRef2":"74626","OrderLines":[{"PartNumber":"644-0133-148S","SerialNumber":"KP00005240","Qty":1,"CustomerLineRef":"111636"},{"PartNumber":"644-0133-149S","SerialNumber":"KP4836","Qty":1,"CustomerLineRef":"111637"}]}');
        HttpResponse res = http.send(req);
        system.debug(res.getStatusCode());
        system.debug(res.getBody());
        
    }
}