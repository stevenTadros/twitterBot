require_relative "twitterBot/version.rb"
require_relative "connection.rb"

module TwitterBot
	def retrieve
    connect_s = ConnectionS.new
    connection_s = connect_s.con_client
    connect_r = ConnectionR.new
    connection_r = connect_r.con_client
    t = (Time.now)

    tab = {
      "hello"                   => "Bonjour",
      "salut"                   => "Bonjour",
      "ca va"                   => "Bien et toi ?",
      "t'appelles"              => "Steven",
      "1 2 3"                   => "4 5 6",
      "test"                    => "ça marche",
      "heure"                   => "Il est "+t.strftime('%HH%M et %S secondes'), 
      "date"                    => "Nous sommes le "+t.strftime('%A %C %B %G'),
    }

    connection_s.user do |object|
      case object
      when Twitter::Tweet
        puts "Tweet:@#{object.user.screen_name}:#{object.text}"
      when Twitter::DirectMessage
        tab.each do |k, v|
          reponse = String.new(object.text).downcase
          if reponse.include? k
            connection_r.create_direct_message("@#{object.sender.screen_name}", "#{v}")
          end
        end
      end
    end
  end
end

class Bot
  include TwitterBot
end

bot = Bot.new
bot.retrieve