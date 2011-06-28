package ssen.scxml2Logic.model.files {


public class TriggerFile extends ActionscriptFile {


	override protected function getSource():String {
		var str:String = 'package ' + getNamespacePath() + ' {\n';
		str += 'import ssen.logic.Trigger;\n\n';
		str += 'public const ' + name + ':Trigger = new Trigger("' + name + '");\n';
		str += '}';
		return str;
	}

	override protected function getSubPackage():String {
		return "trigger";
	}

}
}