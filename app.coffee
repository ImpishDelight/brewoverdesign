axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
browserify   = require 'roots-browserify'
roots_config = require('roots-config')
moment       = require('moment')


module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf', '**/config.*']

  extensions: [
    browserify(files: [
        "assets/js/main.coffee", 
    ], out: 'js/main.js'),
    css_pipeline(files: 'assets/css/*.styl'),
    roots_config(
        site: 'http://brewoverdesign.com', 
        ticket: 'https://www.meetup.com/The-Kitchener-Waterloo-Brew-Over-Design-Event/events/247051843/',
        year: moment(Date.now()).format('YYYY')
    )
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: false

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  server:
    clean_urls: true
