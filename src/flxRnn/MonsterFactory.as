package flxRnn 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;

	public class MonsterFactory extends FlxGroup 
	{
		private var _spawnInterval:Number;
		
		public function MonsterFactory() 
		{
			
			_spawnInterval = 0;
		}
		
		override public function update():void
		{
			super.update();
			var size:int = this.length;
			
			_spawnInterval -= FlxG.elapsed;
			if (_spawnInterval <= 0)
			{
				var monster:Monster = new Monster(Math.abs(Math.random() * 4));
				add(monster);
				_spawnInterval = 3;
			}
			
			
		}
		
		override public function draw():void
		{
			super.draw();
		}
		
	}

}