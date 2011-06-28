package ssen.scxml2Logic.command {
import flash.events.Event;

import ssen.logic.Command;
import ssen.update.AIRUpdate;
import ssen.update.AIRUpdateState;

public class CheckUpdate extends Command {
	private var _update:AIRUpdate;

	override public function exec():void {
		// TODO Command Execution
		trace("execute ssen.scxml2Logic.command.CheckUpdate");
		_update = new AIRUpdate("http://ssen.name/utils/SCXML2SSenLogicExporter.xml");
		_update.addEventListener(Event.INIT, checked);
		_update.check();
	}

	private function checked(event:Event):void {
		_update.removeEventListener(Event.INIT, checked);
		switch (_update.state) {
			case AIRUpdateState.AVAILABLE:
				_update.update();
				break;
			default:
				_update = null;
				next();
				break;
		}
	}

	override public function deconstruct():void {
		// TODO Command Deconstruction
		trace("deconstruct ssen.scxml2Logic.command.CheckUpdate");
		super.deconstruct();
	}
}
}