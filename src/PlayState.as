package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class PlayState extends FlxState
	{
		private var player1:Player;
		private var player2:Player;
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			// Make players
			player1 = new Player( 0, 0 );
			player2 = new Player( 0, 0 );
			
			// Add players to state
			add( player1 );
			add( player2 );
			
			// Set up cameras to follow players
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}