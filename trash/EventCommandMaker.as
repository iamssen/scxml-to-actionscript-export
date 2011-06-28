package ssen.scxml2Loic.utils {

public class EventCommandMaker extends ActionscriptMaker {

	override protected function getSource():String {
		var str:String = 'package ' + packageName + '.' + getGroup() + ' {\n';
		str += 'import ssen.logic.EventCommand;\n\n';
		str += 'public class ' + className + ' extends EventCommand {\n';
		str += '	public function ' + className + '() {\n';
		str += '		super("' + className + '");\n';
		str += '	}\n';
		str += '}';
		return str;
	}

	override protected function getGroup():String {
		return "command";
	}



}
}