# List of commands available for the bot
class Commands
  def hello(bot)
    bot.command :hello do |event|
      sayings = ['Salutations!',
                 "What's up, buttercup?",
                 'Ready to work',
                 'Hello? This is One. You want two.',
                 'https://media.giphy.com/media/l0HlHFRbmaZtBRhXG/giphy.gif',
                 "Yo #{event.user.name}! You left your ID at the bar last night. I got your back though...",
                 'Zug zug!']

      event << sayings.sample
    end
  end

  def thoughts(bot)
    bot.command :thoughts? do |event|
        # The `voice_channel` method returns the voice channel the user is currently in, or `nil` if the user is not in a
        # voice channel.
        channel = event.user.voice_channel

        # Here we return from the command unless the channel is not nil (i. e. the user is in a voice channel). The `next`
        # construct can be used to exit a command prematurely, and even send a message while we're at it.
        next "You're not in any voice channel!" unless channel

        # The `voice_connect` method does everything necessary for the bot to connect to a voice channel. Afterwards the bot
        # will be connected and ready to play stuff back.
        bot.voice_connect(channel)
        "Connected to voice channel: #{channel.name}"
        voice_bot = event.voice

        # Enumerate all the audio files we have available
        audio_files = Dir["audio/*"]
        # Play a random audio file
        voice_bot.play_file(audio_files.sample)

        voice_bot.destroy

        event << "Shaxx speaks!"
    end
  end

  def bye(bot)
    bot.command :bye_now do |event|
      sayings = ['See you later, alligator',
                 ':wave:',
                 'Bye!']

      event << sayings.sample
    end
  end

  def help(bot)
    bot.command :help do |event|
      help = 'I am Lord Shaxx! Do I really have to say any more?'
      header = "\n\n**Talk with me!**\n\n"
      ending = "\nCall me by typing `#{ENV['BOT_NAME']} <command>`. Fight on!"
      commands_list = ''

      commands = { 'bye' => 'says goodbye to you',
                   'hello' => 'says hello to you',
                   'thoughts?' => 'inspiring message in VoIP',
                   'help' => 'shows the list of available commands' }

      commands.each do |k, v|
        commands_list += "**#{k}** - #{v}\n"
      end

      stuff = help + header + commands_list + ending

      event << stuff
    end
  end
end
