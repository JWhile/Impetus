
// class Impetus
function Impetus()
{
}
// function getSound(String url):ImpetusSound
Impetus.prototype.getSound = function(url)
{
};

// class ImpetusSound
function ImpetusSound(url)
{
    this.url = url; // :String
}
// function playNew():ImpetusChannel
ImpetusSound.prototype.playNew = function()
{
};
// function stopAll():void
ImpetusSound.prototype.stopAll = function()
{
};

// class ImpetusChannel
function ImpetusChannel()
{
}
// function play():void
ImpetusChannel.prototype.play = function()
{
};
// function stop():void
ImpetusChannel.prototype.stop = function()
{
};
// function setPos(int pos):void
ImpetusChannel.prototype.setPos = function(pos)
{
};
// function getPos():int
ImpetusChannel.prototype.getPos = function()
{
};
