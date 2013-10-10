sysPath = require 'path'

exports.config =
  # See http://brunch.io/#documentation for documentation.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(vendor|bower_components)/

      order:
        before: ['vendor/scripts/console-polyfill.js']

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^(app|vendor)/
      order:
        before: ['vendor/styles/normalize.css']

    templates:
      precompile: true
      root: 'templates'
      joinTo: 'javascripts/app.js' : /^app/

  server:
    path: 'server/server.coffee'
    port: 3333
    run: yes
    base: '/'
