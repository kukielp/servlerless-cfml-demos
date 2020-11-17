<cfscript>
    config = {
        "serviceName" : "SQS"
    }
    sqsService = getCloudService(application.cloud_credentials, config);
    
    stdQueueUrl = "https://sqs.ap-southeast-2.amazonaws.com/{AWSAccountID}/{queuename}";
    
    receiveMessageMetadata = 
                        {   
                            "messageAttributeNames"="All",
                            "maxNumberOfMessages"=10
                    };
    receiveMessageResp = sqsService.receiveMessage(stdQueueUrl,receiveMessageMetadata);   
    
    totalMessagesCount = arrayLen(receiveMessageResp.messages);
    for(i=1; i<totalMessagesCount+1; i++ ){
        message = receiveMessageResp.messages[i];
        receiptHandle={
            "receiptHandle": message.receiptHandle
        }
        queryObj = new Query(
            datasource = "mssql",
            sql = " INSERT 
                    INTO		sqsMessages
                                (messageBody, messageId)
                    VALUES	    (:messageBody, :messageId)
                "
        ); 
        queryObj.addParam(name="messageBody", value=message.body);
        queryObj.addParam(name="messageId",value=message.messageId);
        queryObj.execute();

        sqsService.deleteMessage(stdQueueUrl,receiptHandle)
    }
    writeDump(receiveMessageResp);
</cfscript>