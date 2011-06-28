package ssen.scxml2Loic.utils {

public class TriggerMaker extends ActionscriptMaker {
	override protected function getSource():String {
		var str:String = 'package ' + packageName + '.' + getGroup() + ' {\n';
		str += 'import ssen.logic.Trigger;\n\n';
		str += 'public const ' + className + ':Trigger = new Trigger;\n';
		str += '}';
		return str;
	}

	override protected function getGroup():String {
		return "trigger";
	}



}
}