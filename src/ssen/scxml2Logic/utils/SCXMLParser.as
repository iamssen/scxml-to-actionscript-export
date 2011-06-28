package ssen.scxml2Logic.utils {
import avmplus.getQualifiedClassName;

import flash.utils.Dictionary;
import flash.utils.getQualifiedSuperclassName;

import ssen.scxml2Logic.model.files.ActionscriptFile;
import ssen.scxml2Logic.model.files.CommandFile;
import ssen.scxml2Logic.model.files.ContextFile;
import ssen.scxml2Logic.model.files.StateFile;
import ssen.scxml2Logic.model.files.Transition;
import ssen.scxml2Logic.model.files.TriggerFile;
import ssen.scxml2Logic.model.files.ViewFile;
import ssen.scxml2Logic.model.files.ContextLoaderFile;

public class SCXMLParser {
	/** parsed sources */
	public var sources:Dictionary;

	private var _package:String;


	public function parse(str:String, packageName:String,
						  contextName:String):void {
		_package = packageName;
		sources = new Dictionary;
		str = str.replace('xmlns="http://www.w3.org/2005/07/scxml"', "");

		var xml:XML = new XML(str);
		var list:XMLList = xml.state;
		var f:int = -1;
		var max:int = list.length();
		var state:XML;
		while (++f < max) {
			state = xml.state[f];
			stateParse(state);
		}

		var id:String = createSource(contextName, "context");
		var context:ContextFile = sources[id];

		if (xml.initial.length() > 0) {
			context.initial = transitionParser(xml.initial[0].transition[0]);
		}

		id = createSource(contextName + "Loader", "loader");
		var loader:ContextLoaderFile = sources[id];
		loader.context = context.getFullFath();

		id = createSource(contextName + "SampleView", "view");
		var view:ViewFile = sources[id];
		view.loader = loader.getFullFath();
		view.triggers = new Vector.<String>;

		var reg:RegExp = /\.trigger\./;
		for (id in sources) {
			if (reg.test(id)) {
				view.triggers.push(id);
			}
		}
	}

	private function stateParse(state:XML):void {
		var id:String = createSource(state.@id, "state");
		var s:StateFile = sources[id];

		if (state.onentry != undefined) {
			s.onentry = sendListParser(state.onentry.send);
		}

		if (state.onexit != undefined) {
			s.onexit = sendListParser(state.onexit.send);
		}

		if (state.transition != undefined) {
			s.transitions = transitionListParser(state.transition);
		}
	}

	private function transitionListParser(transitionList:XMLList):Vector.<Transition> {
		var f:int = -1;
		var max:int = transitionList.length();
		if (max == 0) {
			return null;
		}

		var transitions:Vector.<Transition> = new Vector.<Transition>;

		while (++f < max) {
			transitions.push(transitionParser(transitionList[f]));
		}

		return transitions;
	}

	private function transitionParser(transition:XML):Transition {
		var t:Transition = new Transition;

		if (transition.@event != undefined) {
			t.trigger = createTrigger(transition.@event);
		}
		if (transition.@target) {
			t.target = _package + ".state." + transition.@target;
		}
		t.commands = sendListParser(transition.send);

		return t;
	}

	private function sendListParser(sendList:XMLList):Vector.<String> {
		var f:int = -1;
		var max:int = sendList.length();
		if (max == 0) {
			return null;
		}

		var send:XML;
		var events:Vector.<String> = new Vector.<String>;
		while (++f < max) {
			send = sendList[f];
			events.push(createCommand(send.@event));
		}

		return events;
	}

	private function createCommand(commandName:String):String {
		return createSource(commandName, "command");
	}

	private function createTrigger(triggerName:String):String {
		return createSource(triggerName, "trigger");
	}

	private function createSource(name:String, type:String):String {
		var id:String;
		var ns:String = _package;

		if (type == "context") {
			id = ns + "." + name;
		} else {
			id = ns + "." + type + "." + name;
		}
		if (sources[id]) {
		} else {
			var cls:Class;
			switch (type) {
				case "state":
					cls = StateFile;
					break;
				case "context":
					cls = ContextFile;
					break;
				case "trigger":
					cls = TriggerFile;
					break;
				case "command":
					cls = CommandFile;
					break;
				case "loader":
					cls = ContextLoaderFile;
					break;
				case "view":
					cls = ViewFile;
					break;
			}
			var source:ActionscriptFile = new cls();
			source.ns = ns;
			source.name = name;
			sources[id] = source;
		}
		return id;
	}
}
}