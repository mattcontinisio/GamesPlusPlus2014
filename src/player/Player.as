package player
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Player extends FlxSprite
	{
		// 1 or 2
		private var playerNum:int;
		
		// Controls
		public var leftKey:int;
		public var rightKey:int;
		
		public function Player( X:Number, Y:Number, PlayerNum:int )
		{
			super( X, Y );
			
			this.playerNum = playerNum;
			
			// Physics
			maxVelocity.x = 300;
			maxVelocity.y = 800;
			acceleration.y = 800;
			drag.x = maxVelocity.x * 4;
		}
		
		public override function update():void
		{			
			super.update();
		}
	}

}