<cfscript>
    writeDump(var=form, label="Form");

    writeDump(var=getHTTPRequestData(), label="getHTTPRequestData");

    writeDump(var=GetLambdaContext(), label="GetLambdaContext");

    writeDump(var=GetLambdaContext().getClientContext(), label="GetLambdaContext.getClientContext");

    writeDump(var=GetLambdaEvent, label="GetLambdaEvent");

</cfscript>
