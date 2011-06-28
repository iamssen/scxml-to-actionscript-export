package ssen.scxml2Loic.utils {
import ssen.scxml2Loic.model.TriggerSource;


public class ContextMaker extends ActionscriptMaker {
	public var initial:TriggerSource;

	override protected function getSource():String {
		var cmds:Vector.<String> = initial.getEvents();

		var str:String = 'package ' + packageName + ' {\n';
		str += 'import ssen.logic.Context;\n';
		str += 'import ssen.logic.Executer;\n';
		var f:int = -1;
		var max:int = cmds.length;
		while (++f < max) {
			str += 'import ' + packageName + '.command.' + cmds[f] + ';\n';
		}
		str += 'import ' + packageName + '.' + initial.target + ';\n\n';
		str += 'public class ' + className + ' extends Command {\n';
		str += '	override protected function mapping():void {\n';
		str += '		// TODO Model mapping\n';
		str += '		// injector.mapSingleton(SomClass);\n';
		str += '	}\n';
		str += '	\n';
		str += '	override protected function startup():void {\n';
		str += '		var exec:Executer = injector.instantiate(Executer);\n';
		str += '		exec.to = new ' + initial.target + ';\n';
		str += '		injector.injectInto(exec.to);\n';
		if (cmds.length > 0) {
			str += '		exec.commands = [ ' + cmds.join(" , ") + ' ];\n';
		}
		str += '		exec.next();\n';
		str += '	}\n';
		str += '}';
		return str;
	}

}
}