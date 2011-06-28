package ssen.scxml2Loic.utils {
public function commandWriter(packageName:String, commandName:String):String {
	var str:String = 'package ' + packageName + '.command {\n';
	str += 'import ssen.logic.Command;\n\n';
	str += 'public class ' + commandName + ' extends Command {\n';
	str += '	override public function exec():void {\n';
	str += '		// TODO Command Execution\n';
	str += '		next();\n';
	str += '	}\n\n';
	str += '	override public function deconstruct():void {\n';
	str += '		// TODO Command Deconstruction\n';
	str += '		super.deconstruct();\n';
	str += '	}\n';
	str += '}';
	return str;
}
}