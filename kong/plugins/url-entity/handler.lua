local base_plugin = require "kong.plugins.base_plugin"
local UrlEntityHandler = base_plugin:extend()
local url_entity_header_name = "X-Url-Entity"
local url_host_header_name = "X-Url-Host"

local kong = kong
local ngx = ngx

-- Grab pluginname from module name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

function UrlEntityHandler:new()
    UrlEntityHandler.super.new(self, plugin_name)
    kong.log.info("url-entity: creating handler")
end


function UrlEntityHandler:access(config)
    UrlEntityHandler.super.access(self)

    if config.url_entity ~= nil then
        ngx.req.set_header(url_entity_header_name, config.url_entity)
        kong.response.set_header(url_entity_header_name, config.url_entity)
    end
    if config.url_host ~= nil then
        ngx.req.set_header(url_host_header_name, config.url_host)
        kong.response.set_header(url_host_header_name, config.url_host)
    end
end

UrlEntityHandler.PRIORITY = 1000

return UrlEntityHandler