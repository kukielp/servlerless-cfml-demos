<cfscript>
    
    config = {
        "serviceName" : "DYNAMODB"                                                          
    };

    dynamo = getCloudService(application.cloud_credentials, config);

    options= {
        "TableName":"Student",        
        "KeyConditionExpression": "%idKey = :idVal",        
        "ExpressionAttributeNames":{            
            "%idKey": "id"
        },        
        "ExpressionAttributeValues":{            
            ":idVal": 1726
        },
        "Limit": 10
    };
    
    //Fetch the item/items corresponding to the query from the given table
    result = dynamo.query(options);

    writeDump(result);

</cfscript>