package flxRnn.state 
{
	import flxRnn.Constant;
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
			
			Constant.Scores.pop();
			Constant.Scores.push(FlxG.score);
			
			_scores = new Array(5);
			for (var i:int = 0; i < Constant.Scores.length; i++)
			{
				_scores[i] = new FlxText(0, 150 + i * 50, FlxG.width, "Score joueur " + Constant.Scores[i] + " point" + (Constant.Scores[i] > 1 ? "s" : ""));
				_scores[i].setFormat(null, 28, 0xff00ff, "center");
				add(_scores[i]);
			}
		}
		
		override public function update():void
		{
			if (FlxG.keys.ESCAPE || FlxG.keys.SPACE || FlxG.keys.ENTER)
			{
				FlxG.switchState(new MenuState);
			}
		}
		
	}

}