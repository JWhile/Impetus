package
{
    import flash.display.Sprite;
    import flash.external.ExternalInterface;

    public class Impetus extends Sprite
    {
        private var sounds:Vector.<ImpetusSound>;

        public function Impetus():void
        {
            this.sounds = new Vector.<ImpetusSound>();

            if(ExternalInterface.available)
            {
                ExternalInterface.addCallback('getSound', this.getSound);
                ExternalInterface.addCallback('playNew', this.playNew);

                ExternalInterface.call("console.log", "Impetus loaded. (https://github.com/JWhile/Impetus)");
            }
        }

        public function getSound(url:String):ImpetusSound
        {
            var len:int = this.sounds.length;

            for(var i:int = 0; i < len; i++)
            {
                if(this.sounds[i].getUrl() === url)
                {
                    return this.sounds[i];
                }
            }

            var s:ImpetusSound = new ImpetusSound(url);

            this.sounds.push(s);

            return s;
        }

        public function playNew(url:String):void
        {
            this.getSound(url).playNew();
        }
    }
}
