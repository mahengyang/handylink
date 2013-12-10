#!/usr/local/bin/ruby
# -*- coding:UTF-8 -*- 

require "json"
require "cgi"
require "mysql2"
require "logger"


$cgi = CGI.new

print "Content-Type: application/json;charset=utf-8\n\n"

if $cgi.has_key?("handle")
    handle_div = $cgi["handle"]
    sqlManage = SqlManage.new
    if (handle_div == "get")
        if ($cgi.has_key?("mac"))
            print sqlManage.get("default", mac=$cgi["mac"]).to_json
        elsif ($cgi.has_key?("email"))
            if ($cgi.has_key?("pass"))
                print sqlManage.get(usr=$cgi["email"], "all", pwd=$cgi["pass"]).to_json
            else
                print sqlManage.get(usr=$cgi["email"]).to_json
            end 
        else
            print sqlManage.get().to_json
        end
    elsif (handle_div == "add")
        links = Array.new
        links.push($cgi)
        print sqlManage.add(links).to_json
    elsif (handle_div == "upd")
        links = Array.new
        links.push($cgi)
        print sqlManage.upd(links).to_json
    elsif (handle_div == "del")
        links = Array.new
        links.push($cgi)
        print sqlManage.upd(links).to_json
    else
        # nothing to do.
        print ""
    end
end

class SqlManage
  
  DEBUG_LOG_PATH = "./logs/debug/dbconn.log"
  ERROR_LOG_PATH = "./logs/error/dbconn.log"

  # 构造方法
  def initialize
    @mysql = Mysql2::Client.new(
     :host => "localhost",
     :username => "deploy",
     :password=>"deploy",
     :database=>"handylink",
     :socket=>"/tmp/mysql.sock")

    @debug = Logger.new(DEBUG_LOG_PATH)
    @error = Logger.new(ERROR_LOG_PATH)
  end

  # read user's handylinks
  def get(usr="default", mac="all", pwd=nil)

      # if user have register, user username 
      # if not, user mac
      if usr == "default"
          cmd = "select title,url from link where mac='#{mac}'"
      else
          cmd = "select title,url from link where username='#{usr}'"
      end
      
      links = Array.new
      query(cmd).each{ |row|
          links.push(row)
      }

      return links
  end

  # delete handylinks
  def del(links)
      result = Hash.new
      index = 1
      links.each{ |link|
          url = ""
          if link.has_key?("url")
              url = link["url"]
          else
              return
          end

          mac = ""
          if (link.has_key?("mac"))
              mac = link["mac"]
          else
              return
          end

          table = "link"
          cmd = "delete from #{table} where url='#{url}' and mac='#{}'"

          result[index] = query(cmd)
          index = index + 1
      }

      return result
  end

  # update handylinks
  def upd(records)
      result = Hash.new

      index = 1
      records.each{ |record|
          cmd = "update #{table} set url='#{url}', title='#{title}' where url='#{oldurl}' and mac='#{mac}'"

          result[index] = query(cmd)
          index = index + 1
      }

      return result
  end

  # add handylinks
  def add(links)
      result = Hash.new
      index = 1
      links.each { |link|
          username = ""
          if link.has_key?("username")
             username = link["username"]
          end

          url = link["url"]
          time = Time.new.strftime("%Y-%m-%d %H:%M:%S")
          version = ""
          if link.has_key?("version")
              version = link["version"]
          end
          title = link["title"]
          mac = link["mac"]
          table = "link"
          cmd = "replace into #{table}(username, url, time, browser_version, title, mac) values('#{username}', '#{url}', '#{time}', '#{version}', '#{title}', '#{mac}')"

          result[index] = query(cmd)
          index = index + 1
      }

      return result
  end

  # query sql command
  def query(cmd)
      result = Hash.new
      begin
          @mysql.query(cmd)
          result["result"] = 0
      rescue Exception => e
          # write error log 
          @error.error(e)
          result["result"] = 101
          result["message"] = e.message
      ensure
          # write debug sql log
          @debug.debug(cmd)
      end

      return result
  end
end