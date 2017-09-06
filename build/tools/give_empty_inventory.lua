#!/usr/bin/lua

local zone, x, y, size = ...

for n=1,size do
	place_settag(zone, x, y, "content_artifact_"..n, "EMPTY")
end
