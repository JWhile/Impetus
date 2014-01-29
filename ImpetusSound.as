package io.github.jwhile.impetus
{
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;

    public class ImpetusSound
    {
        private var sound:Sound;

        private var channels:Vector.<SoundChannel>;

        public function ImpetusSound(url:String):void
        {
            this.sound = new Sound();

            this.channels = new Vector.<SoundChannel>;

            this.sound.load(new URLRequest(url));
        }
    } 
}
