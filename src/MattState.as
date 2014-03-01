package  
{
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	import item.Gun;
	import item.SpeedBoost;
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
		
		//Sounds
		[Embed(source = "../assets/sounds/C5.mp3")] protected var C5: Class;
		[Embed(source = "../assets/sounds/B4.mp3")] protected var B4: Class;
		[Embed(source = "../assets/sounds/Bb4.mp3")] protected var Bb4: Class;
		[Embed(source = "../assets/sounds/Ab4.mp3")] protected var Ab4: Class;
		[Embed(source = "../assets/sounds/G4.mp3")] protected var G4: Class;
		[Embed(source = "../assets/sounds/Gb4.mp3")] protected var Gb4: Class;
		[Embed(source = "../assets/sounds/F4.mp3")] protected var F4: Class;
		[Embed(source = "../assets/sounds/Eb4.mp3")] protected var Eb4: Class;
		[Embed(source = "../assets/sounds/D4.mp3")] protected var D4: Class;
		[Embed(source = "../assets/sounds/C4.mp3")] protected var C4: Class;
		[Embed(source = "../assets/sounds/B3.mp3")] protected var B3: Class;
		[Embed(source = "../assets/sounds/Ab3.mp3")] protected var Ab3: Class;
		[Embed(source = "../assets/sounds/G3.mp3")] protected var G3: Class;
		static var note:int = -1;
		static var beat = 250;
		public var music;
		
		//public var level:FlxTilemap;
		public var levelGroup:FlxGroup;
		public var levels:Level;
		public var currentLevel:uint;
		
		public var player1:Player1;
		public var player2:Player2;
		
		public var bulletGroup:FlxGroup;
		
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
			
			// Make players
			player1 = new Player1( 80, 160, bulletGroup );
			player2 = new Player2( 80, 160, bulletGroup );
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
			//camera.color = 0xccccff;
			FlxG.addCamera( camera2 );
			
			countDownText = new FlxText( 0, 0, 400, "3" );
			countDownText.setFormat( null, 128, 0xffffff, "center", 0x000000 );
			countDownText.x = ( FlxG.width / 2 ) - ( countDownText.width / 2 );
			countDownText.y = ( FlxG.height / 4 ) - ( countDownText.height / 2 );
			add( countDownText );
			
			currentLevel = 1;
			timer = 0;
			isStarted = false;
			
			music = setInterval(function():void { FlxG.play(nextNote()) }, beat, 0);
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
					
					/*clearInterval(music);
					beat = beat - 20;
					music = setInterval(function():void { FlxG.play(nextNote()) }, beat, 0);*/
					
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
					}
				}
				
				if ( player2.x + player2.width + 40 > levels.level1.width )
				{
					player2.x = 100;
					camera2.shake();
					player2.lap++;
					
					/*clearInterval(music);
					beat = beat - 20;
					music = setInterval(function():void { FlxG.play(nextNote()) }, beat, 0);*/
					
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
					}
				}
				
				FlxG.collide( levelGroup, levelGroup );
				FlxG.collide( player1, levelGroup, onLevelCollision );
				FlxG.collide( player2, levelGroup, onLevelCollision );
				FlxG.overlap( player1, bulletGroup, onPlayerBulletCollision );
				FlxG.overlap( player2, bulletGroup, onPlayerBulletCollision );
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
				var r:int = Math.random() * 2;
				if ( r == 1 )
				{
					(player as Player).currentItem = new SpeedBoost( (player as Player ) );
				}
				else
				{
					(player as Player).currentItem = new Gun( (player as Player ) );
				}
				
				levelObject.kill();
			}
		}
		
		public function nextNote(): Class
		{
			note++;
			if (note == 36)
			{
				note = 0;
			}
			switch(note)
			{
				case 0:
					return C4;
					break;
				case 1:
					return Eb4;
					break;
				case 2:
					return C5;
					break;
				case 3:
					return C4;
					break;
				case 4:
					return Eb4;
					break;
				case 5:
					return B4;
					break;
				case 6:
					return C4;
					break;
				case 7:
					return Eb4;
					break;
				case 8:
					return Bb4;
					break;
				case 9:
					return Ab3;
					break;
				case 10:
					return C4;
					break;
				case 11:
					return Ab4;
					break;
				case 12:
					return Ab3;
					break;
				case 13:
					return C4;
					break;
				case 14:
					return G4;
					break;
				case 15:
					return Ab3;
					break;
				case 16:
					return C4;
					break;
				case 17:
					return Gb4;
					break;
				case 18:
					return G3;
					break;
				case 19:
					return C4;
					break;
				case 20:
					return F4;
					break;
				case 21:
					return G3;
					break;
				case 22:
					return C4;
					break;
				case 23:
					return Eb4;
					break;
				case 24:
					return G3;
					break;
				case 25:
					return B3;
					break;
				case 26:
					return D4;
					break;
				case 27:
					return F4;
					break;
				case 28:
					return G4;
					break;
				case 29:
					return D4;
					break;
				case 30:
					return F4;
					break;
				case 31:
					return D4;
					break;
				case 32:
					return B3;
					break;
				case 33:
					return D4;
					break;
				case 34:
					return B3;
					break;
				case 35:
					return G3;
					break;
				default:
					return G3;
					break;
			}
			
		}
	}
}