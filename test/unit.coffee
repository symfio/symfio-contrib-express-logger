symfio = require "symfio"
plugin = require "../lib/express-logger"
suite = require "symfio-suite"


describe "contrib-express-logger plugin", ->
  wrapper = suite.sandbox symfio, ->
    express = logger: @sandbox.stub()
    express.logger.format = @sandbox.stub()
    app = use: @sandbox.stub()

    @format = express.logger.format

    @container.set "express", express
    @container.set "app", app

  it "should log requests", wrapper ->
    req = method: "GET", originalUrl: "/", _startTime: new Date
    res = statusCode: 200

    plugin @container, =>
      @expect(@format).to.have.been.calledOnce

      formatter = @format.firstCall.args[1]
      formatter [], req, res

      @expect(@logger.info).to.have.been.calledTwice
      @expect(@logger.info.lastCall.args[0]).to.equal "GET /"
      @expect(@logger.info.lastCall.args[1]).to.match /^200 \d+ms$/
      @expect(@logger.info.lastCall.args[2]).to.equal "express"
