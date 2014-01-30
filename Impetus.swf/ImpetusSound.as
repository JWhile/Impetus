package
{
    import flash.media.Sound;
    import flash.net.URLRequest;

    public class ImpetusSound
    {
        private var url:String;
        private var sound:Sound;

        private var channels:Vector.<ImpetusChannel>;

        private var channelId;

        public function ImpetusSound(url:String):void
        {
            this.url = url;
            this.sound = new Sound();

            this.channels = new Vector.<ImpetusChannel>;

            this.channelId = 0;

            this.sound.load(new URLRequest(url));
        }

        public function getUrl():String
        {
            return this.url
        }

        public function playNew():ImpetusChannel
        {
            var c:ImpetusChannel = new ImpetusChannel(this.channelId, this.sound.play(0));

            this.channels.push(c);
            this.channelId++;

            return c;
        }

        public function stopAll():void
        {
            var len:int = this.channels.length;

            for(var i:int; i < len; i++)
            {
                this.channels[i].stop();
            }
        }
    }
}
