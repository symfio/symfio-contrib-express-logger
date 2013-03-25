# symfio-contrib-express-logger

> Express requests logger.

[![Build Status](http://teamcity.rithis.com/httpAuth/app/rest/builds/buildType:id:bt9,branch:master/statusIcon?guest=1)](http://teamcity.rithis.com/viewType.html?buildTypeId=bt9&guest=1)
[![Dependency Status](https://gemnasium.com/symfio/symfio-contrib-express-logger.png)](https://gemnasium.com/symfio/symfio-contrib-express-logger)

## Usage

```coffee
symfio = require "symfio"

container = symfio "example", __dirname

loader = container.get "loader"

loader.use require "symfio-contrib-express"
loader.use require "symfio-contrib-express-logger"

loader.load()
```

## Required plugins

* [contrib-express](https://github.com/symfio/symfio-contrib-express)
