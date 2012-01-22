require 'hashie'

# The Hashie gem gives us convient ways to work with ruby hashes
# http://intridea.com/2009/11/12/hashie-the-hash-toolkit
Hash.send :include, Hashie::HashExtensions
