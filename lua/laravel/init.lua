-- can I remove this setup ?
-- can it be initialize when it starts or runs a command ?

---@param opts? LaravelOptions
local function setup(opts)
  local config = require "laravel.config"
  local environment = require "laravel.environment"

  config.setup(opts)
  require "laravel.tinker"
  environment.setup()
end

local function cleanCache()
  require("laravel.commands").list = {}
  require("laravel.routes").list = {}
end

return {
  setup = setup,
  cleanCache = cleanCache,
  routes = require("telescope").extensions.laravel.routes,
  artisan = require("telescope").extensions.laravel.artisan,
  history = require("telescope").extensions.laravel.history,
  make = require("telescope").extensions.laravel.make,
  commands = require("telescope").extensions.laravel.commands,
  resources = require("telescope").extensions.laravel.resources,
  recies = require("laravel.recipes").run,
  viewFinder = require("laravel.view_finder").auto,
}
