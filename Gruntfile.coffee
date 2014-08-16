module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')

    # Webserver.
    connect:
      server:
        options:
          port: 5000
          hostname: '*'
          base: 'build'
          livereload: true


    # Build HTML pages from templates.
    includes:
      files:
        src: ['src/*.html', '!src/_*.html']
        dest: 'build'
        flatten: true


    # SASS and Autoprefixer for CSS, and watcher.
    sass:
      build:
        options:
          style: 'compressed'
        files:
          'tmp/style.css' : 'src/css/style.sass'

    autoprefixer:
      build:
        src: 'tmp/style.css'
        dest: 'build/css/style.css'


    # Optimize images
    imagemin:
      files:
        expand: true
        cwd: 'src/img'
        src: ['**/*.{png,jpg,gif}']
        dest: 'build/img/'


   # Live processing.
    watch:
      html:
        files: ['src/*.html']
        tasks: ['includes']

      sass:
        files: [
          'src/css/*.sass'
          'src/css/*.scss'
        ]
        tasks: ['sass:build']

      autoprefixer:
        files: ['tmp/style.css']
        tasks: ['autoprefixer']

      imagemin:
        files: ['src/img/**/*']
        tasks: ['imagemin']

      livereload:
        files: ['build/css/style.css']
        options: { livereload: true }

      reload:
        files: [
          'build/*.html'
          'build/img/*'
          'build/js/*.js'
        ]
        options: { livereload: true }


    # Push site to GitHub Pages. Only run via `grunt deploy`.
    'gh-pages':
      options:
        base: 'build'
      src: ['**']
  }


  # Load all Grunt plugins.
  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-gh-pages'
  grunt.loadNpmTasks 'grunt-includes'


  # Register grunt tasks.
  grunt.registerTask 'setup',   ['includes', 'sass', 'autoprefixer', 'imagemin']
  grunt.registerTask 'default', ['setup', 'connect', 'watch']
  grunt.registerTask 'deploy',  ['gh-pages']
