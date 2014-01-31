package
{
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;

    public class ImpetusSound
    {
        private var url:String;
        private var sound:Sound;

        private var channel:SoundChannel;

        private var volume:int;
        private var balance:int;

        public function ImpetusSound(url:String, defaultVolume:int, defaultBalance:int):void
        {
            this.url = url;
            this.sound = new Sound();

            this.sound.load(new URLRequest(url));

            this.channel = null;

            this.volume = defaultVolume;
            this.balance = defaultBalance;
        }

        public function getUrl():String
        {
            return this.url
        }

        public function play(pos:int):void
        {
            if(this.channel != null)
            {
                this.channel.stop();
            }

            this.channel = sound.play(pos);

            this.updateTransform();
        }

        public function stop():void
        {
            this.channel.stop();

            this.channel = null;
        }

        public function getPos():int
        {
            return (this.channel != null)? channel.position : -1;
        }

        public function setVolume(volume:int):void
        {
            this.volume = volume;

            this.updateTransform();
        }

        public function getVolume():int
        {
            return this.volume;
        }

        public function setBalance(balance:int):void
        {
            this.balance = balance;

            this.updateTransform();
        }

        public function getBalance():int
        {
            return this.balance;
        }

        private function updateTransform():void
        {
            this.channel.soundTransform = new SoundTransform(this.volume, this.balance);
        }
    }
}
