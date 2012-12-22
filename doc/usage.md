[Tobacco Docs](TOC.md)

# Usage

Using Tobacco is easy, but make sure you have at least Maven 3.0.4:

    mvn archetype:generate                                      \
          -DarchetypeGroupId=me.noroutine                       \
          -DarchetypeArtifactId=tobacco-bootstrap               \
          -DarchetypeVersion=1.0.6

Example output (and values used for the rest of this page):

    Define value for property 'groupId': : org.example
    Define value for property 'artifactId': : coolapp
    Define value for property 'version':  1.0-SNAPSHOT: :
    Define value for property 'package':  org.example: :
    Confirm properties configuration:
    groupId: org.example
    artifactId: coolapp
    version: 1.0-SNAPSHOT
    package: org.example
     Y: : y


## Basic structure

A basic Tobacco webapp initially looks something like this:

```
.
├── coolapp-commons
│   └── pom.xml                                 - common classes to potentially share with other modules
├── coolapp-webapp
│   ├── pom.xml                                 - main webapp module
│   └── src
│       └── main
│           ├── java/org/example
│           │   ├── HomeController.java         - controller for /home
│           │   └── [...]
│           ├── resources
│           │   ├── logback.xml                 - logback configuration
│           │   ├── messages.properties         - main application message bundle
│           │   └── [...]
│           └── webapp
│               ├── WEB-INF
│               │   ├── jsp
│               │   │   ├── errors              - here live your error pages
│               │   │   │   └── 404.jsp         - 404 error page
│               │   │   ├── layout              - here live your tiles
│               │   │   │   ├── base.jsp        - base page layout
│               │   │   │   └── fragments
│               │   │   │       ├── navbar.jsp  - navigation bar
│               │   │   │       └── [...]
│               │   │   ├── templates           - here live your microtemplates
│               │   │   │   └── empty.jsp       - not useful dust.js template
│               │   │   └── views               - here live your views
│               │   │       └── home.jsp        - home page
│               │   ├── taglib                  - here live your TLDs
│               │   │   └── taglib.tld          - example (but helpful) taglib placeholder
│               │   ├── tags                    - here live your tagdirs
│               │   │   └── util                - example (but helpgul) util tag(dir) library
│               │   │       ├── css.tag         - tag for easy CSS inclusion
│               │   │       ├── dust.tag        - tag for easy dust.js template inclusion
│               │   │       └── js.tag          - tag for easy js inclusion
│               │   ├── jdbc.properties         - JDBC connection properties
│               │   ├── spring-security.xml     - spring security configuration file
│               │   ├── spring.xml              - spring application context
│               │   ├── spring-servlet.xml      - DispatcherServlet context
│               │   ├── tiles-defs.xml          - Tiles configuration
│               │   ├── urlrewrite.xml          - in-app URL redirects
│               │   └── web.xml                 - J2EE webapp descriptor
│               ├── css                         - place for your CSS files
│               │   ├── main.css                - main application CSS
│               │   └── vendor                  - Normalize and Bootstrap stylesheets
│               │       └── [...]
│               ├── img
│               │   └── [...]                   - Bootstrap sprites and your images
│               ├── js                          - place for your JS code
│               │   ├── common.js               - random js stuff
│               │   ├── compatibility.js        - some basic compatibility stuff
│               │   ├── core.js                 - helpful for IDEA syntax inspection
│               │   ├── pages                   - place for per-page js
│               │   │   └── home.js             - home page script
│               │   └── vendor                  - here live Backbone and friends
│               │       └── [...]
│               ├── [apple touch icons]         - a set of icons for mobile devices
│               ├── favicon.ico                 - website icon
│               ├── crossdomain.xml             - Adobe crossdomain policy file
│               └── robots.txt                  - hello to indexing robots
├── repository                                  - internal project MAven repository
├── LICENSE.md                                  - license information
├── atlassian-ide-plugin.xml                    - configuration for JIRA
└── pom.xml                                     - root project POM
```


Now you're ready to go:

    cd coolapp/coolapp-webapp
    mvn package t7:run

Now you'll be ready to get your pages at <http://localhost:8080/coolapp>

What follows is a general overview of each major part and how to use them.

### repository

This directory is an empty Maven repository, that is looked for artifacts.
Often it is needed to keep custom or missing artifacts inside project tree

### css

This directory should contain all your project's CSS files. It includes some
initial CSS to help get you started from a solid foundation. [About the
CSS](css.md).

### js

This directory should contain all your project's JS files. Libraries, plugins,
and custom code can all be included here. It includes some initial JS to help
get you started. [About the JavaScript](js.md).

### 404.jsp

A helpful custom 404 to get you started.

### home.jsp

This is the default HTML skeleton that should form the basis of all pages on
your site.

### empty.jsp

Empty dust.js template is a good start for future templates.

### robots.txt

Edit this file to include any pages you need hidden from search engines.

### crossdomain.xml

A template for working with cross-domain requests. [About
crossdomain.xml](crossdomain.md).

### icons

Replace the default `favicon.ico` and apple touch icons with your own. You
might want to check out Hans Christian's handy [HTML5 Boilerplate Favicon and
Apple Touch Icon
PSD-Template](http://drublic.de/blog/html5-boilerplate-favicons-psd-template/).
