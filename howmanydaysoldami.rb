require 'sinatra'
require 'markaby'
require 'date'

set :show_exceptions, true

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
