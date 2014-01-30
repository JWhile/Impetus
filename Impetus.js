
// class Impetus
function Impetus()
{
    this.sounds = []; // :Array<ImpetusSound>
}
// function getSound(String url):ImpetusSound
Impetus.prototype.getSound = function(url)
{
    for(var i = 0; i < this.sounds.length; ++i)
    {
        if(sounds[i].url === url)
        {
            return sounds[i];
        }
    }

    var s = new ImpetusSound(url);

    this.sounds.push(s);

    return s;
};

// class ImpetusSound
function ImpetusSound(url)
{
    this.url = url; // :String

    this.channels =[]; // :Array<ImpetusChannel>
}
// function playNew():ImpetusChannel
ImpetusSound.prototype.playNew = function()
{
    var c = new ImpetusChannel();

    this.channels.push(c);

    return c;
};
// function stopAll():void
ImpetusSound.prototype.stopAll = function()
{
    for(var i = 0; i < this.channels.length; ++i)
    {
        channels[i].stop();
    }
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
