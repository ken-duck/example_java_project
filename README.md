# Example Java Project

## Setup

In order to use this, you'll need to create a `settings.xml` file. You can copy [`settings-example.xml`][settings] as a
starting point and then fill in the credentials with your user token information generated on the [Central Portal][csc].

The default server URL is `http://localhost:3000`, so if you want to publish to staging, you'll need to pass `-Dcentral.url=https://staging.portal.central.sonatype.dev` via the commandline.

## Usage

```shell
mvn --settings settings.xml clean deploy
```

### Usage (Nix)

The `flake.nix` file provides `mvnLocal` and `mvnStaging` commands that expect a `settings-local.xml` and `settings-staging.xml` file, respectively.

<!-- References -->

[settings]: ./settings-example.xml
[csc]: https://central.sonatype.com
