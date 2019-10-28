![Lord Shaxx][shaxx]
Img Credit: https://www.deviantart.com/fonteart/art/Lord-Shaxx-567679611

[shaxx]: https://raw.githubusercontent.com/SinFulNard/discord-shaxxBot/images_for_shaxx/lord_shaxx_by_fonteart.png

# discord-shaxxBot
Lord Shaxx Discord VoIP bot

A regal Discord bot that represents Lord Shaxx from Destiny - he provides inspirational VoIP messages on demand!

## Requirements
Copy .env.sample to .env and populate with your Discord bot token. `BOT_NAME` becomes the prefix you use to call forth Lord Shaxx.

To create a token; Discord Token - [link](https://github.com/reactiflux/discord-irc/wiki/Creating-a-discord-bot-&-getting-a-token)

Invite the bot to your channel after creating your app.

Clone this git repo.

Use Lord_Shaxx.png as your Bot's avatar during setup!

## Building the docker image
To build the docker image locally;
`docker build -t shaxxbot .`

The docker image should contain the requirement packages to send Discord VoIP messages.

## Docker compose
The provided docker compose file will bring up the freshly built image;
`docker-compose up -d`

Use `docker-compose ps` to confirm the image is running.

The above command will run in daemon mode, to stop the running containers use;
`docker-compose down`

## Troubleshooting
For ongoing work, you can build an image and then attach via;
`docker run -i -t shaxxbot:latest /bin/bash`
You will need to export the two variables in .env;
```
export DISCORD_TOKEN=SECRET_TOKEN
export BOT_NAME=shaxxBot
```
Then directly run the ruby script;
`ruby shaxxBot.rb`

Errors will be thrown to the console/running process.

