package level 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Powerup extends FlxSprite
	{
		
		public function Powerup( X:Number, Y:Number ) 
		{
			super( X, Y );
			acceleration.y = 800;
			
			makeGraphic( 24, 24, 0xff0000ff );
		}
		
	}

}