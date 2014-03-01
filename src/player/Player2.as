package player 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player2 extends Player
	{
		
		public function Player2( X:Number, Y:Number ) 
		{
			super( X, Y, 2 );
			
			makeGraphic( 40, 80, 0xffccccff );
		}
		
		public override function update():void
		{
			acceleration.x = 0;
			
			// Movement
			if ( FlxG.keys.LEFT )
			{
				// Run left
				acceleration.x = -maxVelocity.x * 4;
			}
			if ( FlxG.keys.RIGHT )
			{
				// Run right
				acceleration.x = maxVelocity.x * 4;
			}
			if ( FlxG.keys.UP && isTouching( FlxObject.FLOOR ) )
			{
				// Jump
				velocity.y = -maxVelocity.y / 2;
			}
			
			super.update();
		}
	}

}