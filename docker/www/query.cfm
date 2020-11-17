<cfscript>
    writeDump(application);
    queryObj = new Query(
        datasource = "pg",
        sql = " INSERT 
                INTO		eventlog
                            (event, context)
                VALUES	    (:event, :context)
              "
    ); 
    queryObj.addParam(name="event", value="Test - Event");
    queryObj.addParam(name="context",value="Test - Context");
    resultset = queryObj.execute().getResult();
</cfscript>

<cfquery datasource="pg">
    INSERT 
    INTO		eventlog
                (event, context)
    VALUES	    (<cfqueryparam value="Test - Event" />, <cfqueryparam value="Test - Context" />)
</cfquery>

<cfquery name="q">
    select      *
    from        eventlog
</cfquery>
<cfdump var="#q#" />