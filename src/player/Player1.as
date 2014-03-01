package player 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player1 extends Player
	{
		
		public function Player1( X:Number, Y:Number ) 
		{
			super( X, Y, 1 );
			
			makeGraphic( 40, 80, 0xccccffff );
		}
		
		public override function update():void
		{
			acceleration.x = 0;
			
			// Movement
			if ( FlxG.keys.A )
			{
				// Run left
				acceleration.x = -maxVelocity.x * 4;
			}
			if ( FlxG.keys.D )
			{
				// Run right
				acceleration.x = maxVelocity.x * 4;
			}
			if ( FlxG.keys.W && isTouching( FlxObject.FLOOR ) )
			{
				// Jump
				velocity.y = -maxVelocity.y / 2;
			}
			
			super.update();
		}
	}

}