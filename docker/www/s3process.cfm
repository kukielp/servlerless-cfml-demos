ColdFusion 2020:1
<cfscript>



    s3Conf = {
        "serviceName" : "S3"
    }
    storageService = getCloudService(application.cloud_credentials, s3Conf);
    bucketList = storageService.listAll();
    writeDump(bucketList);

    fileToDownload = "CUS-1111.txt"
    downloadStruct = {
        "destinationFile" : expandPath(fileToDownload),
        "key" : fileToDownload
    };
    downloadResponse = storageService.root("aaa-cfml-bucket",true);
    writeDump(downloadResponse.listAll())
    r = downloadResponse.downloadToFile(downloadStruct);
    customerDataFileLocal = expandPath(fileToDownload);
    customerData = fileRead(customerDataFileLocal);
    
    writeDump(customerData);
</cfscript>