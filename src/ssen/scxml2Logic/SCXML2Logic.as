package ssen.scxml2Logic {
import ssen.logic.Context;
import ssen.logic.Executer;
import ssen.scxml2Logic.command.*;
import ssen.scxml2Logic.model.SourceModel;
import ssen.scxml2Logic.state.*;

public class SCXML2Logic extends Context {
	override protected function mapping():void {
		// TODO Model mapping
		trace("mapping ssen.scxml2Logic.SCXML2Logic");
		mapSingleton(SourceModel, SourceModel);
	}

	override protected function startup():void {
		trace("startup ssen.scxml2Logic.SCXML2Logic");
		var exec:Executer = getInstance(Executer);
		exec.to = instantiate(List);
		exec.commands = [ CheckUpdate ];
		exec.next();
	}
}
}