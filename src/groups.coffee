module.exports = (config) ->

  addGroup = (url, callback) ->
    filterCol = mongodb.collection('filters')
    console.log "Will add " + url + " to filters"
    filterCol.update { }, { $addToSet: filters: url }, { multi: true }, ->
      callback(null, true)

  getGroup = (test, callback) ->
    filterCol = mongodb.collection('filters')
    filterCol.findOne {}, (err, filters) ->
      console.log filters
      callback err, filters

  selfMentionResponse = (mentions, botName, message, callback) ->
    if botName in mentions
      if text.indexOf("help") > -1
        callback config.helpMessage
      else if text.indexOf("add_group") > -1
        #to do
    else
      callback()