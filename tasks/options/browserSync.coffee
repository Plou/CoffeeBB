module.exports =
  dev:
    options:
      watchTask: true
      ghostMode:
          clicks: true
          scroll: true
          links: true
      server:
        baseDir: "./"
    bsFiles:
      src : [
        './*.js'
        './*.css'
        './*.html'
      ]
