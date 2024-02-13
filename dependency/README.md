# Dependency Example

This folder demonstrates the functionality of having a repository depend on a
prereleased version of a library that has been uploaded as a deployment to the
Central Publisher Portal.

## Usage

1. Upload the parent with `cd parent && mvnStaging deploy -Prelease && cd -`
1. Remove the local version from your local `.m2` cache with `rm -rf
   ~/.m2/repository/io/github/amy-keibler/dependency/example_dependency_parent`
1. If using the Gradle build, remove any local versions from your Gradle cache
   as well with `rm -rf ~/.gradle/caches`
1. Attempt to build the child with `cd child && mvnStaging verify`
