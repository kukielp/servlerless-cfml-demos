<cfscript>
    s3Conf = {
        "serviceName" : "S3"
    }
    storageService = getCloudService(application.cloud_credentials, s3Conf);
    bucketList=storageService.listAll(); // lists all buckets //
    writeDump(bucketList);
</cfscript>