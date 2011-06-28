package ssen.scxml2Logic.command {
import flash.events.Event;

import ssen.logic.Command;

public class OpenParseMessage extends Command {
	override public function exec():void {
		// TODO Command Execution
		trace("execute ssen.scxml2Logic.command.OpenParseMessage");
		wire.dispatchEvent(new Event("openParseMessage"));
		next();
	}

	override public function deconstruct():void {
		// TODO Command Deconstruction
		trace("deconstruct ssen.scxml2Logic.command.OpenParseMessage");
		super.deconstruct();
	}
}
}