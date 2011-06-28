package ssen.scxml2Logic.model.files {

public class StateFile extends ActionscriptFile {

	public var onentry:Vector.<String>;

	public var onexit:Vector.<String>;

	public var transitions:Vector.<Transition>;

	override protected function getSource():String {
		var f:int;
		var max:int;

		var entry:Vector.<String> = new Vector.<String>;
		var exit:Vector.<String> = new Vector.<String>;
		var map:Vector.<String> = new Vector.<String>;

		if (onentry) {
			f = -1;
			max = onentry.length;
			while (++f < max) {
				entry.push(getClassName(onentry[f]));
			}
		}

		if (onexit) {
			f = -1;
			max = onexit.length;
			while (++f < max) {
				exit.push(getClassName(onexit[f]));
			}
		}

		if (transitions) {
			f = -1;
			max = transitions.length;
			var triggerName:String;
			var targetName:String;
			var commands:Vector.<String> = new Vector.<String>;
			var s:int;
			var ms:int;

			while (++f < max) {
				triggerName = getClassName(transitions[f].trigger);
				targetName = getClassName(transitions[f].target);

				if (transitions[f].commands &&
					transitions[f].commands.length > 0) {
					s = -1;
					ms = transitions[f].commands.length;
					while (++s < ms) {
						commands.push(getClassName(transitions[f].commands[s]));
					}

					map.push('		map(' + triggerName + ', ' + targetName + ', ' + commands.join(" , ") + ');');
				} else {
					map.push('		map(' + triggerName + ', ' + targetName + ');');
				}
			}
		}

		var str:String = 'package ' + getNamespacePath() + ' {\n';
		str += 'import ssen.logic.State;\n';
		str += 'import ' + ns + ".command.*;\n";
		str += 'import ' + ns + ".trigger.*;\n\n";
		str += 'public class ' + name + ' extends State {\n';
		if (entry.length > 0) {
			str += '	override public function getStartupCommands():Array {\n';
			str += '		return [ ' + entry.join(" , ") + ' ];\n';
			str += '	}\n\n';
		}
		if (exit.length > 0) {
			str += '	override public function getShutdownCommands():Array {\n';
			str += '		return [ ' + exit.join(" , ") + ' ];\n';
			str += '	}\n\n';
		}
		str += '	override public function stay():void {\n';
		str += '		trace("stay ' + getFullFath() + '");\n';
		str += map.join("\n") + '\n';
		str += '	}\n';
		str += '}\n';
		str += '}';
		return str;
	}

	override protected function getSubPackage():String {
		return "state";
	}

}
}