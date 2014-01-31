package
{
    import flash.display.Sprite;
    import flash.external.ExternalInterface;

    public class Impetus extends Sprite
    {
        private var sounds:Vector.<ImpetusSound>;

        private var defaultVolume:int;
        private var defaultBalance:int;

        public function Impetus():void
        {
            this.sounds = new Vector.<ImpetusSound>();

            this.defaultVolume = 1;
            this.defaultBalance = 0;

            if(ExternalInterface.available)
            {
                ExternalInterface.addCallback('playSound', this.playSound);
                ExternalInterface.addCallback('stopSound', this.stopSound);
                ExternalInterface.addCallback('getSoundPos', this.getSoundPos);
                ExternalInterface.addCallback('setSoundVolume', this.setSoundVolume);
                ExternalInterface.addCallback('getSoundVolume', this.getSoundVolume);
                ExternalInterface.addCallback('setSoundBalance', this.setSoundBalance);
                ExternalInterface.addCallback('getSoundBalance', this.getSoundBalance);
                ExternalInterface.addCallback('setDefaultVolume', this.setDefaultVolume);
                ExternalInterface.addCallback('setDefaultBalance', this.setDefaultBalance);

                ExternalInterface.call("Impetus._flashLoadedCallback");
            }
        }

        public function setDefaultVolume(volume:int, all:boolean = false):void
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

        public function setDefaultBalance(balance:int, all:boolean = false):void
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

        private function setSoundVolume(url:String, volume:int):void
        {
            this.getSound(url).setVolume(volume);
        }

        private function getSoundVolume(url:String):int
        {
            return this.getSound(url).getVolume();
        }

        private function setSoundBalance(url:String, balance:int):void
        {
            this.getSound(url).setBalance(balance);
        }

        private function getSoundBalance(url:String):int
        {
            return this.getSound(url).getBalance();
        }
    }
}
