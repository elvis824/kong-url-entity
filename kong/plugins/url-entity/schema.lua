local typedefs = require "kong.db.schema.typedefs"

-- Grab pluginname from module name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

return {
    name = plugin_name,
    fields = {
        { consumer = typedefs.no_consumer },
        { config = {
            type = "record",
            fields = {
                { url_entity = { type = "string", required = false }, },
                { url_host = { type = "string", required = false }, },
            }
        }},
    },
    entity_checks = {
    },
}