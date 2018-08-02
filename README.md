# Flask Sample Application

This repository provides a sample Python web application implemented using the Flask web framework and hosted using ``gunicorn``. It is intended to be used to demonstrate deployment of Python web applications to OpenShift 3 via a custom Dockerfile. 

## Implementation Notes

This sample Python application relies on the Dockerfile provided in the repo for building the image for the WSGI application using the ``gunicorn`` WSGI server. The requirements which need to be satisfied for this to work are:

* The WSGI application code file needs to be named ``wsgi.py``.
* The WSGI application entry point within the code file needs to be named ``application``.
* The ``gunicorn`` package must be listed in the ``requirements.txt`` file for ``pip``.

In addition, there is a section in the template yaml to allow environment variables to be set.

* The environment variable ``APP_CONFIG`` has been set to declare the name of the config file for ``gunicorn``.

## Deployment Steps

The HTTPS URL of this code repository which should be supplied to the SOURCE_REPOSITORY_URL parameter is:

* https://github.com/SnowBiz/os-python.git
    * If you fork this repo update this url with your repos url.

If using the ``oc`` command line tool instead of the OpenShift web console, to deploy this sample Python web application, you can clone the repository and run:

```
oc process -f ./template.yaml | oc create -f -
```

The template as is expects a project namespace to be already created called "External" you can create this via the oc client tools.
```
oc new-project External
```