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

        public function get(id:int):ImpetusChannel
        {
            var len:int = this.channels.length;

            for(var i:int = 0; i < len; i++)
            {
                if(this.channels[i].getId() === id)
                {
                    return this.channels[i];
                }
            }

            return null;
        }

        public function playNew():ImpetusChannel
        {
            var c:ImpetusChannel = new ImpetusChannel(this.channelId, this.sound.play(0));

            this.channels.push(c);
            this.channelId++;

            return c;
        }
    }
}
