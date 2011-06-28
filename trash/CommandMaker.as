package ssen.scxml2Loic.utils {

public class CommandMaker extends ActionscriptMaker {

	override protected function getSource():String {
		var str:String = 'package ' + packageName + '.' + getGroup() + ' {\n';
		str += 'import ssen.logic.Command;\n\n';
		str += 'public class ' + className + ' extends Command {\n';
		str += '	override public function exec():void {\n';
		str += '		// TODO Command Execution\n';
		str += '		next();\n';
		str += '	}\n';
		str += '\n';
		str += '	override public function deconstruct():void {\n';
		str += '		// TODO Command Deconstruction\n';
		str += '		super.deconstruct();\n';
		str += '	}\n';
		str += '}';
		return str;
	}

	override protected function getGroup():String {
		return "command";
	}



}
}