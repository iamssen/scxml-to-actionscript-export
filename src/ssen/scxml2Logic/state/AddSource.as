package ssen.scxml2Logic.state {
import ssen.logic.State;
import ssen.scxml2Logic.command.*;
import ssen.scxml2Logic.trigger.*;

public class AddSource extends State {
	override public function getStartupCommands():Array {
		return [ OpenEditor ];
	}

	override public function getShutdownCommands():Array {
		return [ CloseEditor ];
	}

	override public function stay():void {
		trace("stay ssen.scxml2Logic.state.EditSource");
		map(Complete, List, AddList);
		map(Cancel, List);
	}
}
}