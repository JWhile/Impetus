package io.github.jwhile.impetus
{
    import flash.display.Sprite;
    import flash.external.ExternalInterface;

    public class Impetus extends Sprite
    {
        private sounds:Vector.<ImpetusSound>;

        public function Impetus():void
        {
            sounds = new Vector.<ImpetusSound>();

            if(ExternalInterface.available)
            {
                ExternalInterface.addCallback('getSound', getSound);

                ExternalInterface.call("console.log", "Impetus loaded. (https://github.com/JWhile/Impetus)");
            }
        }

        public function getSound(url:String)
        {
            var len:int = sounds.length;

            for(var i:int = 0; i < len; i++)
            {
                if(sounds[i].getUrl() === url)
                {
                    return sounds[i];
                }
            }

            var s:ImpetusSound = new ImpetusSound();

            sounds.push(s);

            return s;
        }
    }
}
