package
{
    import flash.media.SoundChannel;

    public class ImpetusChannel
    {
        private var id:int;

        private var channel:SoundChannel;

        public function ImpetusChannel(id:int, channel:SoundChannel):void
        {
            this.id = id;

            this.channel = channel;
        }

        public function getId():int
        {
            return this.id;
        }

        public function play():void
        {
        }

        public function stop():void
        {
            this.channel.stop();
        }

        public function setPos(pos:int):void
        {
        }

        public function getPos():int
        {
        }
    }
}
