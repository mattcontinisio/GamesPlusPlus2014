package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player extends FlxSprite
	{
		public function Player( X:Number, Y:Number ) 
		{
			super( X, Y );
			
			
			// Physics
			maxVelocity.x = 100;
			maxVelocity.y = 200;
			//acceleration.y = 200;
			
			// Drawing
			makeGraphic( 40, 80, 0xff4444ff );
		}
		
		public override function update():void
		{
			super.update();
			
			if ( y > 720 )
			{
				velocity.y = 0;
			}
		}
	}

}