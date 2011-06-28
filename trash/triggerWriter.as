package ssen.scxml2Loic.utils {
public function triggerWriter(packageName:String, triggerName:String):String {
	var str:String = 'package ' + packageName + '.trigger {\n';
	str += 'import ssen.logic.Trigger;\n\n';
	str += 'public const ' + triggerName + ':Trigger = new Trigger;\n';
	str += '}';
	return str;
}
}