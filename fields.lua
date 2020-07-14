local p = premake

p.api.register {
	name   = 'appid',
	scope  = 'project',
	kind   = 'string',
	tokens = true,
}

p.api.register {
	name   = 'assetdirs',
	scope  = 'project',
	kind   = 'list:directory',
	tokens = true,
}

p.api.register {
	name   = 'javadirs',
	scope  = 'project',
	kind   = 'list:directory',
	tokens = true,
}

p.api.register {
	name   = 'resdirs',
	scope  = 'project',
	kind   = 'list:directory',
	tokens = true,
}

p.api.register {
	name   = 'androidmanifest',
	scope  = 'project',
	kind   = 'file',
	tokens = true,
}

p.api.register {
	name    = 'gradleversion',
	scope   = 'workspace',
	kind    = 'string',
	tokens  = true,
}

p.api.register {
	name   = 'jvmargs',
	scope  = 'workspace',
	kind   = 'list:string',
	tokens = true,
}

p.api.register {
	name   = 'minsdkversion',
	scope  = 'project',
	kind   = 'string',
	tokens = true,
}

p.api.register {
	name   = 'maxsdkversion',
	scope  = 'project',
	kind   = 'string',
	tokens = true,
}
