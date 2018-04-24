require "util"

-- this is both in demo and alpha
require("prototypes.entity.demo-entities")
require("prototypes.ammo-category.categories")
require("prototypes.entity.demo-mining-drill")
require("prototypes.entity.demo-particles")
require("prototypes.entity.demo-resources")
require("prototypes.entity.demo-turrets")
require("prototypes.item.demo-ammo")
require("prototypes.item.demo-armor")
require("prototypes.item.demo-gun")
require("prototypes.item.demo-item")
require("prototypes.item.demo-mining-tools")
require("prototypes.item.demo-turret")
require("prototypes.item.item-groups")
require("prototypes.rail-category.categories")
require("prototypes.recipe.demo-furnace-recipe")
require("prototypes.recipe.demo-recipe")
require("prototypes.recipe.demo-turret")
require("prototypes.recipe-category.categories")
require("prototypes.tile.noise-layers")
require("prototypes.tile.tiles")
-- this is alpha only
-- therefore we use pcall and ignore errors when the files are missing
if util.ismoduleavailable("prototypes.entity.entities") then require("prototypes.entity.entities") end
if util.ismoduleavailable("prototypes.entity.projectiles") then require("prototypes.entity.projectiles") end
if util.ismoduleavailable("prototypes.entity.turrets") then require("prototypes.entity.turrets") end
if util.ismoduleavailable("prototypes.item.ammo") then require("prototypes.item.ammo") end
if util.ismoduleavailable("prototypes.item.armor") then require("prototypes.item.armor") end
if util.ismoduleavailable("prototypes.item.gun") then require("prototypes.item.gun") end
if util.ismoduleavailable("prototypes.item.item") then require("prototypes.item.item") end
if util.ismoduleavailable("prototypes.item.mining-tools") then require("prototypes.item.mining-tools") end
if util.ismoduleavailable("prototypes.item.module") then require("prototypes.item.module") end
if util.ismoduleavailable("prototypes.item.turret") then require("prototypes.item.turret") end
if util.ismoduleavailable("prototypes.recipe.ammo") then require("prototypes.recipe.ammo") end
if util.ismoduleavailable("prototypes.recipe.furnace-recipe") then require("prototypes.recipe.furnace-recipe") end
if util.ismoduleavailable("prototypes.recipe.inserter") then require("prototypes.recipe.inserter") end
if util.ismoduleavailable("prototypes.recipe.module") then require("prototypes.recipe.module") end
if util.ismoduleavailable("prototypes.recipe.recipe") then require("prototypes.recipe.recipe") end
if util.ismoduleavailable("prototypes.recipe.turret") then require("prototypes.recipe.turret") end
if util.ismoduleavailable("prototypes.technology.logistic-robot") then require("prototypes.technology.logistic-robot") end
if util.ismoduleavailable("prototypes.technology.module") then require("prototypes.technology.module") end
if util.ismoduleavailable("prototypes.technology.technology") then require("prototypes.technology.technology") end
