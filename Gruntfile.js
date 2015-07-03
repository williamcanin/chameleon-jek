'use strict';
module.exports = function (grunt) {
  // Load all tasks
  require('load-grunt-tasks')(grunt);


  // Variable that stores JS scripts
  var jsFileList = [
  'assets/vendor/jquery/dist/jquery.js',
  'assets/vendor/bootstrap-sass/assets/javascripts/bootstrap.js',
  'assets/vendor/jquery.easing/js/jquery.easing.min.js',
  // 'assets/javascripts/vendor/modernizr.min.js',
  'assets/vendor/simple-jekyll-search/dest/jekyll-search.js',
  'assets/javascripts/custom/*.js'
  ];

  
// Configurable paths
var config = {
  src: 'src',
  build: '_build',
  includes: '_includes',
  fonts_dir: './assets/fonts',
  fonts_raleway: 'assets/vendor/fonts-raleway/fonts',
  fonts_awesome: 'assets/vendor/font-awesome-custom/fonts',
  fonts_bootstrap: 'assets/vendor/bootstrap-sass/assets/fonts'

};


grunt.initConfig({

// Inital config path
config: config,

// Clean paths
clean: {
    build: ['<%= config.build %>'],
    includes: ['<%= config.includes %>']
},

// Create directory for fonts
mkdir: {
    all: {
      options: {
        // mode: 777,
        create: ['<%= config.fonts_dir %>']
      },
    },
  },

// Copy files for configuration
 copy: {
      f_raleway: {
        expand: true,
        cwd: '<%= config.fonts_raleway %>',
        src: ['**'],
        dest: '<%= config.fonts_dir %>'
      },
      f_awesome: {
        expand: true,
        cwd: '<%= config.fonts_awesome %>',
        src: ['**'],
        dest: '<%= config.fonts_dir %>'
      },
      f_bootstrap: {
        expand: true,
        cwd: '<%= config.fonts_bootstrap %>',
        src: ['**'],
        dest: '<%= config.fonts_dir %>'
      }

},

// JSHint
  jshint: {
    options: {
        jshintrc: '.jshintrc'
    },
     all: [
        'Gruntfile.js',
        'assets/javascripts/*.js',
        '!assets/javascripts/scripts.js',
        '!assets/**/*.min.*'
        ]
  },

 // Modernizr
 modernizr: {
  build: {
    devFile: 'assets/vendor/modernizr/modernizr.js',
    outputFile: 'assets/javascripts/vendor/modernizr.min.js',
/*    files: {
      'src': [
      ['assets/javascripts/scripts.min.js'],
      ['assets/css/main.min.css']
      ]
    },*/
    extra: {
      shiv: false,
      printshiv : false,
      load : true,
      mq : false,
      cssclasses : true
    },
    uglify: true,
    parseFiles: true
  }
},

    // Sass compress / concat
    sass: {
      build: {
        files: {
          'assets/css/main.min.css':
          'assets/sass/main.scss'
        },
        options: {
          style: 'compressed'
        }
      },
      dev: {
        files: {
         'assets/css/main.min.css': 'assets/sass/main.scss',
       },
       options: {
        style: 'expanded'
      }
    }
  },

// Compress HTML
htmlcompressor: {
  compile: {
    files: {
      // Includes Htmls
      '_includes/html/button-top.html': 'src/includes/html/button-top.html',
      '_includes/html/footer.html': 'src/includes/html/footer.html',
      '_includes/html/head.html': 'src/includes/html/head.html',
      '_includes/html/header.html': 'src/includes/html/header.html',
      '_includes/html/icons.html': 'src/includes/html/icons.html',
      '_includes/html/modal-portfolio.html': 'src/includes/html/modal-portfolio.html',
      '_includes/html/modal-search.html': 'src/includes/html/modal-search.html',
      '_includes/html/pagination.html': 'src/includes/html/pagination.html',
      '_includes/html/portfolio.html': 'src/includes/html/portfolio.html',
      '_includes/html/btn-google-forms.html': 'src/includes/html/btn-google-forms.html',
      '_includes/html/shares.html': 'src/includes/html/shares.html',
      // Includes Scripts
      '_includes/scripts/change-avatars.html': 'src/includes/scripts/change-avatars.html',
      '_includes/scripts/disqus.html': 'src/includes/scripts/disqus.html',
      '_includes/scripts/dates.html': 'src/includes/scripts/dates.html',
      '_includes/scripts/share-facebook.html': 'src/includes/scripts/share-facebook.html',
      '_includes/scripts/share-linkedin.html': 'src/includes/scripts/share-linkedin.html',
      '_includes/scripts/share-googleplus.html': 'src/includes/scripts/share-googleplus.html',
      '_includes/scripts/share-twitter.html': 'src/includes/scripts/share-twitter.html',
      // Include Layout
      '_layouts/default.html': 'src/layouts/default.html'

    },
    options: {
      type: 'html',
      preserveServerScript: true
    }
  }
},


// Minification of Images
// Install: # npm install grunt-image --save-dev
// Task:  grunt.registerTask('imgcompress', [ 'image:dynamic']);
image: {
  static: {
    options: {
     pngquant: true,
     optipng: true,
     advpng: true,
     zopflipng: true,
     pngcrush: true,
     pngout: true,
     mozjpeg: true,
     jpegRecompress: true,
     jpegoptim: true,
     gifsicle: true,
     svgo: true

   },
   files: {
    'assets/images/avatar/out.png': 'assets/images/avatar/out.png',
    'assets/images/avatar/over.png': 'assets/images/avatar/over.png'
  }
},
dynamic: {
  files: [{
    expand: true,
    cwd: 'assets/images/',
    src: ['**/*.{png,jpg,gif,svg}'],
    dest: 'assets/images/'
  }]
}
},


   // Concatenate JS
   concat: {
    options: {
      separator: ';',
    },
    dist: {
      src: [jsFileList],
      dest: 'assets/javascripts/scripts.min.js',
    },
  },

    // Minification of JS
    uglify: {
      dist: {
        files: {
          'assets/javascripts/scripts.min.js': [jsFileList]
        }
      }
    },

    // Connect with Browser
    connect: {
      server: {
        options: {
          port: 4000,
          base: "<%= config.build %>",
          hostname: "localhost",
          livereload: true,
          open: true
          
        }
      }
    },

    // Build server, Init Server and Reset Config
    shell : {
      jekyllServe : {
        command : 'bundle exec jekyll serve'
      },
      jekyllBuild : {
        command : 'bundle exec jekyll build'
      },
      resetConfiguration: {
        command : 'rake reset'
      }
    },
     // Doc - https://www.npmjs.com/package/grunt-ftp-deploy
    // You can use the grunt-ftpush.  - by William C. Canin

    'ftpush': {
      build: {
        auth: {
          host: 'ftp.example.com', // your url ftp
          port: 21, // port
          authKey: 'key' // key in file .ftppass
        },
        src: './_build',
        dest: '/public_html/',
        exclusions: [
            // Useless Files
            './node_modules',
            './**/.DS_Store',
            './**/*.log',
            './README.md',
            './**/*.md',
            './Gruntfile.js',
            './Config.rb',
            './bower.json',
            './package.json',
            './**/*.json',
            './.ftppass',
            './CNAME',
            './Gemfile',
            './Rakefile',
            './.gitignore',
            'LICENSE',
            './.git',
            './.grunt'
            ]
          }
        },

    // Monitoring edition (automatic updates) - Livereload
    watch : {

      files : [ '_layouts/*.html',
      'src/**/*.html',
      '_posts/**/*.markdown',
      '_posts/**/*.md',
      '_config.yml',
      'index.html',
      'assets/javascripts/custom/*.js',
      'assets/sass/**/*.scss',
      'assets/images/**/*.jpg',
      'assets/images/**/*.png',
      'assets/images/**/*.svg'],

      tasks : ['htmlcompressor','build:css','uglify','shell:jekyllBuild'],


      options : {

        spawn : false,
        interrupt : false,
        atBegin : false,
        livereload : true
      }


    }

  });

    // register custom grunt tasks
    // grunt.registerTask('server', ['connect:server','watch' ]);

grunt.registerTask('build', 'Build the site, nothing fancy, no minification', function(target) {
    var tasks = {
      prep: ['clean','mkdir','copy'],
      css: ['sass:build'],
      minify: [
        'uglify',
        'concat'
      ],
      jshint: ['jshint'],
      modernizr: ['modernizr'],
      default: [
        'build:prep',
        'build:css',
        'build:minify',
        'build:jshint',
        // 'build:modernizr',
        'htmlcompressor',
        'shell:jekyllBuild'
      ]
    };

    grunt.task.run(tasks[target] || tasks['default']);
  });


  grunt.registerTask('serve', 'Builds the site, starts a simple node server', function (target) {
    var tasks = {
      dist: [
        'dist',
        'connect:server',
        'watch'
      ],
      default: [
        'build',
        'connect:server',
        'watch'
      ]
    };

    grunt.task.run(tasks[target] || tasks['default']);
  });


  // Tasks devepmment
  grunt.registerTask('dist', [
      //'modernizr', //Connect internet
      'shell:resetConfiguration',
      'htmlcompressor',
      'sass:build',
      'concat',
      'uglify',
      'shell:jekyllBuild'
  ]);

   // Optional tasks
  grunt.registerTask('ftp-deploy', ['ftpush']);
  grunt.registerTask('imgcompress', [ 'image:dynamic']);

};