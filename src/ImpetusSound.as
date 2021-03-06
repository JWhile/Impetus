/**
 * Impetus
 *
 * https://github.com/JWhile/Impetus
 *
 * version 1.0.0
 */

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
            var newChannel:SoundChannel = this.sound.play(pos);

            if(this.channel != null)
            {
                this.channel.stop();
            }

            this.channel = newChannel;

            this.updateTransform();
        }

        public function stop():void
        {
            if(this.channel != null)
            {
                this.channel.stop();

                this.channel = null;
            }
        }

        public function getState():Object
        {
            var load:Number = this.sound.bytesLoaded / this.sound.bytesTotal;

            return {
                loaded: load,
                position: (this.channel != null)? this.channel.position : 0,
                length: (load < 1)? this.sound.length * this.sound.bytesTotal / this.sound.bytesLoaded | 0 : this.sound.length | 0
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
            if(this.channel != null)
            {
                var transform:SoundTransform = this.channel.soundTransform;

                transform.volume = this.volume;
                transform.pan = this.balance;

                this.channel.soundTransform = transform;
            }
        }
    }
}
