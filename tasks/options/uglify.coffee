module.exports =
  options:
    banner: '/*! uglified <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
  build:
    files: [{
      expand: true,
      cwd: './',
      src: '*.js',
      dest: './'
      ext: '.min.js'
    }]