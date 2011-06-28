package ssen.scxml2Logic.state {
import ssen.logic.State;
import ssen.scxml2Logic.command.*;
import ssen.scxml2Logic.trigger.*;

public class List extends State {
	override public function getStartupCommands():Array {
		return [ CheckList ];
	}

	override public function stay():void {
		trace("stay ssen.scxml2Logic.state.List");
		map(Parse, ParseSource);
		map(Add, AddSource);
		map(Modify, ModifySource, ReadSource);
	}
}
}