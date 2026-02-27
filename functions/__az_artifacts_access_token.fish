function __az_artifacts_access_token
    if test -n "$ARTIFACTS_ACCESSTOKEN"
        echo "$ARTIFACTS_ACCESSTOKEN"
    else
        az account get-access-token --resource "499b84ac-1321-427f-aa17-267ca6975798" --query accessToken -o tsv
    end
end
