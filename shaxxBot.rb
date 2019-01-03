require 'discordrb'
require_relative 'commands.rb'

# allows discord to detect someone calling the bot by name: ie. <botname> <command>
discord_command = ENV['BOT_NAME'] + ' '

# Setup a command bot and appropriate prefix
bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_TOKEN'], prefix: discord_command

available_commands = Commands.instance_methods(false)
cmd = Commands.new

# Loop through the commands module to find available bot commands to run
available_commands.each do |x|
  cmd.send(x, bot)
end

bot.run