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

        public function ImpetusSound(url:String, defaultVolume:int):void
        {
            this.url = url;
            this.sound = new Sound();

            this.sound.load(new URLRequest(url));

            this.channel = null;

            this.volume = defaultVolume;
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
        }

        public function getVolume():int
        {
            return this.volume;
        }
    }
}
