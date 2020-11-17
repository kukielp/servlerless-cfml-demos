<cfscript>

    config = {
        "serviceName" : "SNS"
    }
    snsService = getcloudService(application.cloud_credentials, config);
    
    createTopicMetadata = {
        "tags" = [
            {
                "key" = "Project",
                "value" = "CFML_SAMPLES"
            }
        ] 
    };
    topic = snsService.createTopic("test_sms_topic_2",createTopicMetadata);
    
    topicARN = topic.getTopicArn();
    
    subscribeMetadata = {
        "topicArn" = topicARN,
        "endpoint" = "{phone number}",
        "protocol" = "sms"
    }
    subscriptionObj = topic.subscribe(subscribeMetadata);

    publishMetadata = {
        "messageBody" = "Hello from CFML"
    }
    
    publishResponse = topic.publish(publishMetadata);

    writeDump(publishResponse)
</cfscript>