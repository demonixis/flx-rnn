package flxRnn.state 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	public class GameOverState extends FlxState 
	{
		private var _background:FlxSprite;
		
		public function GameOverState() 
		{
			
		}
		
		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundGameOver);
			add(_background);
		}
	}

}