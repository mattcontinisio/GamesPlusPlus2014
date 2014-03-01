package player 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player1 extends Player
	{
		// Reference to player 2
		public var player2:Player;
		
		public function Player1( X:Number, Y:Number, bulletGroup:FlxGroup ) 
		{
			super( X, Y, 1, bulletGroup );
			
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
				facing = LEFT;
			}
			if ( FlxG.keys.D )
			{
				// Run right
				acceleration.x = maxVelocity.x * 4;
				facing = RIGHT;
			}
			if ( FlxG.keys.W && isTouching( FlxObject.FLOOR ) )
			{
				// Jump
				velocity.y = -maxVelocity.y / 2;
			}
			
			// Punch
			if ( FlxG.keys.E )
			{
				var thisToPlayer2X:Number = player2.x - x;
				var thisToPlayer2Y:Number = player2.y - y;
				
				// Punch if within range
				if ( thisToPlayer2X > 0 && thisToPlayer2X < width + 10 && thisToPlayer2Y > -width - 10 && thisToPlayer2Y < width + 10 )
				{
					player2.punched();
				}
			}
			
			// Use item
			if ( FlxG.keys.justPressed( "S" ) )
			{
				useItem();
			}
			
			super.update();
		}
	}

}