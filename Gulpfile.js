'use strict';

// CONFIG VARIABLES FOR DEPLOY (DISABLED)
// var url = 'http://williamcanin.com',
//     baseurl = '/chameleon-jek/';

// LOAD PLUGINS
var gulp = require( 'gulp' ),
    sass = require('gulp-sass'),
    concat = require('gulp-concat'),
    rename = require('gulp-rename'),
    uglify = require('gulp-uglify'),
    shell = require('gulp-shell'),
    browserSync = require('browser-sync'),
    cp = require('child_process'),
    ghPages = require('gulp-gh-pages'),
    imagemin = require('gulp-imagemin'),
    pngquant = require('imagemin-pngquant'),
    plumber = require('gulp-plumber'),
    rimraf = require('gulp-rimraf'),
    htmlmin = require('gulp-htmlmin'),
    taskListing = require('gulp-task-listing');

// VARIABLES

var paths = {
    scripts: ['src/javascripts'],
    images: 'assets/images',
    sass: ['src/sass'],
    stylesheets: ['assets/stylesheets'],
    gh_pages: ['gh-pages'],
    build_site: ['_site'],
    jekyll: [ '_config.yml' ,'index.html', './contact/**/*', './category/**/*', './tags/**/*', '_layouts/**/*.html', '_posts/**/*', '_pages/**/*', './_includes/**/*.html']

};

var messages = {
    jekyllBuild: '<span style="color: grey">Running:</span> $ jekyll build'
};

// CONFIG VARIABLES FOR DEVOLPMENT
var port_serve = '4000';


// CLEANS
gulp.task('clean', function() {
 return gulp.src(['_site/*','gh-pages/*'], { read: false }) // much faster
   .pipe(rimraf())
});

// CONCAT AND COMPRESS STYLESHEETS
gulp.task('stylesheets', function () {
    gulp.src(paths.sass + '/main.scss')
        .pipe(plumber())
        .pipe(sass({outputStyle: 'compressed'}))
        .pipe(rename('style.min.css'))
        .pipe(gulp.dest('assets/stylesheets'));
        // .pipe(connect.reload());
});

// CONCAT AND COMPRESS JAVASCRIPTS
gulp.task('javascripts', function() {
  gulp.src(paths.scripts + '/*.js')
    .pipe(plumber())
    .pipe(concat('scripts.js'))
    .pipe(rename('scripts.min.js'))
    .pipe(uglify())
    .pipe(gulp.dest('assets/javascripts'))
});


// JEKYLL BUILD AND REBUILD
gulp.task('jekyll-build', function (done) {
    browserSync.notify(messages.jekyllBuild);
    return cp.spawn('jekyll', ['build'], {stdio: 'inherit'})
        .on('close', done);
});

gulp.task('jekyll-rebuild', ['jekyll-build'], function () {
    browserSync.reload();
});


// START SERVER
gulp.task('browser-sync', ['jekyll-build'], function() {
    browserSync({
        port: port_serve,
        server: {
            baseDir: paths.build_site
        }
    });
});

// IMAGE MINIFICATION
gulp.task('imageminify', function() {
    return gulp.src(paths.images + '/**/*')
        .pipe(imagemin({
            progressive: true,
            svgoPlugins: [{removeViewBox: false}],
            use: [pngquant()]
        }))
        .pipe(gulp.dest('assets/images'));
});


// HTML MINIFICATION
gulp.task('htmlminify', function() {
  return gulp.src(['_site/**/*.html', '!_site/assets/**/*'])
    // .pipe(plumber())
    .pipe(htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('gh-pages'))
});


// REBUILD WHEN IS CHANGED FILES
gulp.task('watch', function () {
    gulp.watch(paths.scripts + '/*.js', ['javascripts','jekyll-rebuild']);
    gulp.watch(paths.images + '/**/*', ['imageminify','jekyll-rebuild']);
    gulp.watch(paths.sass + '/**/*', ['stylesheets','jekyll-rebuild']);
    gulp.watch([paths.jekyll, paths.build_site], ['jekyll-rebuild']);
});


// SHELL '_CONFIG.YML' FOR DEPLOY OR DEVELOPMENT
gulp.task('url_dev', shell.task([
  'sed -i \'s|^url: .*|url: "http://0.0.0.0:'+port_serve+'"|g\' _config.yml',
  'sed -i \'s|^baseurl: .*|baseurl: ""|g\' _config.yml'
]));

// (DISABLED)
// gulp.task('url_deploy', shell.task([
//   'sed -i \'s|^url: .*|url: "'+ url +'"|g\' _config.yml',
//   'sed -i \'s|^baseurl: .*|baseurl: "'+baseurl+'"|g\' _config.yml',
//   'sleep 2'
// ]));

// DEPLOY FOR GH-PAGES
gulp.task('copys', function() {
    gulp.src('_site/assets/**')
    .pipe(gulp.dest('gh-pages/assets'))
    gulp.src('_site/*.xml')
    .pipe(gulp.dest('gh-pages'))
});

gulp.task('deploy', function() {
  return gulp.src('./' + paths.gh_pages + '/**/*')
    .pipe(ghPages());
});

// TASKS
gulp.task('default', taskListing.withFilters(/:/));
gulp.task('dev', ['url_dev', 'javascripts', 'stylesheets', 'jekyll-build']);
gulp.task('serve', ['url_dev', 'javascripts', 'stylesheets', 'browser-sync', 'watch']);
