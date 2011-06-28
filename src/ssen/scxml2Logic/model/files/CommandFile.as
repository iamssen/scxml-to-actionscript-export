package ssen.scxml2Logic.model.files {

public class CommandFile extends ActionscriptFile {

	override protected function getSource():String {
		var str:String = 'package ' + getNamespacePath() + ' {\n';
		str += 'import ssen.logic.Command;\n\n';
		str += 'public class ' + name + ' extends Command {\n';
		str += '	/** @private */\n';
		str += '	override public function exec():void {\n';
		str += '		// TODO Command Execution\n';
		str += '		trace("' + getFullFath() + '.exec() ");\n';
		str += '		next();\n';
		str += '	}\n\n';
		str += '	/** @private */\n';
		str += '	override public function deconstruct():void {\n';
		str += '		// TODO Command Deconstruction\n';
		str += '		trace("' + getFullFath() + '.deconstruct()");\n';
		str += '		super.deconstruct();\n';
		str += '	}\n';
		str += '}\n';
		str += '}';
		return str;
	}

	override protected function getSubPackage():String {
		return "command";
	}

}
}