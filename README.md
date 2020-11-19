# Kloud images build

This action builds the docker images requied, using the [kiboko-labs/kloud](https://github.com/kiboko-labs/kloud) manager.

Images built are optimized for OroPlatform, OroCRM, OroCommerce, Marello and Middleware applications.

## Inputs

### `php-version`

**Required** The PHP version to use for the images.

### `application`

**Required** The application for which the images will be built (oroplatform, orocrm, orocommerce, amrello or middleware).

### `application`

**Required** The application for which the images will be built (oroplatform, orocrm, orocommerce, amrello or middleware).

### `application-version`

**Required** The Application version for which the images will be built.

### `edition`

**Required** Set "enterprise" to build for Enterprise Edition, "community" to build for Community Edition.

### `dbms`

**Required** The Database engine for which the images are built (postgresql or mysql).

### `with-blackfire`

**Required** Include Blackfire images.

### `xdebug`

**Required** Include Xdebug images.

## Example usage

```yaml
uses: gplanchat/github-action-kloud-build@master
with:
  php-version: '7.4'
  application: 'orocommerce'
  application-version: '4.1'
  edition: 'enterprise'
  dbms: 'postgresql'
  with-blackfire: true
  with-xdebug: true
```
