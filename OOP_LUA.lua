--[[Hero = {attack = 100};
function Hero.skill( Addattack )
	Hero.attack = Hero.attack + Addattack;
end
Hero.skill(20);
print(Hero.attack);
for k,v in pairs(Hero) do --遍历Hero
	print(k,v)
end]]

--[[Hero = {attack = 100};
function Hero.skill( self, Addattack ) -- . 不能在方法中添加一个额外的隐藏参数
	self.attack = self.attack + Addattack;
end
oneHero = Hero;
Hero = nil;
oneHero.skill(oneHero,30);
print(oneHero.attack);]]

--[[
Hero = {attack = 100};
function Hero:skill( Addattack ) --冒号可以在方法中添加一个额外的隐藏参数 this/self
	self.attack = self.attack + Addattack;
end
oneHero = Hero;
Hero = nil;
oneHero:skill(30);
--oneHero.skill(oneHero, 30);
print(oneHero.attack);
]]

--[[Hero = {};
function Hero:new( o )												
	o = o or {};
	setmetatable(o, self);
	self.__index = self;
--	print(getmetatable(o));--获取o的元表
	return o;
end

function Hero:skill( Addattack )
	self.attack = self.attack + Addattack;
end
oneHero = Hero:new{attack = 90};
oneHero:skill(10);
print(oneHero.attack);
for k,v in pairs(Hero) do -- 遍历Hero
	print(k,v)
end]]

Hero = {attack = 0}
function Hero:new( o )
	o = o or {};
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function  Hero:skill( Addattack )
	self.attack = self.attack + Addattack;
end

function Hero:injured( loseAttack )
	if loseAttack > self.attack then
		error "not enough attack" 
		end;
		self.attack = self.attack - loseAttack;
end
HumanHero = Hero:new();
oneHero = HumanHero:new{attack = 100}
oneHero:skill(10);
oneHero:injured(100);
print(oneHero.attack);