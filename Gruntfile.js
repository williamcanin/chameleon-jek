/*
=========================================================================
GruntFile - Customization for Chameleon Theme (Jekyll)
Province: Brazil - SP
Author: William da Costa Canin <http://williamcanin.com>
Home page project: https://github.com/williamcanin/chameleon-theme-jekyll
-------------------------------------------------------------------------
All Rights Reserved (C) Copyright
=========================================================================
*/

'use strict';
module.exports = function (grunt) {
  // Load all tasks
  require('load-grunt-tasks')(grunt);

  // Variable that stores JS scripts
  var jsFileList = [
    'assets/vendor/jquery/dist/jquery.js',
    'assets/vendor/bootstrap-sass/assets/javascripts/bootstrap.js',
    'assets/vendor/jquery.easing/js/jquery.easing.min.js',
    'assets/javascripts/vendor/modernizr.min.js', // Customization option (Connect internet)
    'assets/vendor/simple-jekyll-search/dest/jekyll-search.js',
    'assets/javascripts/custom/*.js'
  ];

  
// Configurable paths
  var config = {
    port_jekyll: '4000',
    src: 'src',
    build_files: '_build/*',
    build_dir: '_build',
    includes: '_includes',
    fonts_dir: './assets/fonts',

    dir_avatar: './assets/images/avatar',
    dir_covers: './assets/images/covers',
    dir_favicons: './assets/images/favicons',
    dir_header: './assets/images/header',
    dir_pages_img: './assets/images/pages',
    dir_portfolio: './assets/images/portfolio',
    dir_posts_img: './assets/images/posts',
    dir_file_posts_portfolio: './_posts/portfolio',
    dir_file_posts_blog: './_posts/blog',
    dir_file_pages: './pages',

    sass_cache: '.sass-cache',
    fonts_raleway: 'assets/vendor/fonts-raleway/fonts',
    fonts_awesome: 'assets/vendor/font-awesome-custom/fonts',
    fonts_bootstrap: 'assets/vendor/bootstrap-sass/assets/fonts'

  };

  // =====================================================================================
  // Begin - initConfig
  // -------------------------------------------------------------------------------------
  grunt.initConfig({ 

  // Inital config path
  config: config,

  // Clean paths and files
  clean: {
    build: {
      src: ['<%= config.build_files %>','<%= config.includes %>','<%= config.sass_cache %>', 
      'assets/css','assets/javascripts/scripts.min.js'],
    },
    content: {
      src: ['_posts','pages','assets/images','README.md','_config.yml','*.sh','CNAME']
    },
    configuration: {
      src: ['.origin.log','.jshintrc','.gitignore','.bowerrc']
    }  
  },

  // Create directory for fonts
  mkdir: {
    all: {
      options: {
        create: ['<%= config.fonts_dir %>', '<%= config.dir_avatar %>', '<%= config.dir_covers %>', '<%= config.dir_favicons %>',
        '<%= config.dir_header %>', '<%= config.dir_pages_img %>', '<%= config.dir_portfolio %>', '<%= config.dir_posts_img %>',
        '<%= config.dir_file_pages %>', '<%= config.dir_file_posts_portfolio %>','<%= config.dir_file_posts_blog %>']
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
      shiv: true,
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

  // Build server, Init Server and Reset Config
  shell : {
     jekyllServe : {
        command : 'bundle exec jekyll serve --port <%= config.port_jekyll %>'
      },
      jekyllBuild : {
        command : 'bundle exec jekyll build'
      },
      resetConfiguration: {
        command : 'rake reset'
      }
  }, 

  // Connect with Browser
  connect: {
    server: {
      options: {
        port: 4000,
        base: "<%= config.build_dir %>",
        hostname: "localhost",
        livereload: true,
        open: true
          
      }
    }
  },

// Performs the "backups"
compress: {
  sources: {
    options: {
      archive: 'backups_sources.tar.gz'
    },
    files: [
    {
      cwd: 'assets/sass',
      expand: true,
      src: ['**/*'],
      dest: 'assets/sass'
    }, {
      cwd: 'assets/javascripts/custom',
      expand: true,
      src: ['**/*'],
      dest: 'assets/javascripts/custom'
    },
    {
      cwd: '_plugins',
      expand: true,
      src: ['**/*'],
      dest: '_plugins'
    },
    {
      cwd: 'src',
      expand: true,
      src: ['**/*'],
      dest: 'src'
    },
    {
      cwd: '.',
      expand: true,
      src: ['README.md','_config.yml','deploy.sh','feed.xml','Gemfile','Gruntfile.js','CNAME','index.html','LICENSE','Rakefile','README-PtBr.md','search.json','package.json','setup.sh','bower.json'],
      dest: '.'
    }

    ]
  },
  contents: {
    options: {
      archive: 'backups_contents.tar.gz'
    },
    files: [
    {
      cwd: 'assets/images',
      expand: true,
      src: ['**/*'],
      dest: 'assets/images'
    }, {
      cwd: '_posts',
      expand: true,
      src: ['**/*'],
      dest: '_posts'
    },
    {
      cwd: 'pages',
      expand: true,
      src: ['**/*'],
      dest: 'pages'
    },
    {
      cwd: '.',
      expand: true,
      src: ['README.md','_config.yml','*.sh','CNAME'],
      dest: '.'
    }

    ]
  }
},

  // Monitoring edition (automatic updates) - Livereload
  watch : {
    files : [
      '_layouts/*.html',
      'src/**/*.html',
      '_posts/**/*.markdown',
      '_posts/**/*.md',
      '_config.yml',
      'index.html',
      'assets/javascripts/custom/*.js',
      'assets/sass/**/*.scss',
      'assets/images/**/*.jpg',
      'assets/images/**/*.png',
      'assets/images/**/*.svg'
    ],

    tasks : [
      'htmlcompressor',
      'build:css',
      'uglify',
      'shell:jekyllBuild'
    ],

    options : {
      spawn : false,
      interrupt : false,
      atBegin : false,
      livereload : true
    }
  }


//  // BEGIN ADMINISTRATION

//  // Customization option
//  // Doc - https://www.npmjs.com/package/grunt-ftp-deploy
//  // You can use the grunt-ftpush.


// 'ftpush': {
//    build: {
//      auth: {
//        host: 'ftp.example.com', // your url ftp
//        port: 21, // port
//        authKey: 'key' // key in file .ftppass
//      },
//      src: './_build',
//      dest: '/public_html/',
//      exclusions: [
//      // Useless Files
//        './node_modules',
//         './**/.DS_Store',
//         './**/*.log',
//         './README.md',
//         './**/*.md',
//         './Gruntfile.js',
//         './Config.rb',
//         './bower.json',
//         './package.json',
//         './**/*.json',
//         './.ftppass',
//         './CNAME',
//         './Gemfile',
//         './*.lock',
//         './Rakefile',
//         './.gitignore',
//         'LICENSE',
//         './.git',
//         './.grunt'
//       ]
//      }
//   },

//  // Customization option (Connect internet)
//  // Minification of Images
//  // Install: # npm install grunt-image --save-dev
//  // Task:  grunt.registerTask('imgcompress', [ 'image:dynamic']);
//  image: {
//    static: {
//      options: {
//      pngquant: true,
//      optipng: true,
//      advpng: true,
//      zopflipng: true,
//      pngcrush: true,
//      pngout: true,
//      mozjpeg: true,
//      jpegRecompress: true,
//      jpegoptim: true,
//      gifsicle: true,
//      svgo: true
//    },
//    files: {
//     'assets/images/avatar/out.png': 'assets/images/avatar/out.png',
//     'assets/images/avatar/over.png': 'assets/images/avatar/over.png'
//    }
//  },
//  dynamic: {
//    files: [{
//      expand: true,
//      cwd: 'assets/images/',
//      //src: ['**/*.{png,jpg,gif,svg}'],
//      dest: 'assets/images/'
//    }]
//  }
// },

  });
  // -------------------------------------------
  // End - initConfig
  //============================================ 



  grunt.registerTask('build', 'Build the site', function(target) {
    var tasks = {
      prep: ['clean:build','mkdir','copy'],
      css: ['sass:build'],
      minify: [
        'concat',
        'uglify'
        
      ],
      jshint: ['jshint'],
      modernizr: ['modernizr'],
      default: [
        'build:prep',
        'build:css',
        'build:minify',
        'build:jshint',
        'build:modernizr',  // Customization option (Connect internet)
        'htmlcompressor',
        'shell:jekyllBuild'
      ]
    };

    grunt.task.run(tasks[target] || tasks['default']);

  });


  grunt.registerTask('spy', 'Starts a simple node server', function (target) {
    var tasks = {
      dist: [
        'shell:resetConfiguration',
        // 'dist', // Customization option
        'connect:server',
        'watch'
      ],
      default: [
        // 'shell:resetConfiguration', //Customization option
        // 'build', //Customization option
        'connect:server',
        'watch'
      ]
    };

    grunt.task.run(tasks[target] || tasks['default']);

  });


//  // Optional tasks
//  grunt.registerTask('dist', [
//    'modernizr', // Customization option (Connect internet)
//    'shell:resetConfiguration',
//    'htmlcompressor',
//    'sass:build',
//    'concat',
//    'uglify',
//    'shell:jekyllBuild'
//  ]);

  // // Optional tasks
  // grunt.registerTask('ftp-deploy', ['ftpush']);
  // grunt.registerTask('imgcompress', [ 'image:dynamic']);

  // Optional tasks
  grunt.registerTask('backup_contents', [ 'compress:contents']);
  grunt.registerTask('backup_sources', [ 'compress:sources']);

  // Optional tasks
  grunt.registerTask('s', [ 'shell:jekyllServe']);
  grunt.registerTask('b', [ 'shell:jekyllBuild']);

};
// ----------------------------------
// End - module.exports
// ==================================