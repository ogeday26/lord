workspace "lord"
	configurations { "debug", "release" }

	toolset "clang"
	cppdialect "C++17"
	warnings "extra"
	fatalwarnings "extra"

	targetdir "_bin"
	objdir "_bin/obj"

	filter "configurations:debug"
		symbols "on"

	filter "configurations:release"
		defines { "NDEBUG" }
		optimize "on"

	project "lp"
		kind "SharedLib"
		language "C++"

		includedirs { "lp" }
		files { "lp/**.cc" }

	project "lc"
		kind "SharedLib"
		language "C++"

		includedirs { "lc", "lp" }
		files { "lc/**.cc" }

	project "cli"
		kind "ConsoleApp"
		language "C++"

		targetname "lord"

		includedirs { "cli", "lc", "lp" }
		files { "cli/**.cc" }
		links { "lc", "lp", "readline" }
