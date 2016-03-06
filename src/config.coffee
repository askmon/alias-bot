module.exports = (configHelper) ->

  result =
    slackToken: process.env.SLACK_TOKEN # Add a bot at https://my.slack.com/services/new/bot and copy the token here.
    mongoUri: process.env.MONGOLAB_URI
    helpMessage: process.env.HELP_MESSAGE || 'Hi, I am the group bot! I\'m here to help you mentioning specific groups of people.\n
    In order to issue a command, just mention me followed by the command and it\'s arguments.\n
    I accept the following commands:\n
    \tadd_group <group_name> <usernames with @> - adds a new group of people\n
    \tremove_group <group_name> - removes the group'

    validate: () ->
      configHelper.outputConfigValue result, "slackToken", if process.env.NODE_ENV is 'development' then true else false
      configHelper.outputConfigValue result, "mongoUri", if process.env.NODE_ENV is 'development' then true else false

  return result
