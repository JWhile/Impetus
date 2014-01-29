package
{
    import flash.media.SoundChannel;

    public class ImpetusChannel
    {
        private var channel:SoundChannel;

        public function ImpetusChannel(channel:SoundChannel):void
        {
            this.channel = channel;
        }

        public function stop():void
        {
            this.channel.stop();
        }
    }
}
