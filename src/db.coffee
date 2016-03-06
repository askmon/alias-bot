mongojs = require('mongojs')

module.exports = (config) ->

  mongodb = mongojs(config.mongoUri)

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