package;

import flixel.FlxG;
import lime.utils.Assets;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end

using StringTools;

class CoolUtil
{
	public static var modList:Array<String> = sys.FileSystem.readDirectory("assets/mods");
	public static var difficultyArray:Array<String> = ['EASY', "NORMAL", "HARD"];

	public static function difficultyString():String
	{
		return difficultyArray[PlayState.storyDifficulty];
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function coolStringFile(path:String):Array<String>
	{
		var daList:Array<String> = path.trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static inline function coolerTextFile(path:String, daString:String = ''):String
	{
		#if MODS_ALLOWED
		if (FileSystem.exists(path))
			daString = File.getContent(path).trim();
		#else
		if (Assets.exists(path))
			daString = Assets.getText(path).trim();
		#end

		return daString;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}
}
