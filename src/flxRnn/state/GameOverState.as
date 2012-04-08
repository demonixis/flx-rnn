package flxRnn.state 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import flxRnn.Asset;
	
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
			
			var score:FlxText = new FlxText(575, 550, 150, FlxG.score + " pts");
			score.setFormat(null, 24, 0xff00ff, "center");
			add(score);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("ENTER"))
			{
				FlxG.switchState(new PlayState(1));
			}
			else if (FlxG.keys.justPressed("ESCAPE"))
			{
				FlxG.switchState(new MenuState);
			}
		}
	}

}