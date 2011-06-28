package ssen.scxml2Logic.command {
import flash.events.Event;

import ssen.logic.Command;

public class OpenEditor extends Command {
	override public function exec():void {
		// TODO Command Execution
		trace("execute ssen.scxml2Logic.command.OpenEditor");
		wire.dispatchEvent(new Event("openEditor"));
		next();
	}

	override public function deconstruct():void {
		// TODO Command Deconstruction
		trace("deconstruct ssen.scxml2Logic.command.OpenEditor");
		super.deconstruct();
	}
}
}