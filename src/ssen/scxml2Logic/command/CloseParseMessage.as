package ssen.scxml2Logic.command {
import flash.events.Event;

import ssen.logic.Command;

public class CloseParseMessage extends Command {
	override public function exec():void {
		// TODO Command Execution
		trace("execute ssen.scxml2Logic.command.CloseParseMessage");
		wire.dispatchEvent(new Event("closeParseMessage"));
		next();
	}

	override public function deconstruct():void {
		// TODO Command Deconstruction
		trace("deconstruct ssen.scxml2Logic.command.CloseParseMessage");
		super.deconstruct();
	}
}
}