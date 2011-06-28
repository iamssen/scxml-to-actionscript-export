package ssen.scxml2Logic.model {
import flash.filesystem.File;

public class Source {

	/* *********************************************************************
	* original
	********************************************************************* */
	/** scxml source file */
	[Bindable]
	public var scxml:File;

	/** src folder */
	[Bindable]
	public var src:File;

	/** package name */
	[Bindable]
	public var ns:String;

	[Bindable]
	public var context:String;

	[Bindable]
	public var overwriting:Boolean;
}
}