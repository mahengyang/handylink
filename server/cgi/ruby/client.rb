#!/usr/local/bin/ruby
# -*- coding:UTF-8 -*- 

class ClientInfo
    def self.GetInfo(keys) 
        result = Hash.new

        result["AUTH_TYPE"] = ENV["AUTH_TYPE"]  if keys.include?("AUTH_TYPE")
        result["HTTP_HOST"] = ENV["HTTP_HOST"]  if keys.include?("HTTP_HOST")
        result["REMOTE_IDENT"] = ENV["REMOTE_IDENT"]  if keys.include?("REMOTE_IDENT")
        result["CONTENT_LENGTH"] = ENV["CONTENT_LENGTH"]  if keys.include?("CONTENT_LENGTH")
        result["HTTP_NEGOTIATE"] = ENV["HTTP_NEGOTIATE"]  if keys.include?("HTTP_NEGOTIATE")
        result["REMOTE_USER"] = ENV["REMOTE_USER"]  if keys.include?("REMOTE_USER")
        result["CONTENT_TYPE"] = ENV["CONTENT_TYPE"]  if keys.include?("CONTENT_TYPE")
        result["HTTP_PRAGMA"] = ENV["HTTP_PRAGMA"]  if keys.include?("HTTP_PRAGMA")
        result["REQUEST_METHOD"] = ENV["REQUEST_METHOD"]  if keys.include?("REQUEST_METHOD")
        result["GATEWAY_INTERFACE"] = ENV["GATEWAY_INTERFACE"]  if keys.include?("GATEWAY_INTERFACE")
        result["HTTP_REFERER"] = ENV["HTTP_REFERER"]  if keys.include?("HTTP_REFERER")
        result["SCRIPT_NAME"] = ENV["SCRIPT_NAME"]  if keys.include?("SCRIPT_NAME")
        result["HTTP_ACCEPT"] = ENV["HTTP_ACCEPT"]  if keys.include?("HTTP_ACCEPT")
        result["HTTP_USER_AGENT"] = ENV["HTTP_USER_AGENT"]  if keys.include?("HTTP_USER_AGENT")
        result["SERVER_NAME"] = ENV["SERVER_NAME"]  if keys.include?("SERVER_NAME")
        result["HTTP_ACCEPT_CHARSET"] = ENV["HTTP_ACCEPT_CHARSET"]  if keys.include?("HTTP_ACCEPT_CHARSET")
        result["PATH_INFO"] = ENV["PATH_INFO"]  if keys.include?("PATH_INFO")
        result["SERVER_PORT"] = ENV["SERVER_PORT"]  if keys.include?("SERVER_PORT")
        result["HTTP_ACCEPT_ENCODING"] = ENV["HTTP_ACCEPT_ENCODING"]  if keys.include?("HTTP_ACCEPT_ENCODING")
        result["PATH_TRANSLATED"] = ENV["PATH_TRANSLATED"]  if keys.include?("PATH_TRANSLATED")
        result["SERVER_PROTOCOL"] = ENV["SERVER_PROTOCOL"]  if keys.include?("SERVER_PROTOCOL")
        result["HTTP_ACCEPT_LANGUAGE"] = ENV["HTTP_ACCEPT_LANGUAGE"]  if keys.include?("HTTP_ACCEPT_LANGUAGE")
        result["QUERY_STRING"] = ENV["QUERY_STRING"]  if keys.include?("QUERY_STRING")
        result["SERVER_SOFTWARE"] = ENV["SERVER_SOFTWARE"]  if keys.include?("SERVER_SOFTWARE")
        result["HTTP_CACHE_CONTROL"] = ENV["HTTP_CACHE_CONTROL"]  if keys.include?("HTTP_CACHE_CONTROL")
        result["REMOTE_ADDR"] = ENV["REMOTE_ADDR"]  if keys.include?("REMOTE_ADDR")
        result["HTTP_FROM"] = ENV["HTTP_FROM"]  if keys.include?("HTTP_FROM")
        result["REMOTE_HOST"] = ENV["REMOTE_HOST"]  if keys.include?("REMOTE_HOST")

        return result
    end
end
infokeys = Array.new
infokeys.push("HTTP_USER_AGENT")
infokeys.push("REMOTE_ADDR")
infovalues = ClientInfo.GetInfo(infokeys)

print "Content-Type: application/json;charset=utf-8\n\n"
print infovalues