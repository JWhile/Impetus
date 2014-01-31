package
{
    import flash.display.Sprite;
    import flash.external.ExternalInterface;

    public class Impetus extends Sprite
    {
        private var sounds:Vector.<ImpetusSound>;

        public function Impetus():void
        {
            this.sounds = new Vector.<ImpetusSound>();

            if(ExternalInterface.available)
            {
                ExternalInterface.addCallback('playNew', this.playNew);
                ExternalInterface.addCallback('playChannel', this.playChannel);
                ExternalInterface.addCallback('stopChannel', this.stopChannel);
                ExternalInterface.addCallback('setPosChannel', this.setPosChannel);
                ExternalInterface.addCallback('getPosChannel', this.getPosChannel);

                ExternalInterface.call("Impetus._flashLoadedCallback");
            }
        }

        public function playNew(url:String):int
        {
            return this.getSound(url).playNew().getId();
        }

        public function playChannel(url:String, id:int):void
        {
            var c:ImpetusChannel = this.getSound(url).get(id);

            if(c != null)
            {
                c.play();
            }
        }

        public function stopChannel(url:String, id:int):void
        {
            var c:ImpetusChannel = this.getSound(url).get(id);

            if(c != null)
            {
                c.stop();
            }
        }

        public function setPosChannel(url:String, id:int, pos:int):void
        {
            var c:ImpetusChannel = this.getSound(url).get(id);

            if(c != null)
            {
                c.setPos(pos);
            }
        }

        public function getPosChannel(url:String, id:int):int
        {
            var c:ImpetusChannel = this.getSound(url).get(id);

            if(c != null)
            {
                return c.getPos();
            }

            return -1;
        }

        private function getSound(url:String):ImpetusSound
        {
            var len:int = this.sounds.length;

            for(var i:int = 0; i < len; i++)
            {
                if(this.sounds[i].getUrl() === url)
                {
                    return this.sounds[i];
                }
            }

            var s:ImpetusSound = new ImpetusSound(url);

            this.sounds.push(s);

            return s;
        }
    }
}
