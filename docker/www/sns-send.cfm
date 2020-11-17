<cfscript>
    config = {
        "serviceName" : "SNS"
    }
    snsService = getCloudService(application.cloud_credentials, config);
    messageData = {
        "messageBody": "Hello from CFML",
        //"phoneNumber": "+{yourphonenumber}"
        "topicArn": "{topicARN}"
    }
    result = snsService.publish(messageData);
    
    writeDump(result);
    writeDump(snsService);
</cfscript>