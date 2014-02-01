package
{
    import flash.media.ID3Info
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

        public function getInfo():ID3Info
        {
            return this.sound.id3;
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

        public function getState():Object
        {
            return {
                loaded: this.sound.bytesLoaded / this.sound.bytesTotal,
                position: (this.channel != null)? this.channel.position : 0,
                length: this.sound.length * this.sound.bytesTotal / this.sound.bytesLoaded
            };
        }

        public function getPeak():Object
        {
            return {
                left: (this.channel != null)? this.channel.leftPeak : 0,
                right: (this.channel != null)? this.channel.rightPeak : 0,
                volume: this.volume,
                balance: this.balance
            };
        }

        public function setVolume(volume:Number):void
        {
            this.volume = volume;

            this.updateTransform();
        }

        public function setBalance(balance:Number):void
        {
            this.balance = balance;

            this.updateTransform();
        }

        private function updateTransform():void
        {
            this.channel.soundTransform = new SoundTransform(this.volume, this.balance);
        }
    }
}
