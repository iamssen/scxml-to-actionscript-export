package ssen.scxml2Logic.command {
import ssen.logic.Command;

public class CheckList extends Command {
	override public function exec():void {
		// TODO Command Execution
		trace("execute ssen.scxml2Logic.command.CheckList");
		next();
	}

	override public function deconstruct():void {
		// TODO Command Deconstruction
		trace("deconstruct ssen.scxml2Logic.command.CheckList");
		super.deconstruct();
	}
}
}