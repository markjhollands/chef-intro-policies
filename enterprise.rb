# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'enterprise'

include_policy 'base', path: './base.lock.json'

# Where to find external cookbooks:
default_source :supermarket

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'
cookbook 'ntp', '~> 3.6.2'

# run_list: chef-client will run these recipes in the order specified.
run_list 'ntp'

# Override the Chef Client cookbook with the following attributes
override['audit']['profiles']['linux-patch-baseline'] = { 'url': 'https://github.com/dev-sec/linux-patch-baseline/archive/0.4.0.zip' }