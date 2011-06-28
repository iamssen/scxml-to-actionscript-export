package ssen.scxml2Logic.model.files {

public class ContextFile extends ActionscriptFile {

	public var initial:Transition;

	override protected function getSource():String {
		var str:String = 'package ' + getNamespacePath() + ' {\n';
		str += 'import ssen.logic.Context;\n';
		str += 'import ssen.logic.Executer;\n';
		str += 'import ' + ns + '.command.*;\n';
		str += 'import ' + ns + '.state.*;\n\n';
		str += 'public class ' + name + ' extends Context {\n';
		str += '	/** @private */\n';
		str += '	override protected function locking():void {\n';
		str += '		// TODO locking\n';
		str += '		trace("' + getFullFath() + '.locking()");\n';
		str += '		// lock("some", value);\n';
		str += '		super.locking();\n';
		str += '	}\n\n';
		str += '	/** @private */\n';
		str += '	override protected function mapping():void {\n';
		str += '		// TODO inject mapping\n';
		str += '		trace("' + getFullFath() + '.mapping()");\n';
		str += '		// mapSingleton(SomeClass, SomeClass);\n';
		str += '	}\n\n';
		str += '	/** @private */\n';
		str += '	override protected function startup():void {\n';
		str += '		trace("' + getFullFath() + '.startup()");\n';
		str += '		var exec:Executer = getInstance(Executer);\n';
		str += '		exec.to = instantiate(' + getClassName(initial.target) + ');\n';
		if (initial.commands.length > 0) {
			var cmds:Vector.<String> = new Vector.<String>;
			var f:int = -1;
			var max:int = initial.commands.length;
			while (++f < max) {
				cmds.push(getClassName(initial.commands[f]));
			}
			str += '		exec.commands = [ ' + cmds.join(" , ") + ' ];\n';
		}
		str += '		exec.next();\n';
		str += '	}\n';
		str += '}\n';
		str += '}';
		return str;
	}

}
}