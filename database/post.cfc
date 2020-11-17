component output="true" {
	
	remote string function helloWorld(string name="Nameless") {
	    return "Hello, #arguments.name#";	
    }

    remote array function getNames() {
        return ["Ray","Scott","Todd","Jason","Booger"];
    }
}