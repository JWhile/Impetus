
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
    flash.playChannel(this.sound.url, pos);
};
// function stop():void
ImpetusSound.prototype.stop = function()
{
    flash.stopChannel(this.sound.url);
};
// function getPos():int
ImpetusSound.prototype.getPos = function()
{
    return flash.getPosChannel(this.sound.url);
};

// var sounds:Array<ImpetusSound>
var sounds = [];

// var flash:HTMLObjectElement
var flash = null;

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

// static function Impetus._flashLoadedCallback():void
Impetus._flashLoadedCallback = function()
{
    Impetus.isLoaded = true;
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
    .insert(document.body)
    .node;

})();
