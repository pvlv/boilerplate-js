'use strict';

const gulp = require('gulp');
const babel = require('gulp-babel');
const uglify = require('gulp-uglify');
const rename = require('gulp-rename');
const del = require('del');

gulp.task('js:compile', () => {
  return gulp.src('./src/*.js')
    .pipe(babel())
    .pipe(rename({ basename: 'accord' }))
    .pipe(gulp.dest('./dist'))
    .pipe(uglify())
    .pipe(rename({ basename: 'accord', suffix: '.min'}))
    .pipe(gulp.dest('./dist'));
});

gulp.task('clean:dist', () => del('./dist'));

gulp.task('default', gulp.series(
    'clean:dist',
    'js:compile'
  )
);
