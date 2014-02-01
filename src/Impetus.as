package
{
    import flash.display.Sprite;
    import flash.external.ExternalInterface;
    import flash.media.ID3Info;

    public class Impetus extends Sprite
    {
        private var sounds:Vector.<ImpetusSound>;

        private var defaultVolume:Number;
        private var defaultBalance:Number;

        public function Impetus():void
        {
            this.sounds = new Vector.<ImpetusSound>();

            this.defaultVolume = 1;
            this.defaultBalance = 0;

            if(ExternalInterface.available)
            {
                ExternalInterface.addCallback('preloadSound', this.preloadSound);

                ExternalInterface.addCallback('getSoundInfo', this.getSoundInfo);

                ExternalInterface.addCallback('playSound', this.playSound);
                ExternalInterface.addCallback('stopSound', this.stopSound);

                ExternalInterface.addCallback('getSoundState', this.getSoundState);
                ExternalInterface.addCallback('getSoundPeak', this.getSoundPeak);

                ExternalInterface.addCallback('setSoundVolume', this.setSoundVolume);

                ExternalInterface.addCallback('setSoundBalance', this.setSoundBalance);

                ExternalInterface.addCallback('setDefaultVolume', this.setDefaultVolume);
                ExternalInterface.addCallback('setDefaultBalance', this.setDefaultBalance);

                ExternalInterface.call("Impetus._flashLoadedCallback");
            }
        }

        public function setDefaultVolume(volume:Number, all:Boolean = false):void
        {
            this.defaultVolume = volume;

            if(all)
            {
                var len:int = this.sounds.length;

                for(var i:int = 0; i < len; i++)
                {
                    this.sounds[i].setVolume(volume);
                }
            }
        }

        public function setDefaultBalance(balance:Number, all:Boolean = false):void
        {
            this.defaultBalance = balance;

            if(all)
            {
                var len:int = this.sounds.length;

                for(var i:int = 0; i < len; i++)
                {
                    this.sounds[i].setBalance(balance);
                }
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

            var s:ImpetusSound = new ImpetusSound(url, this.defaultVolume, this.defaultBalance);

            this.sounds.push(s);

            return s;
        }

        private function preloadSound(url:String):void
        {
            this.getSound(url);
        }

        private function getSoundInfo(url:String):ID3Info
        {
            return this.getSound(url).getInfo();
        }

        private function playSound(url:String, pos:int = 0):void
        {
            this.getSound(url).play(pos);
        }

        private function stopSound(url:String):void
        {
            this.getSound(url).stop();
        }

        private function getSoundState(url:String):Object
        {
            return this.getSound(url).getState();
        }

        private function getSoundPeak(url:String):Object
        {
            return this.getSound(url).getPeak();
        }

        private function setSoundVolume(url:String, volume:Number):void
        {
            this.getSound(url).setVolume(volume);
        }

        private function setSoundBalance(url:String, balance:Number):void
        {
            this.getSound(url).setBalance(balance);
        }
    }
}
