package ssen.scxml2Logic.state {
import ssen.logic.State;
import ssen.scxml2Logic.command.CloseEditor;
import ssen.scxml2Logic.command.OpenEditor;
import ssen.scxml2Logic.command.UpdateSource;
import ssen.scxml2Logic.trigger.Cancel;
import ssen.scxml2Logic.trigger.Complete;

public class ModifySource extends State {
	override public function getStartupCommands():Array {
		return [ OpenEditor ];
	}

	override public function getShutdownCommands():Array {
		return [ CloseEditor ];
	}

	override public function stay():void {
		trace("stay ssen.scxml2Logic.state.EditSource");
		map(Complete, List, UpdateSource);
		map(Cancel, List);
	}
}
}