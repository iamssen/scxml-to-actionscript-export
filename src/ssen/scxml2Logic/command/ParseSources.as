package ssen.scxml2Logic.command {
import flash.events.TimerEvent;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.Dictionary;
import flash.utils.Timer;

import ssen.logic.Command;
import ssen.scxml2Logic.model.Source;
import ssen.scxml2Logic.model.SourceModel;
import ssen.scxml2Logic.model.files.ActionscriptFile;
import ssen.scxml2Logic.utils.SCXMLParser;

public class ParseSources extends Command {
	private var _timer:Timer;

	private var f:int;

	/** @private */
	[Inject]
	public var model:SourceModel;

	private var max:int;

	override public function exec():void {
		// TODO Command Execution
		trace("execute ssen.scxml2Logic.command.ParseSources");
		_timer = new Timer(300);
		_timer.addEventListener(TimerEvent.TIMER, timerHandler);
		_timer.start();

		f = -1;
		max = model.list.length;
	}

	private function timerHandler(event:TimerEvent):void {
		if (++f < max) {
			var source:Source = model.list.getItemAt(f) as Source;
			var stream:FileStream = new FileStream;
			stream.open(source.scxml, FileMode.READ);

			var parser:SCXMLParser = new SCXMLParser;
			parser.parse(stream.readMultiByte(stream.bytesAvailable, "utf-8"),
											  source.ns, source.context);

			var list:Dictionary = parser.sources;
			for each (var s:ActionscriptFile in list) {
				s.create(source.src, source.overwriting);
			}
			trace(f, max);
		} else {
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER, timerHandler);
			_timer = null;
			next();
		}
	}

	override public function deconstruct():void {
		// TODO Command Deconstruction
		trace("deconstruct ssen.scxml2Logic.command.ParseSources");
		super.deconstruct();
	}
}
}