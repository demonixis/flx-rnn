package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;

	public class WinState extends FlxState 
	{
		private var _background:FlxSprite;
		
		public function WinState() 
		{
			
		}

		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundVictory);
			add(_background);
		}
	}

}