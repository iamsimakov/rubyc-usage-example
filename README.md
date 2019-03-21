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

`cd rubyc-usage-example && docker build ./`

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

# Recomendations for Rails Apps

Modify Dockerfile as you want to build yor app.
For example, to build rails change last line to 

`RUN rubyc bin/rails`

More info read: https://github.com/pmq20/ruby-packer

Based on: https://github.com/pmq20/ruby-packer/issues/39#issuecomment-415494119

