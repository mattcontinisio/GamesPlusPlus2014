package  
{
	import org.flixel.*;
	import player.*;
	import level.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class PlayState extends FlxState
	{
		private var player1:Player1;
		private var player2:Player2;
		private var level1:Level;
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			// Make players
			player1 = new Player1(0, 0);
			player2 = new Player2(0, 0);
			
			//Make level
			level1 = new Level();
			
			//Add level to state
			add(level1);
			
			// Add players to state
			add( player1 );
			add( player2 );
			
			// Set up cameras to follow players
			
			// Top camera
			var camera:FlxCamera = new FlxCamera( 0, 0, FlxG.width, FlxG.height / 2 );
			camera.follow( player1 );
			camera.setBounds( 0, 0, FlxG.width, FlxG.height );	// TODO - this should be dimensions of level
			camera.color = 0xffcccc;
			FlxG.addCamera( camera );
			
			// Bottom camera
			camera = new FlxCamera( 0, FlxG.height / 2, FlxG.width, FlxG.height / 2 );
			camera.follow( player2 );
			camera.setBounds( 0, 0, FlxG.width, FlxG.height );	// TODO - this should be dimensions of level
			camera.color = 0xccccff;
			FlxG.addCamera( camera );
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}