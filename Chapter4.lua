--[[a, b, c = 0, 1;
print(a, b, c);
a, b = a+1, b+1, b+2;
print(a, b);
a, b, c = 0;
print(a, b, c);
a, b, c = 0, 0, 0;
print(a, b, c);]]

--[[
x = 10;
local i = 1;
while i <= x do
	local  x = i*2;
	print(x);
	i = i+1;
end
if i > 20 then
	local x;
	x = 20;
	print(x +2);
else
	print(x);
	end
	print(x);
--]]

--[[local a, b = 1, 10;
if a<b then
	print(a);
	local a = a; --用全局变量初始化局部变量
print (a);
end
print(a, b);]]

--if then else 语句
--[[a = 23;b= 1;
if a < 0 then a = 0 end print(a);
if a < b then print(a); else print(b); end;]]

--Lua 不支持switch语句， 所以这种一连串的if-elseif代码是很常见的
--[[a, b = 1, 2;
op = "+";
if op == "+" then
	r = a + b;
elseif op == "-" then
		r = a - b;
elseif op == "*" then
		r = a * b;
elseif op == "/" then
			r = a/b;
else 
	error("invalid operations");
end
print(r);]]

--while语句:先判断， 后执行循环体
--[[a = {"asdf", "jik", "sdfg"};
local  i = 1;
while a[i] do
	print(a[i]);
	i = i + 1;
end
]]

--repeat...until :重复执行循环体直到条件为真时结束, 先执行循环体， 后判断循环条件， 因此循环体至少执行一次。
--[[repeat 
	line = io.read();--打印输入的第一行不为空的内容
	until line ~= "";
		print(line);]]

--[[x = 23;
local  sqr = x/2;
repeat
	sqr = (sqr + x/sqr)/2;
	local error = math.abs(sqr^2 - x);--在Lua中， 一个声明在循环体中的局部变量的作用域包括了条件测试
	print(error);
	until error < x/10000;]]--在此仍可以访问error

--数字型for 循环语句
--[[for i=10,1,-1 do
	print(i)
end]]

--[[for i = 1, math.huge do -- 如果不想给循环设置上限的话， 可以使用常量math.huge
	if(0.3*i^3 - 20*i^2 -500 >= 0)then
		print(i);
	end
end]]

--[[a = {1, 2, 3};
local  found = nil;
for i = 1, #a do
	if a[i] < 2 then
		found = i;
		break;
	end
end
print(found);]]

--泛型for循环

--[[days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
revDays = {};
for k,v in pairs(days) do   --将数组days逆转
	revDays[v] = k;
end
print(revDays["Sunday"]);]]

--[[a = {"asd", "df", "ged"};
for i,v in ipairs(a) do
	print(i,v)
end]]