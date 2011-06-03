# simples3
## Install
### RubyGems.org
	$ gem install simples3

### from source
	$ git clone http://github.com/forrestgrant/simples3
	$ cd simples3
	$ rake build
	$ rake install

## Configuration
  Add `config/simples3.yml` with the following:

	development:
	  bucket_name: appname_development
	  access_key_id: 
	  secret_access_key:
	
	test:
	  bucket_name: appname_test
	  access_key_id: 
	  secret_access_key: 
	
	production:
	  bucket_name: appname
	  access_key_id: 
	  secret_access_key:


## Usage
  See `lib/simples3.rb` for methods