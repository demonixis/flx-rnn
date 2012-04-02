package flxRnn.state 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import flxRnn.Asset;
	
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class ScoreState extends FlxState 
	{
		private var _background:FlxSprite;
		private var _title:FlxText;
		private var _scores:Array;
		
		public function ScoreState() 
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundMenu);
			add(_background);
			
			_title = new FlxText(20, 20, FlxG.width, "Hightscores");
			_title.setFormat(null, 46, 0xff00ff, "center");
			add(_title);
			
			_scores = new Array(5);
			for (var i:int = 0; i < 5; i++)
			{
				_scores[i] = new FlxText(50, 50 + i * 5, FlxG.width, "Score joueur " + i);
				_scores[i].setFormat(null, 28, 0xff00ff);
				add(_scores[i]);
			}
		}
		
	}

}