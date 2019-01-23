require 'discordrb'
require_relative 'commands.rb'

# allows discord to detect someone calling the bot by name: ie. <botname> <command>
discord_command = ENV['BOT_NAME'] + ' '

# attempting to abstact the text sayings
$sayings = {  
  "positive" =>
    ["You're crushing them!",
      "Oh, did they ever stand a chance.",
      "I know total domination when I see it! Superb!",
      "You're my favourite Guardian!"],
  "negative" =>
    ["Let this defeat be a lesson: only the strong survive.",
    "Worry not, Guardian! Now, fight again!",
    "Let the sting from this defeat fuel your fire."]
}

# Setup a command bot and appropriate prefix
bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_TOKEN'], prefix: discord_command

available_commands = Commands.instance_methods(false)
cmd = Commands.new

# Loop through the commands module to find available bot commands to run
available_commands.each do |x|
  cmd.send(x, bot)
end

bot.run
