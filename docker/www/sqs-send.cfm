<cfscript>
    config = {
        "serviceName" : "SQS"
    }
    sqsService = getCloudService(application.cloud_credentials, config);
    
    stdQueueUrl = "https://sqs.ap-southeast-2.amazonaws.com/{AWSAccountID}/{queuename}";
    
    for(i=1; i<10; i++){
        sendMessageMetadata = {   
                "messageBody"="Test Message : " & i
        };
        sentMessageResp = sqsService.sendMessage(stdQueueUrl,sendMessageMetadata);  
    }
    writeDump(sentMessageResp);
</cfscript>