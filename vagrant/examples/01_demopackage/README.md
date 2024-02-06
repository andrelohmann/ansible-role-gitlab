# Artifacts, Packages and Registry Example

This repository includes just enough code to test a few functionalities:
* Create a docker image and push it to the registry
* Reuse the docker image
* Create an artifact
* Pull an image by making use of the dependecy proxy
* Create a Python package and push it to the package registry
* Create a release

Testing all the steps

* Login as exampleuser
* Select the "demopackage" project
* Open Web IDE and add an empty README.md file
* Commit the file to the main branch
* Add the files of this directory to the repository
* Commit everything to a new branch and create a merge request to main
* Watch the pipeline jobs
* Watch the docker image to be build and pushed
* Check the docker image on the left "Deploy -> Container Registry"
* Watch the docker image to be reused and the artifact to be created
* Check the Artifact on the left "Build -> Artifacts"
* Merge the branch into main
* Tag the main branch (e.g. release-1.0.0)
* Watch the pipeline creating your building and pushing your python package
* Check the package on the left "Deploy -> Package Registry"
* Watch the pipeline creating your release
* Check the release on the left "Deploy -> Releases"
