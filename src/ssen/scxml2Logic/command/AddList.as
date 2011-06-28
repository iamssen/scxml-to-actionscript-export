package ssen.scxml2Logic.command {
import ssen.logic.Command;
import ssen.scxml2Logic.model.SourceModel;

public class AddList extends Command {

	/** @private */
	[Inject]
	public var model:SourceModel;

	override public function exec():void {
		// TODO Command Execution
		trace("execute ssen.scxml2Logic.command.AddList");
		model.list.addItem(model.cache);
		model.cache = null;
		next();
	}

	override public function deconstruct():void {
		// TODO Command Deconstruction
		trace("deconstruct ssen.scxml2Logic.command.AddList");
		super.deconstruct();
	}
}
}