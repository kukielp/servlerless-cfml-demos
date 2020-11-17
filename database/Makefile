.PHONY: build clean deploy

build:
	./cfusion/bin/lambdazip.sh
	
clean:
	rm ./cfusion/bin/dist/*.zip
	rm ./cfusion/bin/*.log

deploy: clean build
	sam deploy