# Usage

How to use `rubyc` tool in docker? 
https://github.com/pmq20/ruby-packer

### Install docker tool:

https://docs.docker.com/v17.12/install/

Straight link for Ubuntu install:

https://docs.docker.com/v17.12/install/linux/docker-ce/ubuntu/

### Clone it

`git clone git@github.com:iamsimakov/rubyc-usage-example.git`

### Build

`cd rubyc-usage-example/examples`

Select what example you want to build and:

`docker build ./`

... will take ~10 mins and near 10GB memory usage

Sample output will finished with lines:

<pre>
...
linking ruby
make[2]: Leaving directory '/tmp/rubyc/ruby-2.4.1-0.4.0'
make[1]: Leaving directory '/tmp/rubyc/ruby-2.4.1-0.4.0'
-> cp "ruby" "/usr/src/app/a.out"
-> cd /usr/src/app
Removing intermediate container e9fba5750acd
 ---> 200de23ba865
Successfully built 200de23ba865
</pre>

### Run app

1) Script:

`docker run -it 200de23ba865 bash`
`./a.out`
or
`docker run -it 200de23ba865 ./a.out`

Sample output:
<pre>
### Search for nodes by css
### Search for nodes by xpath
### Or mix and match.
</pre>

2) Rails app

`docker run -it 200de23ba865 bash`
`./a.out server -e production`
or
`docker run -p 3001:3000 -it 200de23ba865 ./a.out server -e production -p 3000`

And from you host machine: http://localhost:3001/

This example rails app generate from rails v5.2 template.
With applying next changes:
1) add to Gemfile `gem 'nokogiri', '~> 1.10', '>= 1.10.1'` to test building app with native extensions
2) add to Gemfile `gem 'therubyracer'` to working assets compiling(node runtime)
3) add to Gemfile `gem 'tzinfo-data'` to internal work with data
4) comment Gemfile `gem 'bootsnap', '>= 1.1.0', require: false`
5) `config/boot.rb` comment `require 'bootsnap/setup'`
6) `config/environments/production.rb` change cache store config `config.cache_store = :memory_store, { size: 64.megabytes }`

! Note: `rubyc` build readonly file system that's why you can not:
1) run app in development env with watching files, but you can config development env without watching files - so run app with `production` env
2) use rails cache with file_store in local Rails.root folder - you must use another folder such as `/tmp/my_cache/` or memory cache
3) compile assets on the fly - you must compile assets before packing app

# Recomendations 

More info read: https://github.com/pmq20/ruby-packer

Based on: https://github.com/pmq20/ruby-packer/issues/39#issuecomment-415494119
