#!/usr/local/bin/ruby
# -*- coding: UTF-8 -*-

require 'json'
require 'mysql2'

mysql = Mysql2::Client.new(
	:host => "localhost", 
	:username => "deploy",
	:password=>"deploy",
	:database=>"handylink",
	:socket=>"/tmp/mysql.sock")
username = "default"
result = mysql.query("select title,url from link where username='#{username}'")

link_data = Array.new
result.each { |row|
	p row
	link_data.push(row)
}

print "Content-Type: application/json;charset=utf-8\n\n"
print link_data.to_json
