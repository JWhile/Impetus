
var Impetus;

(function(){ // namespace

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

// var sounds:Array<ImpetusSound>
var sounds = [];

// var flash:Builder
var flash = null;

// static var loaded:boolean
Impetus.loaded = false;

// static function Impetus.getSound(String url):ImpetusSound
Impetus.getSound = function(url)
{
    for(var i = 0; i < sounds.length; ++i)
    {
        if(sounds[i].url === url)
        {
            return sounds[i];
        }
    }

    var s = new ImpetusSound(url);

    sounds.push(s);

    return s;
};

// static function Impetus._flashLoadedCallback():void
Impetus._flashLoadedCallback = function()
{
    Impetus.loaded = true;
};

// main
flash = new Builder('object')
    .set('id', 'impetus_flash')
    .set('type', 'application/x-shockwave-flash')
    .append(new Builder('param')
        .set('name', 'movie')
        .set('value', 'Impetus.swf'))
    .append(new Builder('param')
        .set('name', 'allowScriptAccess')
        .set('value', 'always'))

})();
