package io.github.jwhile.impetus
{
    import flash.display.Sprite;
    import flash.external.ExternalInterface;

    public class Impetus extends Sprite
    {
        public function Impetus():void
        {
            if(ExternalInterface.available)
            {
                ExternalInterface.addCallback('getPlayer', getPlayer);

                ExternalInterface.call("console.log", "Impetus loaded. (https://github.com/JWhile/Impetus)");
            }
        }
    } 
}