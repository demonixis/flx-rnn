package flxRnn 
{
	import adobe.utils.CustomActions;
	import flash.utils.Timer;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class HudTimer extends FlxSprite 
	{
		private var _timeText:FlxText;
		private var _elapsed:Number;
		
		public function HudTimer(posX:int, posY:int) 
		{
			super(posX, posY, Asset.HudTimer);
			_timeText = new FlxText(x + 35, y + 70, 50, "60 sec");
			_timeText.setFormat(null, 12, 0xf000ff, "center");
			_timeText.scrollFactor.x = _timeText.scrollFactor.y = 0;

			_elapsed = 0;
		}
		
		override public function update():void
		{
			super.update();

			_elapsed += FlxG.elapsed;
			
			_timeText.text = Math.ceil(_elapsed).toString() + " sec";
			
		}
		
		override public function draw():void
		{
			super.draw();
			
			_timeText.draw();
		}
		
	}

}