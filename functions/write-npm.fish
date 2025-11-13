function write-npm --description "Write Azure Artifacts npm configuration to .npmrc"
    set -l artifacts_feed $argv[1]
    set -l feed_user $argv[2]
    set -l feed_email $argv[3]

    # Set defaults
    if test -z "$feed_user"
        set feed_user AzCliToken
    end

    if test -z "$feed_email"
        set feed_email "not-used@example.com"
    end

    # Check if ARTIFACTS_FEED is provided
    if test -z "$artifacts_feed"
        echo "  Usage: write-npm <ARTIFACTS_FEED> <FEED_USER>(optional) <FEED_EMAIL>(optional)"
        echo "example: write-npm pkgs.dev.azure.com/orgname/projectname/_packaging/feedname/npm"
        return 1
    end

    # Write to .npmrc
    echo "//$artifacts_feed/registry/:username=$feed_user" >>$HOME/.npmrc
    echo "//$artifacts_feed/registry/:_authToken=\${ARTIFACTS_ACCESSTOKEN}" >>$HOME/.npmrc
    echo "//$artifacts_feed/registry/:email=$feed_email" >>$HOME/.npmrc
    echo "//$artifacts_feed/:username=$feed_user" >>$HOME/.npmrc
    echo "//$artifacts_feed/:_authToken=\${ARTIFACTS_ACCESSTOKEN}" >>$HOME/.npmrc
    echo "//$artifacts_feed/:email=$feed_email" >>$HOME/.npmrc
end
