module.exports = (grunt) ->
  # Project configuration.
  @initConfig
    pkg: @file.readJSON 'package.json'
    coffee:
      compile:
        expand: true
        flatten: true
        cwd: './'
        src: ['assets/coffee/**/*.coffee']
        dest: 'assets/javascripts'
        ext: '.js'
    uglify:
      compile:
        files: [
          expand: true
          cwd: './'
          src: ['assets/javascripts/**/*.js']
          dest: 'public'
        ]
    sass:
      compile:
        options:
          style: 'compressed'
        files: [
          expand: true
          cwd: './'
          src: ['assets/stylesheets/**/*.scss']
          dest: 'public'
          ext: '.css'
        ]

    watch:
      sass:
        files: ['assets/stylesheets/**/*.scss']
        tasks: ['sass']
      coffee:
        files: ['assets/coffee/**/*.coffee']
        tasks: ['coffee']
      js:
        files: ['assets/javascripts/**/*.js']
        tasks: ['uglify']

  @loadNpmTasks 'grunt-contrib-watch';
  @loadNpmTasks 'grunt-contrib-sass';
  @loadNpmTasks 'grunt-contrib-uglify';
  @loadNpmTasks 'grunt-contrib-coffee';

  # Default task(s).
  @registerTask 'default', ['coffee', 'sass']