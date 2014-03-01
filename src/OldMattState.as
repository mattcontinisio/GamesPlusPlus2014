package  
{
	import item.Gun;
	import item.SpeedBoost;
	import item.Trap;
	import level.Enemy;
	import level.Level;
	import level.Powerup;
	import org.flixel.*;
	import player.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class MattState extends FlxState
	{
		[Embed(source = "../assets/images/test_tilemap.png")] public var ImgTestTilemap:Class;
		
		//public var level:FlxTilemap;
		public var levelGroup:FlxGroup
		public var levels:Level;
		public var currentLevel:uint;
		
		public var player1:Player1;
		public var player2:Player2;
		
		public var bulletGroup:FlxGroup;
		public var trapGroup:FlxGroup;
		
		public var camera1:FlxCamera;
		public var camera2:FlxCamera;
		
		public var timer:Number;
		
		public var isStarted:Boolean;
		
		public var countDownText:FlxText;
		public var controlsText:FlxText;
		
		public function MattState() 
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			FlxG.bgColor = 0x66222222;
			
			/*var data:Array = new Array(
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 );
			level = new FlxTilemap();
			level.loadMap( FlxTilemap.arrayToCSV( data, 64 ), ImgTestTilemap, 40, 40, FlxTilemap.OFF, 0, 0, 1 );
			add( level );
			FlxG.worldBounds.make( 0, 0, level.width, level.height );*/
			
			levelGroup = new FlxGroup();
			add( levelGroup );
			
			levels = new Level();
			levelGroup.add( levels.layer1 );
			FlxG.worldBounds.make( 0, 0, levels.level1.width, levels.level1.height );
			
			bulletGroup = new FlxGroup();
			add( bulletGroup );
			
			trapGroup = new FlxGroup();
			add( trapGroup );
			
			// Make players
			player1 = new Player1( 80, 160, bulletGroup, trapGroup );
			player2 = new Player2( 80, 160, bulletGroup, trapGroup );
			player1.player2 = player2;
			player2.player1 = player1;
			
			// Add players to state
			add( player1 );
			add( player2 );
			
			// Set up cameras to follow players
			
			// Top camera
			camera1 = new FlxCamera( 0, 0, FlxG.width, FlxG.height / 2 );
			camera1.follow( player1, FlxCamera.STYLE_PLATFORMER );
			camera1.setBounds( 0, 0, levels.level1.width, levels.level1.height );
			//camera1.color = 0xffcccc;
			FlxG.addCamera( camera1 );
			
			// Bottom camera
			camera2 = new FlxCamera( 0, FlxG.height / 2, FlxG.width, FlxG.height / 2 );
			camera2.follow( player2, FlxCamera.STYLE_PLATFORMER );
			camera2.setBounds( 0, 0, levels.level1.width, levels.level1.height );
			//camera2.color = 0xaaaaaa;
			FlxG.addCamera( camera2 );
			
			countDownText = new FlxText( 0, 0, 400, "3" );
			countDownText.setFormat( null, 128, 0xffffff, "center", 0x000000 );
			countDownText.x = ( FlxG.width / 2 ) - ( countDownText.width / 2 );
			countDownText.y = ( FlxG.height / 4 ) - ( countDownText.height / 2 );
			add( countDownText );
			
			currentLevel = 1;
			timer = 0;
			isStarted = false;
			
			// TODO - play music
		}
		
		override public function update():void
		{
			timer += FlxG.elapsed;
			
			if ( isStarted )
			{
				super.update();
				
				if ( timer > 6 )
				{
					remove( countDownText );
				}
				
				if ( player1.x + player1.width + 40 > levels.level1.width )
				{
					player1.x = 100;
					camera1.shake();
					player1.lap++;
					
					if ( player1.lap > player2.lap )
					{
						currentLevel++;
						if ( currentLevel == 2 )
						{
							levelGroup.add( levels.layer2 );
						}
						else if ( currentLevel == 3 )
						{
							levelGroup.add( levels.layer3 );
						}
						else if ( currentLevel == 4 )
						{
							levelGroup.add( levels.layer4 );
						}
					}
				}
				
				if ( player2.x + player2.width + 40 > levels.level1.width )
				{
					player2.x = 100;
					camera2.shake();
					player2.lap++;
					
					if ( player2.lap > player1.lap )
					{
						currentLevel++;
						if ( currentLevel == 2 )
						{
							levelGroup.add( levels.layer2 );
						}
						else if ( currentLevel == 3 )
						{
							levelGroup.add( levels.layer3 );
						}
						else if ( currentLevel == 4 )
						{
							levelGroup.add( levels.layer4 );
						}
					}
				}
				
				FlxG.collide( levelGroup, levelGroup, onLevelLevelCollsion );
				FlxG.collide( trapGroup, levelGroup );
				FlxG.collide( player1, levelGroup, onLevelCollision );
				FlxG.collide( player2, levelGroup, onLevelCollision );
				FlxG.overlap( player1, bulletGroup, onPlayerBulletCollision );
				FlxG.overlap( player2, bulletGroup, onPlayerBulletCollision );
				FlxG.overlap( player1, trapGroup, onTrapCollision );
				FlxG.overlap( player2, trapGroup, onTrapCollision );
				FlxG.collide( player1, player2 );
			}
			else
			{
				// Countdown timer
				if ( timer > 3 )
				{
					isStarted = true;
					countDownText.text = "GO!";
				}
				else
				{
					countDownText.text = "" + ( 3 - int( timer ) );
				}
			}
		}
		
		public static function onPlayerBulletCollision( player:FlxObject, bullet:FlxObject ):void
		{
			(player as Player).punched();
			
			bullet.kill();
		}
		
		public static function onLevelCollision( player:FlxObject, levelObject:FlxObject ):void
		{
			if ( levelObject is Powerup )
			{
				var type:String = (levelObject as Powerup).type;
				
				if ( type == "gun" )
				{
					(player as Player).currentItem = new Gun( (player as Player ) );
				}
				else if ( type == "speed boost" )
				{
					(player as Player).currentItem = new SpeedBoost( (player as Player ) );
				}
				else if ( type == "trap" )
				{
					(player as Player).currentItem = new Trap(  );
				}
				
				levelObject.kill();
			}
			
			if ( levelObject is Enemy )
			{
				(player as Player).punched();
			}
		}
		
		public static function onTrapCollision( player:FlxObject, trap:FlxObject ):void
		{
			(player as Player).punched();
			
			trap.kill();
		}
		
		public static function onLevelLevelCollsion( a:FlxObject, b:FlxObject ):void
		{
		}
	}
}