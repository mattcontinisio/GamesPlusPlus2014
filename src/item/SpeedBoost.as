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
		private var owner:Player;
		
		public function SpeedBoost( owner:Player ) 
		{
			this.owner = owner;
		}
		
		public function useItem():void
		{
		}
	}

}