This is an experiment around installable web applications. What you'll find here:

addons/
Addons for different browsers that provide better support for web applications: including new features (like search and notification support) and better integration into browser UI.
docs/
Documentation, including an in-depth discussion of the design and goals of the project.
example/
An example that shows how to integrate myapps javascript libraries to allow a site author to trigger an installation of their application.
harness/
Files related to setting up a local develoment environment. Currently a nodejs script that will allow you to run a webserver that serves up the various sites contained here.
site/
The "myapps" website. To the end user this site is a location where they can launch their application dashboard. To the developer this is the domain under which several javascript libraries are hosted that allow interaction with the user's applications. Site nightlies are hosted at https://myapps.mozillalabs.com
store/
The "appstore" website, implemented as a Python webserver. Implements a demonstration application store that performs authentication of users and provides "proof-of-purchase" assertions to applications. No real payment processing is performed. Hosted at https://appstore.mozillalabs.com.
