package item 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Trap extends FlxSprite implements Item
	{
		[Embed(source = "../../assets/images/Trap.png")] public var ImgTrap:Class;
		
		public function Trap() 
		{
			super( -10, -10 );
			
			acceleration.y = 800;
			maxVelocity.y = 800;
			drag.x = 100;
			drag.y = 100;
			
			loadGraphic( ImgTrap, false, false, 16, 32 );
		}
		
		public function useItem():void
		{
			
		}
	}

}