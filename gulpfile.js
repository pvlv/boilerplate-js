'use strict';

const gulp = require('gulp');
const config = require('./config');
const babel = require('gulp-babel');
const uglify = require('gulp-uglify');
const rename = require('gulp-rename');
const del = require('del');
const path = require('path')

gulp.task('js:compile', () => {
  return gulp.src(path.join(config.get('src'), 'index.js'))
    .pipe(babel())
    .pipe(rename({ basename: config.get('pluginName') }))
    .pipe(gulp.dest('./dist'))
    .pipe(uglify())
    .pipe(rename({ basename: config.get('pluginName'), suffix: '.min'}))
    .pipe(gulp.dest(config.get('dist')));
});

gulp.task('clean:dist', () => del(config.get('dist')));

gulp.task('default', gulp.series(
    'clean:dist',
    'js:compile'
  )
);
