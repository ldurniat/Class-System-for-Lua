------------------------------------------------------------------------------------------------
-- The class module.
--
-- @module  class
-- @license MIT
-- @copyright Łukasz Durniat, Nov-2024
------------------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------------ --
--                                 MODULE DECLARATION                                         --                        
-- ------------------------------------------------------------------------------------------ --

local M = {}

-- ------------------------------------------------------------------------------------------ --
--                                 PUBLIC METHODS                                             --    
-- ------------------------------------------------------------------------------------------ --

-- Creates a derived class from a base class.
-- 
-- @param `base_class`: The class to inherit from. Can be `nil` to create a new base class.
--
-- @return A new class (child class) derived from `base_class`.
function M.extend(base_class)
    local child_class = {} -- Create a new class (child class)

    if base_class then
        setmetatable(child_class, { __index = base_class }) -- Set inheritance from `base_class`
    end

    -- Adds a method to create new instances of the class.
    --
    -- @return A new instance of the class with its metatable set to the class itself.
    function child_class:new()
        local instance = {} -- Create a new instance
        setmetatable(instance, { __index = self }) -- Set the instance's metatable to reference the class
        return instance
    end

    return child_class
end

return M
