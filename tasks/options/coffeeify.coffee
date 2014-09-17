module.exports =
  dev:
    options:
      debug: true
    src: [
      'app/main.coffee'
    ]
    dest: 'main.js'

  prod:
    options:
      debug: false
    src: [
      'app/main.coffee'
    ]
    dest: 'main.js'
