<cfscript>
    
    config = {
        "serviceName" : "DYNAMODB"                                                          
    };

    dynamo = getCloudService(application.cloud_credentials, config);

    options = {
        "TableName":"Student",
        "ProjectionExpression" : "id, subjects", 
        "Limit": 20
    };
    
    try{
        result = dynamo.scan(options, {            
            "customResponse": true            
        });
        writedump(result);
    } catch(any e){
        writeDump(e)
    }

</cfscript>