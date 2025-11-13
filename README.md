# az cli fish wrapper

This is a fish plugin that wraps various commands with azure cli token auth.

Inspired by [microsoft/codespace-features - artifacts-helper](https://github.com/microsoft/codespace-features/tree/main/src/artifacts-helper).

This tool simply adds the environment variable ARTIFACTS_ACCESSTOKEN with the result of `az account get-access-token --resource "499b84ac-1321-427f-aa17-267ca6975798" --query accessToken -o tsv` so that installs/commands can access the configured azure package feed.

To add the registry to your `~/.npmrc`:

```fish
# This is custom for your package feed
write-npm $ORG.pkgs.visualstudio.com/_packaging/$ORG/npm/registry
```

## Installing

```fish
fisher install scaryrawr/az-auth.fish
```

## Dependencies

[Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).

Make sure to login to the Azure CLI.
