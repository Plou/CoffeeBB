module.exports =
  coffee:
    files: [
      'app/*.coffee'
      'app/**/*.coffee'
    ]
    tasks: [
      'coffeeify:dev'
    ]
