<cfif structKeyExists(url, 'filter')>
    <cfset arrayAppend(application.resultsArray,url.filter) />
</cfif>

<cfquery name="q" datasource="pg">
    select      customer_id, contact_title
    from        customers
    <cfif structKeyExists(url, 'filter')>
        where       contact_title like <cfqueryparam value="%#filter#%" cfsqltype="CF_SQL_VARCHAR" />
    </cfif>
</cfquery>
<cfdump var="#q#" />