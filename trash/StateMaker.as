package ssen.scxml2Loic.utils {
import ssen.scxml2Loic.model.StateSource;
import ssen.scxml2Loic.model.TriggerSource;

public class StateMaker extends ActionscriptMaker {
	public var source:StateSource;

	override protected function getSource():String {
		var im:String = "";
		var map:String = "";

		var ts:Vector.<TriggerSource> = source.getTransition();
		var f:int = -1;
		var max:int = ts.length;
		var cmds:Vector.<String>;
		var s:int;
		var sm:int;
		while (++f < max) {
			im += 'import ' + packageName + '.trigger.' + ts[f].name + ';\n';
			im += 'import ' + packageName + '.state.' + ts[f].target + ';\n';
			map += '		map(' + ts[f].name + ', ' + ts[f].target;
			cmds = ts[f].getEvents();
			if (cmds.length > 0) {
				s = -1;
				sm = cmds.length;
				while (++s < sm) {
					im += 'import ' + packageName + '.command.' + cmds[s] + ';\n';
				}
				map += ', ' + cmds.join(" , ") + ');\n';
			} else {
				str += ');\n';
			}
		}

		var str:String = 'package ' + packageName + '.' + getGroup() + ' {\n';
		str += 'import ssen.logic.State;\n\n';
		str += im;
		str += 'public class ' + className + ' extends State {\n';
		str += '	override public function getShutdownCommands():Array {\n';
		str += '		return [ ' + source.getOnexit().join(" , ") + ' ]\n';
		str += '	}\n\n';
		str += '	override public function getStartupCommands():Array {\n';
		str += '		return [ ' + source.getOnentry().join(" , ") + ' ]\n';
		str += '	}\n\n';
		str += '	override public function stay():void {\n';
		str += map;
		str += '	}\n';
		str += '}';
		return str;
	}

	override protected function getGroup():String {
		return "state";
	}



}
}