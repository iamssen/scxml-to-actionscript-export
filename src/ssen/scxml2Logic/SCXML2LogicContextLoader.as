package ssen.scxml2Logic {
import ssen.logic.ContextLoader;
import ssen.logic.Wire;

public class SCXML2LogicContextLoader extends ContextLoader {
	public function SCXML2LogicContextLoader(document:Object = null) {
		super(document);
	}

	override protected function getContextType():Class {
		return SCXML2Logic;
	}
}
}