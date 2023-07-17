# Example Java Project

## Setup

In order to use this, you'll need to create a `settings.xml` file. You can copy [`settings-example.xml`][settings] as a
starting point and then fill in the credentials with your user token information generated on the [Central Portal][csc].

## Usage

```shell
mvn --settings settings.xml clean deploy
```

Note: Using the Nix DevShell will set the settings file via an environment variable, so passing it in manually should
not be required.

<!-- References -->

[settings]: ./settings-example.xml
[csc]: https://central.sonatype.com