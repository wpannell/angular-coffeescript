# Exports a function which returns an object that overrides the default &
# *   plugin grunt configuration object.
# *
# * You can familiarize yourself with Lineman's defaults by checking out:
# *
# *   - https://github.com/linemanjs/lineman/blob/master/config/application.coffee
# *   - https://github.com/linemanjs/lineman/blob/master/config/plugins
# *
# * You can also ask Lineman's about config from the command line:
# *
# *   $ lineman config #=> to print the entire config
# *   $ lineman config concat.js #=> to see the JS config for the concat task.
# 
module.exports = (lineman) ->
  
  #Override application configuration here. Common examples follow in the comments.
  
  # API Proxying
  #
  # During development, you'll likely want to make XHR (AJAX) requests to an API on the same
  # port as your lineman development server. By enabling the API proxy and setting the port, all
  # requests for paths that don't match a static asset in ./generated will be forwarded to
  # whatever service might be running on the specified port.
  #
  # server: {
  #   apiProxy: {
  #     enabled: true,
  #     host: 'localhost',
  #     port: 3000
  #   }
  # }
  
  # Sass
  #
  # Lineman supports Sass via grunt-contrib-sass, which requires you first
  # have Ruby installed as well as the `sass` gem. To enable it, comment out the
  # following line:
  #
  # enableSass: true
  
  # Asset Fingerprints
  #
  # Lineman can fingerprint your static assets by appending a hash to the filename
  # and logging a manifest of logical-to-hashed filenames in dist/assets.json
  # via grunt-asset-fingerprint
  #
  # enableAssetFingerprint: true
  spec:
    options:
      growl: true

  jshint:
    files: ["<%= files.js.app %>"]
    options:
      globals:
        _: false #lodash
        $: false #jquery

        #jasmine
        jasmine: false
        describe: false
        it: false
        expect: false
        beforeEach: false
        waits: false
        runs: false

    # enforcing options
      curly: true
      eqeqeq: true
      latedef: true
      newcap: true
      noarg: true

    # relaxing options
      boss: true
      eqnull: true
      sub: true

    # environment/globals
      browser: true
      devel: true
      globalstrict: true
