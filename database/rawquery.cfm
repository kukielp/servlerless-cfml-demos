<cfquery name="q" result="r">
    select  *
    from    customer
</cfquery>
<cfdump var="#q#"/>
<cfdump var="#r.EXECUTIONTIME#"/>