package ssen.scxml2Logic.state {
import flash.events.Event;

import ssen.logic.State;
import ssen.scxml2Logic.command.*;
import ssen.scxml2Logic.trigger.*;

public class ParseSource extends State {
	override public function getStartupCommands():Array {
		return [ OpenParseMessage, ParseSources ];
	}

	override public function getShutdownCommands():Array {
		return [ CloseParseMessage ];
	}

	override public function stay():void {
		trace("stay ssen.scxml2Logic.state.ParseSource");
		map(Complete, List);
		wire.dispatchEvent(new Event("parseComplete"));
		wire.fire(Complete);
	}
}
}