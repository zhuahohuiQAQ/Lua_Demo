--算术类的元方法

--求集合的并集与交集
Set = {};
--[[function  Set.new( l )
	local  set = {};
	for _,v in ipairs(l) do
		set[v] = true;
	end
	return set;
end]]

function Set.union( a,b)
	local res = Set.new{};
	for k in pairs(a) do
		res[k] = true;
	end
	for k in pairs(b) do
		res[k] = true;
	end
	return res;
end

function Set.intersection( a, b )
	local res = Set.new{};
	for k in pairs(a) do
		res[k] = b[k];
	end
	return res;
end

function Set.tostring( set )--打印集合的函数
	local l = {}; --用于存放集合中所有元素的列表
	for e in pairs(set) do
		l[#l+1] = e;
	end
	return "{" ..table.concat(l, ", ") .. "}";
end

function Set.print(s)
     print(Set.tostring(s));
end

local mt = {}; --集合的元表
function Set.new( l )
	local set = {};
	setmetatable(set, mt);
	for _,v in ipairs(l) do
		set[v] = true 
	end
	return set 
end

s1 = Set.new{10, 20, 30, 50};
s2 = Set.new{30, 1};
--print(getmetatable(s1));
--print(getmetatable(s2));
mt.__add = Set.union; --将元方法加入元表中

s3 = s1+s2;
--Set.print(s3);--打印结果

mt.__mul = Set.intersection; --将元方法加入元表中
--Set.print((s1+s2)*s1);

--关系类的元方法

--元表还可以指定关系操作符的含义， 元方法为__eq(等于), __lt(小于), __le(小于等于)
--其他3个关系操作符则没有单独的元方法， Lua会将a~=b 转化为not(a == b), 将a>b转化为b<a
--将a>=b转化为b<=a.
mt.__le = function ( a, b )
	for k in pairs(a) do
		if not b[k] then 
			return false
	end
	return true;
end
end

mt.__lt = function ( a, b )
	return a <= b and not(b<=a);
end

mt.__eq = function ( a, b )
	return a <= b and b <= a;
end

s1 = Set.new{2, 4};
s2 = Set.new{4, 10, 2};
--[[print(s1 <= s2);
print(s1 < s2);
print(s1 >= s1);
print(s1 > s1);
print(s1 == s2*s1);]]

--库定义的元方法

mt.__tostring = Set.tostring;
s1 = Set.new{10, 4, 5};
--print(s1);

mt.__metatable = "not your business"; -- 设置元表为保护状态， 即：用户既不能查看也不能修改集合的元表
s1 = Set.new{};
--print(getmetatable(s1)); -- 如果设置了__metatable字段， getmetable就会返回这个字段的值

--setmetatable(s1, {}); -- 此时setmetable会引发一个错误

--table访问的元方法

-- __index 元方法为
--[[Window = {};--创建一个名字空间
Window.prototype = {x = 0, y = 0, width = 100, height = 100};--使用默认值来创建一个原型
Window.mt = {};--创建元表
function Window.new( o )--声明构造函数
	setmetatable(o, Window.mt);
	return o;
end

Window.mt.__index = function ( table, key )--添加__index元方法
	return Window.prototype[key];
end

w = Window.new{x = 10, y = 20};
print(w.width);]]

-- __index 与 __newindex的区别：前者用于table的查询， 后者用于table的更新


--具有默认值的table
function setDefault( t, d )
	local mt = {__index = function ()
		return d;
	end
	};
	setmetatable(t, mt);
end

tab = {x = 10, y = 20};
print(tab.x, tab.z);
setDefault( tab, 0 )
print(tab.x, tab.z);