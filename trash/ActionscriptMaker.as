package ssen.scxml2Loic.utils {
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class ActionscriptMaker {
	public var src:File;

	public var packageName:String;

	public var className:String;

	public var overwriting:Boolean;

	final public function make():void {
		var path:File = getActionscript();
		if (path.exists) {
			if (overwriting) {
				makeFileStream(path);
			}
		} else {
			makeFileStream(path);
		}
	}

	private function makeFileStream(path:File):void {
		var stream:FileStream = new FileStream;
		stream.open(path, FileMode.WRITE);
		stream.writeMultiByte(getSource(), "utf-8");
	}

	protected function getSource():String {
		throw new Error("not implemented");
	}

	protected function getGroup():String {
		return null;
	}

	private function getActionscript():File {
		var p:Array = packageName.split(".");
		if (getGroup() != null) {
			p.push(getGroup());
		}
		var f:int = -1;
		var max:int = p.length;
		var l:File = src.clone();
		while (++f < max) {
			l = l.resolvePath(p[f]);
		}
		return l.resolvePath(className + ".as");
	}
}
}