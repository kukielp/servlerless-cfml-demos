<cfscript>
    
    config = {
        "serviceName" : "DYNAMODB"                                                          
    };

    dynamo = getCloudService(application.cloud_credentials, config);

    strct = {
        "TableName" : "Student",
        "KeySchema":[       
            { 
                "AttributeName": "id", 
                "KeyType": "HASH"
            },  
            { 
                "AttributeName": "name", 
                "KeyType": "RANGE"
            }  
        ],
        "AttributeDefinitions":[       
            {
                "AttributeName": "name", 
                "AttributeType": "S" 
            },
            { 
                "AttributeName": "id", 
                "AttributeType": "N" 
            }
        ],
        "ProvisionedThroughput": {       
            "ReadCapacityUnits": 10, 
            "WriteCapacityUnits": 10
        }
    };    
    
    try{
        //Create a new table
        result = dynamo.createTable(strct);
        writedump(result);
    }
    catch(any exception){
        writedump(exception);
    }

</cfscript>