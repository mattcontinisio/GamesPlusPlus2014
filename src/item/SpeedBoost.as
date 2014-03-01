package item 
{
	import flash.utils.setTimeout;
	import player.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class SpeedBoost implements Item
	{
		private var player:Player;
		
		public function SpeedBoost( player:Player ) 
		{
			this.player = player;
		}
		
		public function useItem():void
		{
			/*var oldMax:Number = player.maxVelocity.x;
			player.maxVelocity.x = 1600;
			//player.velocity.x = 1600;
			setTimeout( function():void {
				player.maxVelocity.x = oldMax;
			}, 1000 );*/
		}
	}

}