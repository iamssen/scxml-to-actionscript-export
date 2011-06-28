package ssen.scxml2Logic.model.files {

public class ContextLoaderFile extends ActionscriptFile {

	public var context:String;

	override protected function getSource():String {
		var contextName:String = getClassName(context);

		var str:String = 'package ' + getNamespacePath() + ' {\n';
		str += 'import ssen.logic.ContextLoader;\n';
		str += 'import ' + ns + '.' + contextName + ';\n\n';
		str += 'public class ' + name + ' extends ContextLoader {\n';
		str += '	public function ' + name + '(document:Object = null, boundary:String = "") {\n';
		str += '		super(document, boundary);\n';
		str += '	}\n\n';
		str += '	override protected function getContextType():Class {\n';
		str += '		return ' + contextName + ';\n';
		str += '	}\n';
		str += '}\n';
		str += '}';
		return str;
	}

}
}