'use strict';

const gulp = require('gulp');
const babel = require('gulp-babel');
const rename = require('gulp-rename');
const sourcemap = require('gulp-sourcemaps');
const del = require('del');
const server = require('browser-sync').create();

gulp.task('clean', () => del('./js'));

gulp.task('js:compile', () => {
  return gulp.src('../src/index.js')
    .pipe(sourcemap.init())
    .pipe(babel())
    .pipe(rename({ basename: 'accord' }))
    .pipe(sourcemap.write('.'))
    .pipe(gulp.dest('./js'));
})

gulp.task('server', () => {
    server.init({
        server: './',
        port: 7121,
        open: false,
        notify: false
    });

    gulp.watch(['../src/index.js'], gulp.series('js:compile'));
    gulp.watch(['./index.html', './js/**']).on('change', server.reload);
});

gulp.task('default', gulp.series('clean', 'js:compile', 'server'));
