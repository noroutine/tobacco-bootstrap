# ChangeLog

## 1.0.11 (24 Feb 2013)
* Lodash 1.0.1
* dust.js 1.2.0 / dust4j 0.2
* Spring 3.2.1
* urls in navbar are now absolute
* templates are now served throug separate endpoint with security disabled
* added few usefull libs, like commons-codec and commons-fileupload
* fixed warnings from yui in javascript code (https://github.com/noroutine/tobacco-bootstrap/issues/11)

## 1.0.10 (12 Feb 2013)
* Twitter Bootstrap 2.3.0
* jQuery 1.9.1
* HTML5 Boilerplate 4.1.0

## 1.0.9 (19 Jan 2013)
* jQuery 1.9.0
* HTML5 Boilerplate 4.0.3
* Backbone.js 0.9.10
* fixed script error with jQuery loaded in footer

## 1.0.8 (24 Dec 2012)
* scripts moved to the end of the page to speed up page rendering
* tobacco maven plugin for easy project generation

## 1.0.7 (23 Dec 2012)
* replace underscore.js with lodash <http://lodash.com/>
* add Spring Security config, with TB-style form for easier security start
* aggregate licenses to single file
* remove minified versions of js and css, now we solely rely on yui compressor
* change Apple site mode from black to default, as black is not what you normally want, even if it looks so ;)
* removed weak Id function, in favor of _.uniqueId
* fixed messages.properties duplicates
* updated docs a bit
* added generic error page with nice 500 stacktrace output
* got rid of trivial mappings in favor of org.springframework.web.servlet.mvc.ParameterizableViewController
* more error handler entries for 4xx error codes added by default

## 1.0.6 (19 Dec 2012)
* Tiles 3.0.1
* JRebel included by default
* fixed JSONP issue with resources
* removed doc junk from project template
* dev versions of tiny pub/sub and jStorage

## 1.0.3 (14 Dec 2012)
* Spring 3.2
* backbone.js 0.9.9
* other libraries updates, pom cleanup and minor fixes

## 1.0.2 (11 Dec 2012)
* initial public release
* update to Twitter Bootstrap 2.2.2
* update to HTML5 Boilerplate 4.0.2
* update to underscore.js 1.4.3 
* added context-aware Apple icons and favicon
* fixed css for small screens
* less logging in production
* other bugfixes

## 1.0 (09 Dec 2012)
* initial release
