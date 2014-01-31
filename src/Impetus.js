
var Impetus = {};

(function(){ // namespace

// class ImpetusSound
function ImpetusSound(url)
{
    this.url = url; // :String
}
// function play():void
ImpetusSound.prototype.play = function(pos)
{
    flash.playSound(this.url, pos);
};
// function stop():void
ImpetusSound.prototype.stop = function()
{
    flash.stopSound(this.url);
};
// function getPos():int
ImpetusSound.prototype.getPos = function()
{
    return flash.getSoundPos(this.url);
};
// function setVolume(int volume):void
ImpetusSound.prototype.setVolume = function(volume)
{
    flash.setSoundVolume(this.url, volume);
};
// function getVolume():int
ImpetusSound.prototype.getVolume = function()
{
    return flash.getSoundVolume(this.url);
};
// function setBalance(int balance):void
ImpetusSound.prototype.setBalance = function(balance)
{
    flash.setSoundBalance(this.url, balance);
};
// function getBalance():int
ImpetusSound.prototype.getBalance = function()
{
    return flash.getSoundBalance(this.url);
};

// var sounds:Array<ImpetusSound>
var sounds = [];

// var flash:HTMLObjectElement
var flash = null;

// var loadCallback:function
var loadCallback = null;

// static var isLoaded:boolean
Impetus.isLoaded = false;

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

// static function Impetus.setDefaultVolume(int volume, boolean all = false):void
Impetus.setDefaultVolume = function(volume, all)
{
    flash.setDefaultVolume(volume / 100, all);
};

// static function Impetus.setDefaultBalance(int balance, boolean all = false):void
Impetus.setDefaultBalance = function(balance, all)
{
    flash.setDefaultBalance(balance / 100, all);
};

// static function Impetus.load(callback:function = null):void
Impetus.load = function(callback)
{
    loadCallback = callback;

    flash = new Builder('object')
        .set('id', 'impetus_flash')
        .set('type', 'application/x-shockwave-flash')
        .append(new Builder('param')
            .set('name', 'movie')
            .set('value', 'Impetus.swf'))
        .append(new Builder('param')
            .set('name', 'allowScriptAccess')
            .set('value', 'always'))
        .insert(document.body)
        .node;
};

// static function Impetus._flashLoadedCallback():void
Impetus._flashLoadedCallback = function()
{
    Impetus.isLoaded = true;

    if(typeof loadCallback === 'function')
    {
        loadCallback();
    }
};

})();
