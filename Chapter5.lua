--[[
function add( a )
	local sum = 0;
	for i,v in ipairs(a) do
		sum = sum + v;
	end
	return sum;
end
a = {1, 2, 3, 4, 5};
print(add(a));
--]]

--[[
s, e = string.find("Hello Lua Lua Users", "Lua"); --string.find()函数用于在一个字符串中查找指定的
--另外一个字符串， 如果找到， 将返回匹配的起始字符和结尾字符的索引。
print(s, e);
--]]

--[[function maximum( a )
	local mi = 1;--最大值的索引
	local m = a[mi];--最大值
	for i,val in ipairs(a) do
		if val > m then
			mi = i;
			m = val;
		end
	end
	return m, mi;
end
print(maximum({8, 10, 23, 5, 96}));]]

--一系列表达式在Lua中表现为4中情况:
--1、多重赋值
function foo0(  ) --无返回值
	
end
function foo1(  ) --返回1个结果
	return "a";
end
function foo2(  ) --返回2个结果
	return "a", "b";
end
--在多重赋值中， 若一个函数调用是最后的（或仅有的）一个表达式， 那么Lua会保留其尽可能多得返回值， 用于匹配赋值变量
--[[x, y = foo2();
print(x, y);
x = foo2();
print(x);
x, y, z = 10, foo2();
print(x, y, z);]]

--如果一个函数没有返回值或者没有足够多的返回值， 那么Lua会用nil来补充缺失的值
--[[x, y = foo0();
print(x, y);
x, y = foo1();
print(x, y);
x, y, z = foo2();
print(x, y, z);]]

--如果一个函数调用不是一系列表达式的最后一个元素， 那么将只产生一个值
--[[x, y = foo2(), 20;
print(x, y);
x, y = foo0(), 20, 30;
print(x, y);]]

--2、函数调用时传入的实参列表
--当一个函数调用作为另一个函数调用的最后一个(或仅有的)实参时， 第一个函数的所有返回值都将作为实参传入第二个函数
--[[print(foo0());
print(foo1())
print(foo2());
print(foo2(), 1);
print(foo2() .. "x");]]
--3、table的构造式
--table构造式可以完整地接受一个函数调用的所有结果， 即不会有任何数量方面的调整， 不过， 这种
--行为只有当一个函数调用作为最后一个元素时才会发生， 在其他位置上得函数调用总是只产生一个结果值
--[[t = {foo0()};
for k,v in pairs(t) do
	print(k,v)
end
t = {foo1()};
for k,v in pairs(t) do
	print(k,v)
end
t = {foo2()};
for k,v in pairs(t) do
	print(k,v)
end]]

--[[t = {foo0(), foo2(), 4};
for k,v in pairs(t) do
	print(k,v)
end]]

--4、return语句
function foo(i)	
	if i == 0 then
		return foo0();
		elseif i == 1 then
		return foo1();
		elseif i == 2 then
		return foo2();
	end
end
--返回函数的所有返回值
--[[print(foo(1));
print(foo(2));
print(foo(0));--无返回值
print(foo(3));--无返回值]]

--将一个函数调用放入一对圆括号中， 从而迫使它只返回一个结果
--[[print((foo0()));
print((foo1()));
print((foo2()));]]

--[[print(unpack({10, 20, 30})); -- unpack()函数， 接受一个数组作为参数， 并从下标1开始返回该数组的所有元素
a, b = unpack{10, 20, 30};
print(a, b);]]

--变长参数
--[[function add( ... ) -- 参数表中的(...)表示函数可接受不同数量的实参
	local  s = 0;
	for i,v in ipairs{...} do -- {...}表示一个由所有边长参数构成的数组
		s = s+v;
	end
	return s;
end
print(add(12, 4, 56, 23, 4));]]

 -- 表达式"..."的行为类似于一个具有多重返回值的函数， 它返回的是当前函数的所有变长参数。
--local a, b = ...  -- 此例中用第一个和第二个变长参数来初始化这两个局部变量

--[[function foo( ... )
	local a, b, c = ...;
	return a, b, c;
end
print(foo(1, 2, 3));]]

--[[function id( ... ) -- 返回调用函数时所传入的所有实参
	return ...;
end
print(id(1,2,1,2,25,5,5,8,6,6));]]

--[[function foo( ... )
	local a, b, c = ...;
	return a, b, c;
end

function foo1( ... )
	print("calling foo:", ...);
	return foo(...);
end
foo1(12, 45, 63);
print(foo(1, 2, 3));]]


