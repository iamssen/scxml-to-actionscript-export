package ssen.scxml2Logic.model.files {

public class ViewFile extends ActionscriptFile {

	public var triggers:Vector.<String>;

	public var loader:String;

	override protected function getSource():String {
		var l:Array = loader.split(".");
		var lns:String = l.slice(0, l.length - 1).join(".");

		var str:String = '<?xml version="1.0" encoding="utf-8"?>\n';
		str += '<s:Group \n';
		str += '	width="400" height="300" xmlns:fx="http://ns.adobe.com/mxml/2009"\n';
		str += '	xmlns:s="library://ns.adobe.com/flex/spark"\n';
		str += '	xmlns:mx="library://ns.adobe.com/flex/mx"\n';
		str += '	xmlns:'+l[l.length - 2]+'="' + lns + '.*">\n';
		str += '	<fx:Script>\n';
		str += '		<![CDATA[\n';
		str += '			import ssen.logic.Wire;\n';
		str += '			import ' + ns + '.trigger.*;\n\n';
		str += '			/** @private */\n';
		str += '			[Inject]\n';
		str += '			public var wire:Wire;\n\n';
		str += '		]]>\n';
		str += '	</fx:Script>\n';
		str += '	<fx:Declarations>\n';
		str += '		<' + l[l.length - 2] + ':' + l[l.length - 1] + '/>\n';
		str += '	</fx:Declarations>\n';
		str += '	<s:layout>\n';
		str += '		<s:HorizontalLayout clipAndEnableScrolling="true"/>\n';
		str += '	</s:layout>\n';
		var f:int = -1;
		var max:int = triggers.length;
		while (++f < max) {
			str += '	<s:Button label="' + getClassName(triggers[f]) + '" click="wire.fire(' + getClassName(triggers[f]) + ');"/>\n';
		}
		str += '</s:Group>';
		return str;

	}

	override protected function getSubPackage():String {
		return "view";
	}

	override protected function getExtension():String {
		return "mxml";
	}

}
}