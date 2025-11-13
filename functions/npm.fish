function npm
    ARTIFACTS_ACCESSTOKEN=(az account get-access-token --resource "499b84ac-1321-427f-aa17-267ca6975798" --query accessToken -o tsv) command npm $argv
end
