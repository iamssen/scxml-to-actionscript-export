package ssen.scxml2Logic.model {
import mx.collections.ArrayList;

import ssen.logic.Model;

public class SourceModel extends Model {

	[Bindable]
	public var list:ArrayList = new ArrayList;

	public var cache:Source;

	public var update:Boolean;
}
}