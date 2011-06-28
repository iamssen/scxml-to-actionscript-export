package ssen.scxml2Logic.model.files {
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class ActionscriptFile {
	public var ns:String;

	public var name:String;

	final public function getNamespacePath():String {
		var path:String = ns;
		if (getSubPackage() != null) {
			path += "." + getSubPackage();
		}
		return path;
	}

	final public function getFullFath():String {
		return getNamespacePath() + "." + name;
	}

	final public function create(src:File, overwriting:Boolean = false):void {
		var path:File = getActionscript(src);
		if (path.exists) {
			if (overwriting) {
				makeFileStream(path);
			}
		} else {
			makeFileStream(path);
		}
	}

	final public function test():void {
		trace("===================", getFullFath(),
			  "===========================");
		trace(getSource());
	}

	private function makeFileStream(path:File):void {
		var stream:FileStream = new FileStream;
		stream.open(path, FileMode.WRITE);
		stream.writeMultiByte(getSource(), "utf-8");
	}

	protected function getSource():String {
		throw new Error("not implemented");
	}

	protected function getSubPackage():String {
		return null;
	}

	private function getActionscript(src:File):File {
		var p:Array = ns.split(".");
		if (getSubPackage() != null) {
			p.push(getSubPackage());
		}
		var f:int = -1;
		var max:int = p.length;
		var l:File = src.clone();
		while (++f < max) {
			l = l.resolvePath(p[f]);
		}
		return l.resolvePath(name + "."+getExtension());
	}

	final protected function getClassName(path:String):String {
		var arr:Array = path.split(".");
		return arr[arr.length - 1];
	}
	
	protected function getExtension():String {
		return "as";
	}
}
}