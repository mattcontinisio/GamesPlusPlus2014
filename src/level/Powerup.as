package level 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Powerup extends FlxSprite
	{
		[Embed(source = "../../assets/images/Gun.png")] public var ImgGun:Class;
		[Embed(source = "../../assets/images/SpeedBoost.png")] public var ImgSpeedBoost:Class;
		[Embed(source = "../../assets/images/Trap.png")] public var ImgTrap:Class;
		
		public var type:String;
		
		public function Powerup( X:Number, Y:Number, Type:String ) 
		{
			super( X, Y );
			
			type = Type;
			
			acceleration.y = 800;
			
			//makeGraphic( 24, 24, 0xff0000ff );
			
			if ( type == "gun" )
			{
				loadGraphic( ImgGun, false, false, 16, 32 );
			}
			else if ( type == "speed boost" )
			{
				loadGraphic( ImgSpeedBoost, false, false, 16, 32 );
			}
			else if ( type == "trap" )
			{
				loadGraphic( ImgTrap, false, false, 16, 32 );
			}
		}
		
	}

}