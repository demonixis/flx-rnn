package  
{
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class Neum
	{
		// Backgrounds
		[Embed("../assets/backgrounds/accueil-fond.jpg")] public static var BackgroundMenu:Class;
		[Embed("../assets/backgrounds/accueil-top.png")] public static var ForgroundMenu:Class;
		[Embed("../assets/backgrounds/game-over.jpg")] public static var BackgroundGameOver:Class;
		[Embed("../assets/backgrounds/victoire.jpg")] public static var BackgroundVictory:Class;
		[Embed("../assets/backgrounds/title-background.jpg")] public static var BackgroundTitle:Class;
		[Embed("../assets/backgrounds/fond-gateau.jpg")] public static var BackgroundBoard1:Class;

		// HUD
		[Embed("../assets/hud/accueil-etoile.png")] public static var HudMenuStar:Class;
		[Embed("../assets/hud/nbvie.png")] public static var HudLive:Class;
		[Embed("../assets/hud/plateau-score.png")] public static var HudScore:Class;
		[Embed("../assets/hud/timer.png")] public static var HudTimer:Class;
		[Embed("../assets/hud/timber-rouge.png")] public static var HudTimerCount:Class;

		// Game objects
		[Embed("../assets/objects/bullet.png")] public static var ObjectBullet:Class;
		[Embed("../assets/objects/cerise.png")] public static var ObjectCherry:Class;
		[Embed("../assets/objects/game-over-nuage.png")] public static var ObjectCloudGO:Class;
		[Embed("../assets/objects/incrustration-cerise.png")] public static var ObjectCherryPanel:Class;

		// Sprites
		[Embed("../assets/sprites/lardon-4dir.png")] public static var SpriteLardon:Class;
		[Embed("../assets/sprites/macaron-4dir.png")] public static var SpriteMacaron:Class;
		[Embed("../assets/sprites/painepice-4dir.png")] public static var SpritePainEpice:Class;
		[Embed("../assets/sprites/player.png")] public static var SpritePlayer;

		// Audio
		[Embed("../assets/audio/get-cherry.mp3")] public static var AudioGetCherry:Class;
		[Embed("../assets/audio/loose.mp3")] public static var AudioLoose:Class;
		[Embed("../assets/audio/ouille.mp3")] public static var AudioOuille:Class;
		[Embed("../assets/audio/pop.mp3")] public static var AudioPop:Class;
		[Embed("../assets/audio/push-cherry.mp3")] public static var AudioPushCherry:Class;
		[Embed("../assets/audio/win.mp3")] public static var AudioWin:Class;

		// Fonts
		[Embed("../assets/fonts/GochiHand.ttf")] public static var FontGochiHand:Class;		
	}

}