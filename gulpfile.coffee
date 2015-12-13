srcDir = 'src/'
coffeeSrc = srcDir + '**/*.coffee'
buildDir = 'dist/'
jsDir = buildDir + 'js/'

gulp = require 'gulp'
coffee = require 'gulp-coffee'
remove = require 'gulp-rimraf'
plumber = require 'gulp-plumber'
require 'colors'

log = (error) ->
  console.log [
    "BUILD FAILED: #{error.name ? ''}".red.underline
    '\u0007' # beep
    "#{error.code ? ''}"
    "#{error.message ? error}"
    "in #{error.filename ? ''}"
    "gulp plugin: #{error.plugin ? ''}"
  ].join '\n'
  this.end()

gulp.task 'clean', ->
  gulp.src(buildDir)
    .pipe remove {force: true}

gulp.task 'coffee', ->
  gulp.src(coffeeSrc, {base: srcDir})
    #.pipe(plumber())
    .pipe(coffee {bare: true})
      .on('error', log)
    .pipe gulp.dest buildDir

gulp.task 'default', ['coffee']

gulp.task 'watch', ['default'], ->
  gulp.watch coffeeSrc, ['coffee']
