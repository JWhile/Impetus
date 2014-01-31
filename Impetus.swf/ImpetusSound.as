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

        public function ImpetusSound(url:String):void
        {
            this.url = url;
            this.sound = new Sound();

            this.sound.load(new URLRequest(url));

            this.channel = null;
        }

        public function getUrl():String
        {
            return this.url
        }

        public function play():void
        {
            if(this.channel != null)
            {
                this.channel.stop();
            }

            this.channel = sound.play(0);
        }

        public function stop():void
        {
            this.channel.stop();

            this.channel = null;
        }

        public function setPos(pos:int):void
        {
        }

        public function getPos():int
        {
        }
    }
}
