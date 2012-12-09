tobacco-bootstrap
=================

HTML5 Java web app archetype with latest and gratest components.

I always thought Java can do no less than RoR or any other fancy whistle framework out there without any mimicking aka Roo. 

Tobacco shows how Java can do modern projects in 5 seconds in it's own addictive style. It doesn't dictate you three-tiers or any particular database, but I've tried my best to save your time on starting and setting up new web project.

Whats inside
------------

Client=-side stuff
* [Twitter Bootstrap](http://twitter.github.com/bootstrap/) for your UI to not suck
* [HTML5 boilderplate](http://html5boilerplate.com/) for your result HTML to use best practices available
* [modernizr.js](http://modernizr.com/) to make your app display good on anything
* [normalize.css](http://necolas.github.com/normalize.css/) for your app to look consistent
* [jQuery](http://jquery.com/) for you to write less and do more
* [Backbone.js](http://backbonejs.org/) to make your JS code to be organized more MVC-ish
* [underscore.js](http://underscorejs.org/) to give you powerful common library
* [dust.js](linkedin.github.com/dustjs/) for you to use the fastest client-side templating engine on the planet
* [dust4j](http://dust4j.noroutine.me/) to let you write your templates in pure JSP and make them dynamic

Server-side stuff
* [Spring 3.1.3](http://www.springsource.org/) for wiring your components
* [Tiles 2.2.2](http://tiles.apache.org/) to organize your views

There is some dozen of other smaller and less important stuff that you find adding to any new project all the time. 

_Important notes about JPA and database access_

I didn't bother to configure JPA or Spring Security to create another zillion-and-one archetype for 3-tier Spring web app. 
All needed stuff is still there for you to configure or remove at all if you don't need it - it's just commented out and not used from start. 

Instead I've made a focus on packing modern stuff inside and make it easy to start a project with best of breed HTML and javascript

Work of H5BP and TB was combined and Bootstrap is used by default, but you can still easily fallback and use plain H5BP if you don't intemd to use TB.
That means that all the stuff from H5BP is still provided for you to benefit from professional comments, I tried to be as consistent as possible with original works.

All scripts have their minified versions present. JS and CSS is automatically compressed and aggregated if you use production profile. 

How to use
----------

    git clone git://github.com/noroutine/tobacco-bootstrap.git
    cd tobacco-bootstrap
    mvn install

Now anytime you are ready to rock the world with new project:

    mvn archetype:generate                                      \
          -DarchetypeGroupId=me.noroutine                       \
          -DarchetypeArtifactId=tobacco-bootstrap               \
          -DarchetypeVersion=1.0

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

Build Versioning
----------------

For generated projects to run, they should be versioned by Git (preferred) or any other SCM.

Thanks
------

Thanks to H5BP and TB guys. You're the best and I just love you!
Thanks to GitHub, your service is awesome. Thanks to Maven guys, you simply rock, but please can you make mvn less verbose by default ;)

