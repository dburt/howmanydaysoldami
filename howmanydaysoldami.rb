#!/usr/bin/env ruby

require 'sinatra'
require 'markaby'
require 'date'

require 'pry' rescue nil

set :show_exceptions, true
set :haml, :layout_options => { escape_html: false }

get '/' do
  haml :form
end

post '/' do
  begin
    birthday = Date.parse "#{params[:day]} #{params[:month]} #{params[:year]}"
    days = Date.today - birthday

    haml :report, :locals => {:days => days}

  rescue ArgumentError
    haml :error
  end
end

if __FILE__ == $0
  Sinatra::Application.run!
end
