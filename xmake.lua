--- Project name
set_project('Template')

--- Project version
set_version('0.0.1')

--- xmake configure
set_xmakever('2.6.1')

--- Build mode
add_rules('mode.debug', 'mode.valgrind', 'mode.release')

--- Macro definition
add_defines('_GNU_SOURCE=1')

--- No warning
set_warnings('all', 'error')

--- Language standard
set_languages('clatest', 'cxxlatest')

--- Unused variables and functions
add_cflags(
  '-Wno-unused-label',
  '-Wno-unused-function',
  '-Wno-unused-variable',
  '-Wno-unused-but-set-variable',
  '-Wno-address-of-packed-member'
)

--- Use reserved identifier
add_cflags('-Wno-reserved-macro-identifier', '-Wno-reserved-identifier')

--- Disable VLA extensons
add_cflags('-Werror=vla')

--- DWARF v4
add_cflags('-gdwarf-4')

--- Toolchain
add_toolchains('clang')

--- Private repositories
add_repositories('RunThem https://github.com/RunThem/My-xmake-repo')

--- Task(lsp) generate the project file
task('lsp', function()
  set_category('plugin')

  on_run(function()
    os.exec('xmake project -k cmake build')
    os.exec('xmake project -k compile_commands build')
  end)

  set_menu({
    usage = 'xmake lsp',
    description = 'Generate the project file.',
  })
end)

--- Third party library
add_requires('libu')

--- Project common header file path
add_includedirs('$(projectdir)/src')

--- Main target
target('Template', function()
  set_kind('binary')
  add_files('src/*.c')

  add_packages('libu')
end)
