package item 
{
	import player.Player;
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Gun implements Item
	{
		private var owner:Player;
		
		public var ammo:int;
		
		public function Gun( owner:Player ) 
		{
			this.owner = owner;
			ammo = 100;
		}
		
		public function useItem():void
		{
			ammo--;
		}
	}
}