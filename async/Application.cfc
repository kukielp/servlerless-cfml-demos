component {

	this.name = "s3EventTrigger";
	this.sessionManagement = false;
	this.clientManagement = false;
	this.setClientCookies = false;

	this.datasources = {
		pg: {
			driver: "other",
			class:'org.postgresql.Driver',
			url:'jdbc:postgresql://' & server.system.environment.JBDC_CONNECTIONSTRING,
			username: server.system.environment.DB_USER,
            password: server.system.environment.DB_PASS
		}
    };

	function onApplicationStart(){
		application.cloud_credentials = {
			"vendorName" : "AWS",
			"region" : "ap-southeast-2",  //set you your region
			"accessKeyId" : server.system.environment.TESTACCESS_KEY, 
			"secretAccessKey" : server.system.environment.TESTSECRET_KEY
		};

		return true;
	}
	
    this.datasource = "pg";

}