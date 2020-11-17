component {

	this.name="servedockerrless";
	this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
	this.sessionManagement=false;
	this.clientManagement=false;
	this.setClientCookies=false;

	
	this.datasources = {
		pg: {
			driver		= "postgresql",
			//driver		= "other",
			//class 		= "org.postgresql.Driver",
			//url:'jdbc:postgresql://' & server.system.environment.DB_HOST & '/CFML',
			host        = server.system.environment.DB_HOST,
            port        = "5432",
			database	= "CFML",
			username	= server.system.environment.DB_USER,
			password	= server.system.environment.DB_PASS
		},

		mssql:  {
			driver		= "MSSQLServer",
			host        = server.system.environment.MSSQL_HOST,
            port        = "1433",
			database	= "acf",
			username	= server.system.environment.MSSQL_DB_USER,
            password	= server.system.environment.MSSQL_DB_PASS
		}
	};

	this.datasource = "pg";

	function onApplicationStart() {

		application.counter = 0;
        application.cloud_credentials = {
            "vendorName" : "AWS",
            "region" : "ap-southeast-2",
            "accessKeyId" : server.system.environment.TestACCESS_KEY, 
            "secretAccessKey" : server.system.environment.TestSECRET_KEY
        };

		return true;
	}

}