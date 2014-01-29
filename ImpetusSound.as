package io.github.jwhile.impetus
{
    import flash.media.Sound;
    import flash.media.SoundChannel;

    public class ImpetusSound
    {
        private var url:String;
        private var sound:Sound;

        private var channels:Vector.<SoundChannel>;

        public function ImpetusSound(url:String):void
        {
            this.url = url;
            this.sound = new Sound();

            this.channels = new Vector.<SoundChannel>;
        }
    } 
}
