package ssen.scxml2Logic.command {
import flash.events.Event;

import ssen.logic.Command;

public class CloseEditor extends Command {
	override public function exec():void {
		// TODO Command Execution
		trace("execute ssen.scxml2Logic.command.CloseEditor");
		wire.dispatchEvent(new Event("closeEditor"));
		next();
	}

	override public function deconstruct():void {
		// TODO Command Deconstruction
		trace("deconstruct ssen.scxml2Logic.command.CloseEditor");
		super.deconstruct();
	}
}
}