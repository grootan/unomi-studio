curl --location --request POST 'http://localhost:8181/cxs/rules' \
--header 'Authorization: Basic a2FyYWY6a2FyYWY=' \
--header 'Content-Type: application/json' \
--data-raw '{
    "itemId": "_ajhg9u2s5_sessionAssigned",
    "itemType": "rule",
    "version": 1,
    "condition": {
        "parameterValues": {
            "subConditions": [
                {
                    "parameterValues": {
                        "eventTypeId": "sessionCreated"
                    },
                    "type": "eventTypeCondition"
                },
                {
                    "parameterValues": {
                        "eventTypeId": "sessionReassigned"
                    },
                    "type": "eventTypeCondition"
                }
            ],
            "operator": "or"
        },
        "type": "booleanCondition"
    },
    "actions": [
        {
            "parameterValues": {
                "setPropertyName": "properties.previousVisit",
                "setPropertyValue": "profileProperty::lastVisit",
                "storeInSession": false
            },
            "type": "setPropertyAction"
        },
        {
            "parameterValues": {
                "setPropertyName": "properties.lastVisit",
                "setPropertyValue": "now",
                "storeInSession": false
            },
            "type": "setPropertyAction"
        },
        {
            "parameterValues": {
                "setPropertyName": "properties.nbOfVisits",
                "setPropertyValue": "script::profile.properties.?nbOfVisits != null ? (profile.properties.nbOfVisits + 1) : 1",
                "storeInSession": false
            },
            "type": "setPropertyAction"
        },
        {
            "parameterValues": {
                "setPropertyName": "systemProperties.scope",
                "setPropertyValue": "eventProperty::scope",
                "storeInSession": false
            },
            "type": "setPropertyAction"
        }
    ],
    "linkedItems": null,
    "raiseEventOnlyOnceForProfile": false,
    "raiseEventOnlyOnceForSession": false,
    "raiseEventOnlyOnce": false,
    "priority": 0,
    "metadata": {
        "id": "_ajhg9u2s5_sessionAssigned",
        "name": "Session assigned to a profile",
        "description": "Update profile visit information",
        "scope": "systemscope",
        "tags": [],
        "systemTags": [],
        "enabled": true,
        "missingPlugins": false,
        "hidden": false,
        "readOnly": true
    }
}'

rm -rf misc

mkdir misc

curl -L -o ./misc/allCountries.zip https://bit.ly/3psjzCn

curl -L -o ./misc/GeoLite2-City.mmdb https://bit.ly/3uSUbqK

docker cp ./misc/allCountries.zip unomi:/opt/apache-unomi/etc

docker cp ./misc/GeoLite2-City.mmdb unomi:/opt/apache-unomi/etc

docker restart unomi