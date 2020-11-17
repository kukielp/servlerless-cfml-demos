<cfcomponent>

    <cffunction name="serverlessEvent">
        <cfargument name="event" />
        <cfargument name="context" />

        <cfloop array="#event['records']#" index="object">
            <cfscript>

                var bucket = object['s3']['bucket']['name'];
                var key = object['s3']['object']['key'];

                var config = {
                    "serviceName" : "S3"                                                          
                };

                var s3 = cloudService(application.cloud_credentials, config);

                fileToDownload = key
                downloadStruct = {
                    "destinationFile" : "/tmp/" & fileToDownload,
                    "key" : fileToDownload
                };
                var downloadResponse = s3.root(bucket,true)
                downloadResponse.downloadToFile(downloadStruct);
                var customerDataFileLocal = "/tmp/" & fileToDownload;
                var customerData = fileRead(customerDataFileLocal);
                fileDelete(customerDataFileLocal);
                
        </cfscript>
        <cfset var customerId = listFirst(fileToDownload, ".") />
        <cfquery datasource="pg">
            INSERT 
            INTO		customerdata
                        (customerid, customerdata)
            VALUES	    (<cfqueryparam value="#customerId#" />, 
                        <cfqueryparam value="#customerData#" />)
        </cfquery>
        </cfloop>
        

        <cfreturn true />
    </cffunction>

</cfcomponent>