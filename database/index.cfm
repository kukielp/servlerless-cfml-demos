Sql Server.
<cfquery name="q" result="r">
    select      agent_code, cust_city, cust_code, cust_name
    from        customer
    Order by    agent_code desc
</cfquery>
<cfdump var="#q#"/>

PostgreSQL
<cfquery name="q" result="r" datasource="pg">
    select      "AGENT_CODE", "CUST_CITY", "CUST_CODE", "CUST_NAME"
    from        customer
    order by    "AGENT_CODE" desc 
</cfquery>
<cfdump var="#q#"/>

MySQL
<cfquery name="q" result="r" datasource="mysql">
    select      agent_code, cust_city, cust_code, cust_name
    from        customer
    Order by    agent_code desc
</cfquery>
<cfdump var="#q#"/>