package player 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player2 extends Player
	{
		// Reference to player 1
		public var player1:Player;
		
		public function Player2( X:Number, Y:Number, bulletGroup:FlxGroup ) 
		{
			super( X, Y, 2, bulletGroup );
			
			makeGraphic( 16, 32, 0xffccccff );
		}
		
		public override function update():void
		{
			acceleration.x = 0;
			
			// Movement
			if ( FlxG.keys.LEFT )
			{
				// Run left
				acceleration.x = -maxVelocity.x * 4;
				facing = LEFT;
			}
			if ( FlxG.keys.RIGHT )
			{
				// Run right
				acceleration.x = maxVelocity.x * 4;
				facing = RIGHT;
			}
			if ( FlxG.keys.UP && isTouching( FlxObject.FLOOR ) )
			{
				// Jump
				velocity.y = -maxVelocity.y / 2;
			}
			
			// Punch
			if ( FlxG.keys.SLASH )
			{
				var thisToPlayer1X:Number = player1.x - x;
				var thisToPlayer1Y:Number = player1.y - y;
				
				// Punch if within range
				if ( thisToPlayer1X > 0 && thisToPlayer1X < width + 10 && thisToPlayer1Y > -width - 10 && thisToPlayer1Y < width + 10 )
				{
					player1.punched();
				}
			}
			
			// Use item
			if ( FlxG.keys.justPressed( "DOWN" ) )
			{
				useItem();
			}
			
			super.update();
		}
	}

}