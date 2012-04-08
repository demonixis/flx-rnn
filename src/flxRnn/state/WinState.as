package flxRnn.state
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import flxRnn.Asset;

	public class WinState extends FlxState 
	{
		private var _background:FlxSprite;
		
		private var _isEnd:Boolean;
		private var _id:int;
		
		public function WinState(isEnd:Boolean, id:int) 
		{
			this._isEnd = isEnd;
			this._id = id;
			
			if (_isEnd) 
			{
				_id = 1; // On repasse sur niveau 1
			}
		}

		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundVictory);
			add(_background);
			
			var score:FlxText = new FlxText(120, 380, 100, FlxG.score + " pts");
			score.setFormat(null, 24, 0xff00ff, "center");
			add(score);
			
			if (_isEnd)
			{
				var texte:String = "Merci d'avoir joué à FlxRam Neum Neum !\n";
				texte += "Appuyez sur Entrer pour recommancer ou Echap pour revenir au menu";
				var endMessage:FlxText = new FlxText(10, 560, FlxG.width, texte);
				endMessage.setFormat(null, 14, 0xff00ff, "left");
				add(endMessage);
			}
		}
		
		override public function update():void
		{
			super.update(); 
			
			if (FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("ENTER"))
			{
				FlxG.switchState(new PlayState(_id));
			}
			
			if (FlxG.keys.justPressed("ESCAPE"))
			{
				FlxG.switchState(new MenuState);
			}
		}
	}

}