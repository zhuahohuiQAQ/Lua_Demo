--%：取模操作符， 对于整数， 计算结果的符号永远与第二个参数相同， 对于师叔， 则可能
--有其他用途，例如：x%1的结果就是x的小数部分， 而x-x%1的结果就是其整数部分， x-x%0.01
--则是x精确到小数点后两位的结果
--[[x = math.pi;
print(x - x%0.01);--x精确到小数点后两位的结果]]

--[[
local  tolerance = 10;
function isturnback( angle )
	angle = angle % 360;
	return (math.abs(angle - 180) < tolerance);
end
print(isturnback(-180));

local tolerance = 0.17;
function isturnback( angle )
	angle = angle % (2*math.pi);
	return (math.abs(angle - math.pi) < tolerance);
end
print(isturnback(-math.pi));
]]

--[[and  or  not ::  a and b: 如果a为假， 返回a， 否则， 返回b    a or b::如果a为真， 返回a， 否则， 返回b]]
--[[
print(4 and 5);
print(nil and 12);
print(false and 13);
print(4 or 5);
print(false or 5);
print(not nil);
print(not false);
v = 10;
if not x then
	x = v;
end
print(x);
--]]

--字符串连接
--[[
print("Hello" .. "World");
print(0 .. 1);-- ..字符串连接符
]]

--table构造式
--[[days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
print (days[4]);
for k,v in ipairs(days) do
	print(k,v)
end]]

--[[
w = {x = 0; y = 0; label = "console"}
x = {math.sin(0), math.sin(1), math.sin(2)};
w[1] = "another field";
x.f = w;
print(w["x"]);
print(w[1]);
print(x.f[1]);
for k,v in pairs(w) do
	print(k,v)

end
for k,v in pairs(x) do
	print(k,v)
end
w.x = nil;
]]

--[[polyLine = {color = "blue", thickness = 2, npoints = 4, {x = 0, y = 0}, {x = -10, y = 0}, {x = -10, y = 1}, {x = 0, y = 1}};
print(polyLine[2].x);
print(polyLine[4].y);]]

--[[x = 10;
local  i = 1;
while i  <= x do
	local x = i*2;
	print(x);
	i = i + 1;
end
if i >= 20 then
	local  x;
	x = 20;
	print(x + 1);
else
	print(x);
	end
	print(x);]]