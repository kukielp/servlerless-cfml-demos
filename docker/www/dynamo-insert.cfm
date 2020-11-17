<cfscript>
    
    config = {
        "serviceName" : "DYNAMODB"                                                          
    };

    dynamo = getCloudService(application.cloud_credentials, config);

    firstName = [ "Adam", "Alex", "Aaron", "Ben", "Carl", "Dan", "David", "Edward", "Fred", "Frank", "George", "Hal", "Hank", "Ike", "John", "Jack", "Joe", "Larry", "Monte", "Matthew", "Mark", "Nathan", "Otto", "Paul", "Peter", "Roger", "Roger", "Steve", "Thomas", "Tim", "Ty", "Victor", "Walter"];	
	lastName = [ "Anderson", "Ashwoon", "Aikin", "Bateman", "Bongard", "Bowers", "Boyd", "Cannon", "Cast", "Deitz", "Dewalt", "Ebner", "Frick", "Hancock", "Haworth", "Hesch", "Hoffman", "Kassing", "Knutson", "Lawless", "Lawicki", "Mccord", "McCormack", "Miller", "Myers", "Nugent", "Ortiz", "Orwig", "Ory", "Paiser", "Pak", "Pettigrew", "Quinn", "Quizoz", "Ramachandran", "Resnick", "Sagar", "Schickowski", "Schiebel", "Sellon", "Severson", "Shaffer", "Solberg", "Soloman", "Sonderling", "Soukup", "Soulis", "Stahl", "Sweeney", "Tandy", "Trebil", "Trusela", "Trussel", "Turco", "Uddin", "Uflan", "Ulrich", "Upson", "Vader", "Vail", "Valente", "Van Zandt", "Vanderpoel", "Ventotla", "Vogal", "Wagle", "Wagner", "Wakefield", "Weinstein", "Weiss", "Woo", "Yang", "Yates", "Yocum", "Zeaser", "Zeller", "Ziegler", "Bauer", "Baxster", "Casal", "Cataldi", "Caswell", "Celedon", "Chambers", "Chapman", "Christensen", "Darnell", "Davidson", "Davis", "DeLorenzo", "Dinkins", "Doran", "Dugelman", "Dugan", "Duffman", "Eastman", "Ferro", "Ferry", "Fletcher", "Fietzer", "Hylan", "Hydinger", "Illingsworth", "Ingram", "Irwin", "Jagtap", "Jenson", "Johnson", "Johnsen", "Jones", "Jurgenson", "Kalleg", "Kaskel", "Keller", "Leisinger", "LePage", "Lewis", "Linde", "Lulloff", "Maki", "Martin", "McGinnis", "Mills", "Moody", "Moore", "Napier", "Nelson", "Norquist", "Nuttle", "Olson", "Ostrander", "Reamer", "Reardon", "Reyes", "Rice", "Ripka", "Roberts", "Rogers", "Root", "Sandstrom", "Sawyer", "Schlicht", "Schmitt", "Schwager", "Schutz", "Schuster", "Tapia", "Thompson", "Tiernan", "Tisler" ];

    for(i = 1; i<arrayLen(firstName); i++){
        strct = {
            "TableName":"Student",
            "Item":{            
                "name": firstName[randRange(1,arrayLen(firstName))] & " " & lastName[randRange(1,arrayLen(lastName))],
                "id": randRange(1000,9999),
                "class": randRange(1,99),
                "subjects": ["Maths", "Science", "History", "Geography"]
            }
        };

        try{
            //Insert this item into the given table
            result = dynamo.putItem(strct);
            //Carry the last item
            tmpStrct = {
                "TableName":"Student",       
                "Key":{               
                    "name": strct.Item.name,
                    "id": strct.Item.id
                }
            }
        } catch(any e){
            writeDump(e);
        }
    }

    
    //Let's grab the last item that was inserted just to check.
    try{
        //Fetch the item from the given table
        result = dynamo.getItem(tmpStrct, {        
            "customResponse": true
        });    
        writedump(result.Item);
    } catch(any e){
        writeDump(e);
    }
</cfscript>