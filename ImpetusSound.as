package io.github.jwhile.impetus
{
    import flash.media.Sound;
    import flash.net.URLRequest;

    public class ImpetusSound
    {
        private var sound:Sound;

        private var channels:Vector.<ImpetusChannel>;

        public function ImpetusSound(url:String):void
        {
            this.sound = new Sound();

            this.channels = new Vector.<ImpetusChannel>;

            this.sound.load(new URLRequest(url));
        }

        public function playNew():ImpetusChannel
        {
            var c:ImpetusChannel = new ImpetusChannel(this.sound.play(0));

            channels.push(c);

            return c;
        }
    }
}
