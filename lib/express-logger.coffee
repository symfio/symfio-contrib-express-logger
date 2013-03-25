module.exports = (container, callback) ->
  express = container.get "express"
  logger = container.get "logger"
  app = container.get "app"

  logger.info "loading plugin", "contrib-express-logger"

  express.logger.format "symfio", (tokens, req, res) ->
    requestInfo  = "#{req.method} #{req.originalUrl}"
    responseInfo = "#{res.statusCode} #{new Date - req._startTime}ms"

    logger.info requestInfo, responseInfo, "express"

  app.use express.logger "symfio"

  callback()
