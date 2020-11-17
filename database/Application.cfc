component {

	this.name="cfmlServerless";
	this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
	this.sessionManagement=false;
	this.clientManagement=false;
	this.setClientCookies=false;

    this.datasources = {
        acf: {
            driver: "other", 
            class: 'com.microsoft.sqlserver.jdbc.SQLServerDriver', 
            url: 'jdbc:sqlserver://acf-private.XXXX.ap-southeast-2.rds.amazonaws.com:1433;databaseName=acf',
            username: server.system.environment.MSSQL_DB_USER,
            password: server.system.environment.MSSQL_DB_PASS
        },
		pg:  {
			driver: "other",
			class:'org.postgresql.Driver',
			url:'jdbc:postgresql://cfml-sample.XXXX.ap-southeast-2.rds.amazonaws.com/CFML',
			username: server.system.environment.PG_DB_USER,
            password: server.system.environment.PG_DB_PASS
		},
		//Cheated and used same credentials as MSSQL
		mysql:  {
			driver: "other",
			class: "com.mysql.jdbc.Driver", 
			url:'jdbc:mysql://mysql-cluster-serverless.cluster-XXXX.ap-southeast-2.rds.amazonaws.com:3306/cfml',
			database: "cfml",
			username: server.system.environment.MSSQL_DB_USER,
            password: server.system.environment.MSSQL_DB_PASS
		}
    };
    this.datasource = "acf";

	function onApplicationStart() {
		application.resultsArray = [];
		return true;
	}

	function onMissingTemplate(){
		include '404.cfm';
	}

	//function onError( any Exception, string EventName ) {
	//	writeOutput("Some error has occured");
	//	abort;
	//}
}