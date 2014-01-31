package
{
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.net.URLRequest;

    public class ImpetusSound
    {
        private var url:String;
        private var sound:Sound;

        private var channel:SoundChannel;

        private var volume:Number;
        private var balance:Number;

        public function ImpetusSound(url:String, defaultVolume:Number, defaultBalance:Number):void
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

        public function setVolume(volume:Number):void
        {
            this.volume = volume;

            this.updateTransform();
        }

        public function getVolume():Number
        {
            return this.volume;
        }

        public function setBalance(balance:Number):void
        {
            this.balance = balance;

            this.updateTransform();
        }

        public function getBalance():Number
        {
            return this.balance;
        }

        private function updateTransform():void
        {
            this.channel.soundTransform = new SoundTransform(this.volume, this.balance);
        }
    }
}
