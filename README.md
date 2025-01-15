# Example Java Project

## Setup

In order to use this, you'll need to create a `settings.xml` file. You can copy
[`settings-example.xml`][settings] as a starting point and then fill in the
credentials with your user token information generated on the [Central
Portal][csc].

The default server URL is `http://localhost:3000`, so if you want to publish to
staging, you'll need to pass
`-Dcentral.url=https://staging.portal.central.sonatype.dev` via the command-line.

## Usage

```shell
mvn --settings settings.xml clean deploy -Prelease
```

### Usage (Nix)

The `flake.nix` file provides `mvnLocal` and `mvnStaging` commands that expect a
`settings-local.xml` and `settings-staging.xml` file, respectively.

## Projects

### Basic

Entrypoint: [`basic/pom.xml`](basic/pom.xml)

This project demonstrates the minimum viable publishing setup.

### Classless

Entrypoint: [`classless/pom.xml`](classless/pom.xml)

This project demonstrates the ability to publish JAR files without Java classes.

### Complex Structure

Entrypoint: [`complex_structure/pom.xml`](complex_structure/pom.xml)

This project creates a structure that demonstrates several patterns that we have
observed in deployments. It is meant to provide a quick smoke test for
publishing functionality.

### Dependency

Entrypoint: [`dependency/README.md`](dependency/README.md)

This project demonstrates doing pre-publish verification of a deployment via the
Central Publisher Portal.

### Different GroupId and Package

This project is a test case to ensure that `.jar` files that have a different
classpath/packaging than the `groupId` in the `pom.xml` files are successfully
rejected by the validation rules.

### Relocation

This project is a test case for generating a relocation POM for an existing project.

### Snapshot

This project is a test case for publishing and consuming `-SNAPSHOT` releases.

<!-- References -->

[settings]: ./settings-example.xml
[csc]: https://central.sonatype.com
