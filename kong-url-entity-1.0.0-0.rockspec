package = "kong-url-entity"
version = "1.0.0-0"
source = {
    url = "https://github.com/elvis824/kong-url-entity",
    tag = "v1.0.0",
    dir = "url-entity",
}
description = {
    summary = "A Kong plugin for injecting url entity header based on ingress configuration",
    detailed = [[
        kong-url-entity is a Kong plugin for injecting URL entity header. An entity can be configured in an ingress entry so that an extra header X-Url-Entity is attached to requests to upstream, which allows upstream and downstream to identity the source of requests.
    ]],
    homepage = "https://github.com/elvis824/kong-url-entity",
    license = "Apache 2.0"
}
dependencies = {
    "lua >= 5.1",
}
build = {
    type = "builtin",
    modules = {
        ["kong.plugins.url-entity.handler"] = "kong/plugins/url-entity/handler.lua",
        ["kong.plugins.url-entity.schema"] = "kong/plugins/url-entity/schema.lua",
    }
}
