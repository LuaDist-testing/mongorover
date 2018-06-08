--[[

Copyright 2015 MongoDB, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

--]]

---
-- @submodule mongorover.resultObjects

--- The return type for delete_one() and delete_many().
--@type DeleteResult

local DeleteResult = {}
DeleteResult.__index = DeleteResult
	
	DeleteResult.__tostringx = function (table_location)
		DeleteResult.__tostring = nil    
		local ret= "<DeleteResult object at " .. tostring(table_location) .. ">"
		DeleteResult.__tostring = DeleteResult.__tostringx
		return ret
	end

	---
	-- Creates a MongoClient instance.
	-- Uses MongoDB connection URI (http://docs.mongodb.org/manual/reference/connection-string/).
	-- @tparam bool acknowledged Response from server.
	-- @tparam string raw_result The response from the server converted into a Lua table.
	function DeleteResult.new(acknowledged, raw_result)
		local self = setmetatable({}, DeleteResult)
		self.acknowledged = acknowledged
		self.deleted_count = raw_result['nRemoved']
		self.raw_result = raw_result
		return self
	end
	
	---
	-- Checks whether the object is an DeleteResult or not.
	-- @param object The object to be checked whether it is an DeleteResult.
	-- @treturn bool Whether the object is an DeleteResult or not.
	function DeleteResult.isDeleteResult(object)
		return getmetatable(object) == DeleteResult
	end
		
	DeleteResult.__tostring = DeleteResult.__tostringx    

return DeleteResult