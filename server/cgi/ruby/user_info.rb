#!/usr/local/bin/ruby
# -*- coding: UTF-8 -*-

require 'json'

info = {
	enyo: [
		{name: "百度",url: "http://www.baidu.com"},
		{name: "新浪",url: "http://www.sina.com"},
		{name: "搜狐",url: "http://www.sohu.com"},
		{name: "网易",url: "http://www.163.com"},
		{name: "appinn",url: "http://www.appinn.com"},
		]
}
print 'Content-Type: application/json\n\n'
print info.to_json