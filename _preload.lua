local p = premake
local m = { }

-- Initialize extension
p.extensions.androidstudio = m
m._VERSION                 = p._VERSION

-- This is going to break eligibility to embed this module into the premake exeutable.
-- It's needed to know the directory of libDummy.a amd libDummy.so.
m.MODULE_LOCATION = os.getcwd()

--
-- Create the Android Studio action
--

newaction {
	-- Metadata
	trigger     = 'android-studio',
	shortname   = 'Android Studio',
	description = 'Generate build files for Android Studio by Google and JetBrains',

	-- Capabilities
	valid_kinds = {
		'ConsoleApp',
		'WindowedApp',
		'StaticLib',
		'SharedLib',
		'Utility',
	},
	valid_languages = {
		'C',
		'C++',
		'Java',
	},
	valid_tools = {
		cc = {
			'clang',
			'gcc',
		}
	},

	-- Workspace generator
	onWorkspace = function( wks )
		p.generate( wks, 'build.gradle', m.build_dot_gradle.generateWorkspace )
		p.generate( wks, 'gradle.properties', m.gradle_dot_properties.generate )
		p.generate( wks, 'settings.gradle', m.settings_dot_gradle.generate )
	end,

	-- Project generator
	onProject = function( prj )
		if not prj.androidmanifest then
			prj.androidmanifest = 'AndroidManifest.xml'
			p.generate( prj, prj.androidmanifest, m.android_manifest_dot_xml.generate )
		end
		
		p.generate( prj, 'build.gradle', m.build_dot_gradle.generateProject )
		p.generate( prj, 'Android.mk', m.android_dot_mk.generate )
		p.generate( prj, 'Application.mk', m.application_dot_mk.generate )
	end,
}

--
-- Decide when the full module should be loaded.
--

return function( cfg )
	return _ACTION == 'android-studio'
end
