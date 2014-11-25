--以那么字段、按反向的字符顺序来对table排序
--[[network = {{name = "grauna", IP = "210.26.30.34"},
{name = "arraial", IP = "210.26.30.23"},
{name = "lua", IP = "210.26.30.12"},
{name = "derain", IP = "210.26.30.20"},
};
for k,v in pairs(network) do
	print(k,v)
end
table.sort( network, function ( a, b )
	return (a.name > b.name);
end );
for i,v in ipairs(network) do
	print(i,v)
end]]

--根据年级来对姓名进行排序（由高到低）
--[[names = {"Peter", "Paul", "Mary"};
grades = {Mary = 10, Paul = 7, Peter = 8};
table.sort( names, function ( n1, n2 )
	return grades[n1] > grades[n2];
end )
for i,v in ipairs(names) do
	print(i,v)
end]]

--[[function newCounter(  )
	local i = 0;
	return function (  )
		i = i + 1;
		return i;
	end
end
c1 = newCounter();
print(c1());
print(c1());
c2 = newCounter();--再次调用newCounter函数， 它会创建一个新的局部变量i
print(c2());
print(c1());]]

