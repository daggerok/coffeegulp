gulp = require 'gulp'
coffee = require 'gulp-coffee'
remove = require 'gulp-rimraf'

srcDir = 'src/'
coffeeSrc = srcDir + 'coffee/**/*.coffee'
buildDir = 'dist/'
jsDir = buildDir + 'js/'

gulp.task 'clean', ->
  gulp.src buildDir
    .pipe remove {force: true}

gulp.task 'coffee', ->
  gulp.src coffeeSrc, {base: 'src/coffee'}
    .pipe coffee {bare: true}
      .on 'error', ->
        console.log error
    .pipe gulp.dest jsDir

gulp.task 'watch', ->
  gulp.watch coffeeSrc, ['coffee']

gulp.task 'default', ['coffee']
