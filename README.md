CI-Tools
========

This project contains a collection of tools intended for use in CI environments to monitor and test the application stack, etc.

Commands
--------

### Basic Health Check 

Check to see if a url is OK or not. It will return the appropriate exit code on success or failure.

Basic example:

> ci-health-check http://www.boogawooga.com/health

With basic auth and SSL

> ci-health-check https://www.boogawooga.com/health --auth user:pass

Note: checks will ignore invalid SSL certificates.

### API Check

Coming soon...



TODO/ IDEAS:
============

* Create a basic http client to monitor AM API status
* Create Watir scripts that create accounts and login to AM
* Use Google Docs or a wiki for storing the urls and api end points to check
