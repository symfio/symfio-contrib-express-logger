module.exports = (grunt) ->
  grunt.initConfig
    simplemocha:
      unit: "test/unit.coffee"
      options: reporter: process.env.REPORTER or "spec"
    coffeelint:
      lib: "lib/**/*.coffee"
      test: "test/**/*.coffee"
      grunt: "Gruntfile.coffee"

  grunt.loadNpmTasks "grunt-simple-mocha"
  grunt.loadNpmTasks "grunt-coffeelint"

  grunt.registerTask "default", [
    "simplemocha"
    "coffeelint"
  ]
