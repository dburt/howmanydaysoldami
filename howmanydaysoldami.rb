require 'sinatra'
require 'markaby'

set :show_exceptions, true

get '/' do
  markaby do
    style <<-END
      input[type=text] {
        border: none;
        border-bottom: 1px dotted black;
        text-align: center;
      }
      input[name=day] { width: 3em; }
      input[name=month] { width: 7em; }
      input[name=year] { width: 3em; }
    END
    form :method => :post do
      span "Hi, I was born on the "
      input :type => "text", :name => "day"
      span " day of the month of "
      input :type => "text", :name => "month"
      span " in the year AD"
      input :type => "text", :name => "year"
      span ". Can you please tell me, "
      input :type => "submit", :value => "how many days old am I?"
    end
  end
end

post '/' do
  begin
    birthday = Date.parse "#{params[:day]} #{params[:month]} #{params[:year]}"
    days = Date.today - birthday
    markaby do
      p "Today you are #{days} days old!"
      p "I was born on the 20th day of the month of May in the year AD2013."
      p do
        span "I was made by the maker of "
        a "AnkiVerse", :href => "http://ankiverse.burt.id.au/"
        span ", a free helper for memorizing poetry and Bible bits."
      end
    end
  rescue ArgumentError
    markaby do
      p "Sorry, I didn't understand that date. I'm only a computer."
      p "I was born on the 20th day of the month of May in the year AD2013."
      p do
        a "Try again?", :href => "/"
      end
    end
  end
end

