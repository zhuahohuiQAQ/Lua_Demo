--[[print("hello".."world");
print(b);
b = 10;
print(b);]]--

--打印数据类型
--[[print(type(12));
print(type(print));
print(type(type));
print(type(true));
print(type(nil));
print(type(type(X)));]]

--字符串
--[[print("10" + 1)
print("10 + 1")
print(10 ..1)]]

--[[
a = "one String";
b = string.gsub(a, "one", "another");--修改字符串的一部分
print(#a);--在字符串后者数组名的前面加上#可以得到其对应的字符串长度或者数组大小， 但是如果数组中间
--含有nil元素， 长度操作符#会认为这些你来元素就是结束标识， 获取不到数组的真实长度， 因此， 这是要使用
--table.maxn()函数来求数组的长度
print(b);
--]]

--[[a = {};
a[1000] = 1;
print(#a); -->0
print(table.maxn(a)); -->1000
]]

--[[print("one line\nnext line\n\"in quotes\", 'in quotes'");
print('a backslash inside quotes:\'\\\'');
print("a simpler way:'\\'");]]

--函数
--[[function sayHello()
	print("Hello World");
	return 10, 20;
end
print(sayHello());
a,b,c=sayHello();
print(a, b, c);
end]]

--[[function max( a, b )
	if a>b then
		return a;
	else
		return b;
	end
end
print(max(5, 3));]]

--函数闭包:一个函数包含另外一个函数
--[[function A()
	print("AAA");
	function B()--function前加一个local， 成为局部函数, 在函数外部将调不到
		print("BBB");
	end
--	B();
end
A();
B();]]

--for循环
--[[for i=1,100,2 do
	print(i);
end]]

--表（table）
--[[a = {};
k = "x";
a[k] = 10;
a[20] = "great";
print(a["x"]);
k = 20;
print(a[k]);
a["x"] = a["x"]+1;
print(a["x"]);]]

--[[config = {};
config.name = "MM";
config.age = 20;
config["sex"]="F";
--print(config.name);
--print(config.age);
--print(config.sex);
--print(config["name"])
for k,v in pairs(config) do
	print(k,v)
end]]

--[[a = {};
a["x"] = 10;
b = a;       --b与a引用了同一个table
print(b["x"]);
b["x"] = 20;
print(a["x"]);
a = nil;--现在只有b还在引用table
b = nil;--再也没有对table的引用了]]


--a[x]与a.x的区别：a[x]使用x的值去索引table， 得到对应的值，a.x使用字符串"x"索引table，得到对应的值
--[[a = {};
x = "y";
a[x] = 10;
print(a[x]);-->10
print(a.x); --> nil
print(a.y); -->10]]

--数组
--[[week = {"Monday", "Tuesday", "Wednesday", "Thurday", "Friday", "Saturday", "Sunday"};
print(week[1]);
for k,v in pairs(week) do
	print(k,v)
end]]

--[[arr = {};
for var = 1, 100 do
	table.insert(arr, 1, var);--插入元素
end

for key, var in pairs(arr) do
	print(key, var);
end
print(table.maxn(arr));--打印数组长度]]

--[[以下条目看似相同， 实则不同， 需注意]]
i = 10; j = "10"; k = "+10";
a = {};
a[i] = "one value";
a[j] = "another value";
a[k] = "yet another value";
print(a[j]);
print(a[k]);
print(a[tonumber(j)]);
print(a[tonumber(k)]);