# List of commands available for the bot
class Commands
  def thoughts(bot)
    bot.command :thoughts? do |event|
        # Ensure the user is in a channel
        channel = event.user.voice_channel
        next "You're not in any voice channel!" unless channel

        # Enumerate all the audio files we have available
        audio_files = Dir["audio/**/*"]
        # Play a random audio file
        voip_message(bot, event, channel, audio_files.sample)

        event << $sayings[$sayings.keys.sample].sample
    end
  end

  def positive(bot)
    bot.command :positive? do |event|
        # Ensure the user is in a channel
        channel = event.user.voice_channel
        next "You're not in any voice channel!" unless channel

        # Enumerate all the positive audio files we have available
        audio_files = Dir["audio/positive/*"]
        # Play a random audio file
        voip_message(bot, event, channel, audio_files.sample)

        event << $sayings['positive'].sample
    end
  end

  def negative(bot)
    bot.command :negative? do |event|
        # Ensure the user is in a channel
        channel = event.user.voice_channel
        next "You're not in any voice channel!" unless channel

        # Enumerate all the negative audio files we have available
        audio_files = Dir["audio/negative/*"]
        # Play a random audio file
        voip_message(bot, event, channel, audio_files.sample)

        event << $sayings['negative'].sample
    end
  end

  def yes(bot)
    bot.command :no? do |event|
        # Ensure the user is in a channel 
        channel = event.user.voice_channel
        next "You're not in any voice channel!" unless channel

        voip_message(bot, event, channel, 'audio/Yassssss.mp3')

        event << "Yesssssssssssss!"
    end
  end

  def help(bot)
    bot.command :help do |event|
      help = 'I am Lord Shaxx! Do I really have to say any more?'
      header = "\n\n**Talk with me!**\n\n"
      ending = "\nCall me by typing `#{ENV['BOT_NAME']} <command>`. Fight on!"
      commands_list = ''

      commands = { 'thoughts?' => 'random message in VoIP',
                  'positive?' => 'Lord Shaxx is pleased with you',
                  'negative?' => 'Lord Shaxx is disappointed',
                  'help' => 'shows the list of available commands' }

      commands.each do |k, v|
        commands_list += "**#{k}** - #{v}\n"
      end

      stuff = help + header + commands_list + ending

      event << stuff
    end
  end
end

# Shared function to use when sending a voip message
def voip_message(bot, event, channel, file)
  # The `voice_connect` method does everything necessary for the bot to connect to a voice channel. Afterwards the bot
  # will be connected and ready to play stuff back.
  bot.voice_connect(channel)
  "Connected to voice channel: #{channel.name}"
  voice_bot = event.voice

  # Play the desired file
  voice_bot.play_file(file)

  voice_bot.destroy
  
end
