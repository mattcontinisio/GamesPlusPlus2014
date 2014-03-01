package player
{
	import flash.utils.setTimeout;
	import item.*;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player extends FlxSprite
	{
		// 1 or 2
		public var playerNum:int;
		
		public var currentItem:Item;
		
		public function Player( X:Number, Y:Number, PlayerNum:int )
		{
			super( X, Y );
			
			this.playerNum = playerNum;
			
			// Physics
			maxVelocity.x = 300;
			maxVelocity.y = 800;
			acceleration.y = 800;
			drag.x = maxVelocity.x * 4;
			
			// Test item
			this.currentItem = new SpeedBoost( this );
		}
		
		public override function update():void
		{			
			super.update();
		}
		
		public function punched():void
		{
			maxVelocity.x = 100;
			setTimeout( function():void {
				maxVelocity.x = 300;
			}, 1000 );
		}
		
		public function useItem():void
		{
			if ( currentItem == null )
			{
				return;
			}
			
			if ( currentItem is SpeedBoost )
			{
				var oldMax:Number = maxVelocity.x;
				maxVelocity.x = 1600;
				//player.velocity.x = 1600;
				setTimeout( function():void {
					maxVelocity.x = oldMax;
				}, 1000 );
			}
		}
	}

}