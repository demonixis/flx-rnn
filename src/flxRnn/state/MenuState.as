package flxRnn.state 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import flxRnn.Asset;
	import flxRnn.state.PlayState;
	import flxRnn.state.ScoreState;
	
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class MenuState extends FlxState 
	{
		private var _background:FlxSprite;
		private var _forground:FlxSprite;
		
		private var _menuItemsText:Array;
		private var _state:int;
		
		public function MenuState() 
		{
			_state = 0;
		}
		
		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundMenu);
			add(_background);
			
			_forground = new FlxSprite(0, 0, Asset.ForgroundMenu);
			add(_forground);
			
			_menuItemsText = new Array(3);
			_menuItemsText[0] = new FlxText(400, 310, 350, "Jouer");
			_menuItemsText[1] = new FlxText(435, 395, 350, "Hightscores");
			_menuItemsText[2] = new FlxText(435, 490, 350, "DLC");
			
			for (var i:int = 0; i < 3; i++)
			{
				_menuItemsText[i].setFormat(null, 36, 0xff00ff, "center", 0x0ffff00);
				_menuItemsText[i].angle = -8;
				add(_menuItemsText[i]);
			}
			
			_menuItemsText[0].color = 0xffff00;
		}
		
		private function updateColors():void
		{
			for (var i:int = 0; i < 3; i++)
			{
				_menuItemsText[i].color = 0xff00ff;
			}
			_menuItemsText[_state].color = 0xffff00;
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("Z"))
			{
				_state--;
				
				if (_state < 0) {
					_state = 2;
				}
				
				updateColors();
			}
			else if (FlxG.keys.justPressed("DOWN")  || FlxG.keys.justPressed("S"))
			{
				_state++;
				
				if (_state > 2) {
					_state = 0;
				}
				
				updateColors();
			}
			
			if (FlxG.keys.justPressed("ENTER")  || FlxG.keys.justPressed("SPACE"))
			{
				switch (_state)
				{
					case 0:
						FlxG.switchState(new PlayState);
						break;
					case 1:
						FlxG.switchState(new ScoreState);
						break;
					case 2: 
						FlxU.openURL("http://www.demonixis.net");
						break;
					default: break;
				}
			}
		}
	}
}