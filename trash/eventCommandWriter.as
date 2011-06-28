package ssen.scxml2Loic.utils {
public function eventCommandWriter(packageName:String, eventName:String):String {
	var str:String = 'package ' + packageName + '.command {\n';
	str += 'import ssen.logic.EventCommand;\n\n';
	str += 'public class ' + eventName + ' extends EventCommand {\n';
	str += '	public function ' + eventName + '() {\n';
	str += '		super("' + eventName + '");\n';
	str += '	}\n';
	str += '}';
	return str;
}
}