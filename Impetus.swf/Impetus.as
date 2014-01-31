package
{
    import flash.display.Sprite;
    import flash.external.ExternalInterface;

    public class Impetus extends Sprite
    {
        private var sounds:Vector.<ImpetusSound>;

        private var defaultVolume:int;

        public function Impetus():void
        {
            this.sounds = new Vector.<ImpetusSound>();

            this.defaultVolume = 1;

            if(ExternalInterface.available)
            {
                ExternalInterface.addCallback('playSound', this.playSound);
                ExternalInterface.addCallback('stopSound', this.stopSound);
                ExternalInterface.addCallback('getSoundPos', this.getSoundPos);
                ExternalInterface.addCallback('setDefaultVolume', this.setDefaultVolume);

                ExternalInterface.call("Impetus._flashLoadedCallback");
            }
        }

        public function setDefaultVolume(volume:int):void
        {
            this.defaultVolume = volume;
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

            var s:ImpetusSound = new ImpetusSound(url, this.defaultVolume);

            this.sounds.push(s);

            return s;
        }

        private function playSound(url:String, pos:int = 0):void
        {
            this.getSound(url).play(pos);
        }

        private function stopSound(url:String):void
        {
            this.getSound(url).stop();
        }

        private function getSoundPos(url:String):int
        {
            return this.getSound(url).getPos();
        }
    }
}
