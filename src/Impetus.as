package io.github.jwhile.impetus
{
    import flash.display.Sprite;
    import flash.external.ExternalInterface;

    public class Impetus extends Sprite
    {
        private sounds:Vector.<ImpetusSound>;

        public function Impetus():void
        {
            sounds = new Vector.<ImpetusSound>();

            if(ExternalInterface.available)
            {
                ExternalInterface.addCallback('getSound', getSound);

                ExternalInterface.call("console.log", "Impetus loaded. (https://github.com/JWhile/Impetus)");
            }
        }
    } 
}