[Tobacco Bootstrap](http://noroutine.github.com/tobacco-bootstrap)
=================

HTML5 Java web app archetype with latest and gratest components.

I always thought Java can do no less than RoR or any other fancy whistle framework out there without any mimicking aka Roo. So I decided to create this client-centric archetype that is always packed with latest JS and Java libraries, uses all the latests best practices and called it Tobacco because it's addictive!

Tobacco's focus is on providing modern stuff inside and make it easy to start a project with best of breed HTML5 templates and JavaScript libs, so you don't spend hours settings up the project, downloading libraries and placing them in correct locations. With Tobacco you always get's this done for you. All you need is generate your project and start coding.

Tobacco shows how Java can do modern projects in 5 seconds in it's own style. It doesn't dictate you to three-tiers if you do something simple, nor does it tells you which persistence layer to use, instead it tries its best to save your time on starting and setting up new web project and not be in the way after that.

Demo
----

Real website is worth thousands of words, so I setup [Tobacco Demo](http://zion.noroutine.me:8080/tobacco-demo) for you to check.

What's inside
------------

All components are of latest versions. I'll continue to update this archetype with latest versions.

Client-side stuff 
* [Twitter Bootstrap 2.2.2](http://twitter.github.com/bootstrap/) for your UI to not suck
* [HTML5 boilderplate 4.0.2](http://html5boilerplate.com/) for your result HTML to use best practices available
* [Modernizr.js 2.6.2](http://modernizr.com/) to make your app display good on anything
* [Normalize.css 1.0.2](http://necolas.github.com/normalize.css/) for your app to look consistent
* [jQuery 1.8.3](http://jquery.com/) for you to write less and do more
* [Backbone.js 0.9.9](http://backbonejs.org/) to make your JS code to be organized more MVC-ish
* [LoDash.js 1.0.0rc3](http://lodash.com/) to give you powerful common library
* [dust.js 1.1.1](http://linkedin.github.com/dustjs/) for you to use the fastest client-side templating engine on the planet
* [dust4j 0.1](http://dust4j.noroutine.me/) to let you write your templates in pure JSP and make them dynamic

Server-side stuff
* [Spring 3.2](http://www.springsource.org/) for wiring your components
* [Tiles 3.0.1](http://tiles.apache.org/) to organize your views

There is some dozen of other smaller and less important stuff that you find adding to any new project all the time or just convenient. 

* [common.js](https://github.com/noroutine/tobacco-demo/blob/master/tobacco-demo-webapp/src/main/webapp/js/common.js) adds UUID, weak ID and Base64 support among other things
* [ResourceController](https://github.com/noroutine/tobacco-demo/blob/master/tobacco-demo-webapp/src/main/java/me/noroutine/ResourcesController.java) automatically exposes your i18n resources to JS so you can reuse them
* [@IfNoneMatch](https://github.com/noroutine/tobacco-demo/blob/master/tobacco-demo-webapp/src/main/java/me/noroutine/cache/IfNoneMatch.java) annotation lets you make your responses cacheable by browser

About JPA and database access
-----------------------------

I didn't bother to configure JPA or Spring Security to create another zillion-and-one archetype for 3-tier Spring web app. It's overkill and just narrow-minded to require database for any project. If you need it - you can still set it up though.

All needed stuff is still there for you to configure or remove at all if you don't need it - it's just commented out and not used from start. 

Work of H5BP and TB was combined and Bootstrap is used by default, but you can still easily fallback and use plain H5BP if you don't intemd to use TB.
That means that all the stuff from H5BP is still provided for you to benefit from professional comments, I tried to be as consistent as possible with original works.

All scripts have their minified versions present. JS and CSS is automatically compressed and aggregated if you use production profile. 

How to use
----------
_Make sure you have the latest Maven installed, at least version 3.0.4 is required_

Normally Maven you don't need to install Tobacco, but in case you want to work with development version, follow thes instructions.

    git clone git://github.com/noroutine/tobacco-bootstrap.git
    cd tobacco-bootstrap
    mvn install

Now anytime you are ready to rock the world with new project:

    mvn archetype:generate                                      \
          -DarchetypeGroupId=me.noroutine                       \
          -DarchetypeArtifactId=tobacco-bootstrap               \
          -DarchetypeVersion=1.0.6

now your project is generated, it is required to setup SCM. git is meant to be used.
    
    cd <app-name>
    git init

Now you're ready to go:

    cd <app-name>-webapps
    mvn package t7:run

after few minutes of terrifying console output, you can hope to access your new app at http://localhost:8080/<app-name>

Profiles
--------

Project generated from Tobacco Bootstrap has three profiles:
* development(default) - development version of JS and CSS are used, moderate logging
* production - minified versions of JS and CSS are used, only errors are logged
* debug - same as development, but maximum logging

Switch beetween them from your IDE, or in command-line add `-P<profile>` as option to `mvn`

Build Versioning
----------------

For generated projects to run, they should be versioned by Git (preferred) or any other SCM.

Thanks
------

Thanks to H5BP and TB guys. You're the best and I just love you!

Thanks to GitHub, your service is awesome.

Thanks to Maven guys, you simply rock, but please can you make mvn less verbose by default ;)

