-- Copyright 2006-2021 Mitchell. See LICENSE.
-- CMake LPeg lexer.

local lexer = require('lexer')
local token, word_match = lexer.token, lexer.word_match
local P, S = lpeg.P, lpeg.S

local lex = lexer.new('cmake')

-- Whitespace.
lex:add_rule('whitespace', token(lexer.WHITESPACE, lexer.space^1))

-- Keywords.
lex:add_rule('keyword', token(lexer.KEYWORD, word_match(
  'IF ENDIF FOREACH ENDFOREACH WHILE ENDWHILE ELSE ELSEIF', true)))

-- Commands.
lex:add_rule('command', token(lexer.FUNCTION, word_match({
  'ADD_CUSTOM_COMMAND', 'ADD_CUSTOM_TARGET', 'ADD_DEFINITIONS', 'ADD_DEPENDENCIES',
  'ADD_EXECUTABLE', 'ADD_LIBRARY', 'ADD_SUBDIRECTORY', 'ADD_TEST', 'AUX_SOURCE_DIRECTORY',
  'BUILD_COMMAND', 'BUILD_NAME', 'CMAKE_MINIMUM_REQUIRED', 'CONFIGURE_FILE',
  'CREATE_TEST_SOURCELIST', 'ENABLE_LANGUAGE', 'ENABLE_TESTING', 'ENDMACRO', 'EXEC_PROGRAM',
  'EXECUTE_PROCESS', 'EXPORT_LIBRARY_DEPENDENCIES', 'FILE', 'FIND_FILE', 'FIND_LIBRARY',
  'FIND_PACKAGE', 'FIND_PATH', 'FIND_PROGRAM', 'FLTK_WRAP_UI', 'GET_CMAKE_PROPERTY',
  'GET_DIRECTORY_PROPERTY', 'GET_FILENAME_COMPONENT', 'GET_SOURCE_FILE_PROPERTY',
  'GET_TARGET_PROPERTY', 'GET_TEST_PROPERTY', 'INCLUDE', 'INCLUDE_DIRECTORIES',
  'INCLUDE_EXTERNAL_MSPROJECT', 'INCLUDE_REGULAR_EXPRESSION', 'INSTALL', 'INSTALL_FILES',
  'INSTALL_PROGRAMS', 'INSTALL_TARGETS', 'LINK_DIRECTORIES', 'LINK_LIBRARIES', 'LIST', 'LOAD_CACHE',
  'LOAD_COMMAND', 'MACRO', 'MAKE_DIRECTORY', 'MARK_AS_ADVANCED', 'MATH', 'MESSAGE', 'OPTION',
  'OUTPUT_REQUIRED_FILES', 'PROJECT', 'QT_WRAP_CPP', 'QT_WRAP_UI', 'REMOVE', 'REMOVE_DEFINITIONS',
  'SEPARATE_ARGUMENTS', 'SET', 'SET_DIRECTORY_PROPERTIES', 'SET_SOURCE_FILES_PROPERTIES',
  'SET_TARGET_PROPERTIES', 'SET_TESTS_PROPERTIES', 'SITE_NAME', 'SOURCE_GROUP', 'STRING',
  'SUBDIR_DEPENDS', 'SUBDIRS', 'TARGET_LINK_LIBRARIES', 'TRY_COMPILE', 'TRY_RUN',
  'USE_MANGLED_MESA', 'UTILITY_SOURCE', 'VARIABLE_REQUIRES', 'VTK_MAKE_INSTANTIATOR',
  'VTK_WRAP_JAVA', 'VTK_WRAP_PYTHON', 'VTK_WRAP_TCL', 'WRITE_FILE'
}, true)))

-- Constants.
lex:add_rule('constant',
  token(lexer.CONSTANT, word_match('BOOL CACHE FALSE N NO ON OFF NOTFOUND TRUE', true)))

-- Variables.
lex:add_rule('variable', token(lexer.VARIABLE, word_match{
  'APPLE', 'ARGS', 'BORLAND', 'CMAKE_AR', 'CMAKE_BACKWARDS_COMPATIBILITY', 'CMAKE_BASE_NAME',
  'CMAKE_BINARY_DIR', 'CMAKE_BUILD_TOOL', 'CMAKE_BUILD_TYPE', 'CMAKE_CACHEFILE_DIR',
  'CMAKE_CACHE_MAJOR_VERSION', 'CMAKE_CACHE_MINOR_VERSION', 'CMAKE_CACHE_RELEASE_VERSION',
  'CMAKE_C_COMPILE_OBJECT', 'CMAKE_C_COMPILER', 'CMAKE_C_COMPILER_ARG1', 'CMAKE_C_COMPILER_ENV_VAR',
  'CMAKE_C_COMPILER_FULLPATH', 'CMAKE_C_COMPILER_LOADED', 'CMAKE_C_COMPILER_WORKS',
  'CMAKE_C_CREATE_SHARED_LIBRARY', 'CMAKE_C_CREATE_SHARED_LIBRARY_FORBIDDEN_FLAGS',
  'CMAKE_C_CREATE_SHARED_MODULE', 'CMAKE_C_CREATE_STATIC_LIBRARY', 'CMAKE_CFG_INTDIR',
  'CMAKE_C_FLAGS', 'CMAKE_C_FLAGS_DEBUG', 'CMAKE_C_FLAGS_DEBUG_INIT', 'CMAKE_C_FLAGS_INIT',
  'CMAKE_C_FLAGS_MINSIZEREL', 'CMAKE_C_FLAGS_MINSIZEREL_INIT', 'CMAKE_C_FLAGS_RELEASE',
  'CMAKE_C_FLAGS_RELEASE_INIT', 'CMAKE_C_FLAGS_RELWITHDEBINFO', 'CMAKE_C_FLAGS_RELWITHDEBINFO_INIT',
  'CMAKE_C_IGNORE_EXTENSIONS', 'CMAKE_C_INFORMATION_LOADED', 'CMAKE_C_LINKER_PREFERENCE',
  'CMAKE_C_LINK_EXECUTABLE', 'CMAKE_C_LINK_FLAGS', 'CMAKE_COLOR_MAKEFILE', 'CMAKE_COMMAND',
  'CMAKE_COMPILER_IS_GNUCC', 'CMAKE_COMPILER_IS_GNUCC_RUN', 'CMAKE_COMPILER_IS_GNUCXX',
  'CMAKE_COMPILER_IS_GNUCXX_RUN', 'CMAKE_C_OUTPUT_EXTENSION', 'CMAKE_C_SOURCE_FILE_EXTENSIONS',
  'CMAKE_CTEST_COMMAND', 'CMAKE_CURRENT_BINARY_DIR', 'CMAKE_CURRENT_SOURCE_DIR',
  'CMAKE_CXX_COMPILE_OBJECT', 'CMAKE_CXX_COMPILER', 'CMAKE_CXX_COMPILER_ARG1',
  'CMAKE_CXX_COMPILER_ENV_VAR', 'CMAKE_CXX_COMPILER_FULLPATH', 'CMAKE_CXX_COMPILER_LOADED',
  'CMAKE_CXX_COMPILER_WORKS', 'CMAKE_CXX_CREATE_SHARED_LIBRARY',
  'CMAKE_CXX_CREATE_SHARED_LIBRARY_FORBIDDEN_FLAGS', 'CMAKE_CXX_CREATE_SHARED_MODULE',
  'CMAKE_CXX_CREATE_STATIC_LIBRARY', 'CMAKE_CXX_FLAGS', 'CMAKE_CXX_FLAGS_DEBUG',
  'CMAKE_CXX_FLAGS_DEBUG_INIT', 'CMAKE_CXX_FLAGS_INIT', 'CMAKE_CXX_FLAGS_MINSIZEREL',
  'CMAKE_CXX_FLAGS_MINSIZEREL_INIT', 'CMAKE_CXX_FLAGS_RELEASE', 'CMAKE_CXX_FLAGS_RELEASE_INIT',
  'CMAKE_CXX_FLAGS_RELWITHDEBINFO', 'CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT',
  'CMAKE_CXX_IGNORE_EXTENSIONS', 'CMAKE_CXX_INFORMATION_LOADED', 'CMAKE_CXX_LINKER_PREFERENCE',
  'CMAKE_CXX_LINK_EXECUTABLE', 'CMAKE_CXX_LINK_FLAGS', 'CMAKE_CXX_OUTPUT_EXTENSION',
  'CMAKE_CXX_SOURCE_FILE_EXTENSIONS', 'CMAKE_DL_LIBS', 'CMAKE_EDIT_COMMAND',
  'CMAKE_EXECUTABLE_SUFFIX', 'CMAKE_EXE_LINKER_FLAGS', 'CMAKE_EXE_LINKER_FLAGS_DEBUG',
  'CMAKE_EXE_LINKER_FLAGS_MINSIZEREL', 'CMAKE_EXE_LINKER_FLAGS_RELEASE',
  'CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO', 'CMAKE_FILES_DIRECTORY', 'CMAKE_FIND_APPBUNDLE',
  'CMAKE_FIND_FRAMEWORK', 'CMAKE_FIND_LIBRARY_PREFIXES', 'CMAKE_FIND_LIBRARY_SUFFIXES',
  'CMAKE_GENERATOR', 'CMAKE_HOME_DIRECTORY', 'CMAKE_INCLUDE_FLAG_C', 'CMAKE_INCLUDE_FLAG_C_SEP',
  'CMAKE_INCLUDE_FLAG_CXX', 'CMAKE_INIT_VALUE', 'CMAKE_INSTALL_PREFIX', 'CMAKE_LIBRARY_PATH_FLAG',
  'CMAKE_LINK_LIBRARY_FLAG', 'CMAKE_LINK_LIBRARY_SUFFIX', 'CMAKE_MacOSX_Content_COMPILE_OBJECT',
  'CMAKE_MAJOR_VERSION', 'CMAKE_MAKE_PROGRAM', 'CMAKE_MINOR_VERSION', 'CMAKE_MODULE_EXISTS',
  'CMAKE_MODULE_LINKER_FLAGS', 'CMAKE_MODULE_LINKER_FLAGS_DEBUG',
  'CMAKE_MODULE_LINKER_FLAGS_MINSIZEREL', 'CMAKE_MODULE_LINKER_FLAGS_RELEASE',
  'CMAKE_MODULE_LINKER_FLAGS_RELWITHDEBINFO', 'CMAKE_NUMBER_OF_LOCAL_GENERATORS',
  'CMAKE_OSX_ARCHITECTURES', '_CMAKE_OSX_MACHINE', 'CMAKE_OSX_SYSROOT', 'CMAKE_PARENT_LIST_FILE',
  'CMAKE_PATCH_VERSION', 'CMAKE_PLATFORM_HAS_INSTALLNAME',
  'CMAKE_PLATFORM_IMPLICIT_INCLUDE_DIRECTORIES', 'CMAKE_PLATFORM_ROOT_BIN', 'CMAKE_PROJECT_NAME',
  'CMAKE_RANLIB', 'CMAKE_ROOT', 'CMAKE_SHARED_LIBRARY_C_FLAGS',
  'CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS', 'CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS',
  'CMAKE_SHARED_LIBRARY_CXX_FLAGS', 'CMAKE_SHARED_LIBRARY_LINK_C_FLAGS',
  'CMAKE_SHARED_LIBRARY_PREFIX', 'CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG',
  'CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP', 'CMAKE_SHARED_LIBRARY_SONAME_C_FLAG',
  'CMAKE_SHARED_LIBRARY_SONAME_CXX_FLAG', 'CMAKE_SHARED_LIBRARY_SUFFIX',
  'CMAKE_SHARED_LINKER_FLAGS', 'CMAKE_SHARED_LINKER_FLAGS_DEBUG',
  'CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL', 'CMAKE_SHARED_LINKER_FLAGS_RELEASE',
  'CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO', 'CMAKE_SHARED_MODULE_CREATE_C_FLAGS',
  'CMAKE_SHARED_MODULE_CREATE_CXX_FLAGS', 'CMAKE_SHARED_MODULE_PREFIX',
  'CMAKE_SHARED_MODULE_SUFFIX', 'CMAKE_SIZEOF_VOID_P', 'CMAKE_SKIP_RPATH', 'CMAKE_SOURCE_DIR',
  'CMAKE_STATIC_LIBRARY_PREFIX', 'CMAKE_STATIC_LIBRARY_SUFFIX', 'CMAKE_SYSTEM',
  'CMAKE_SYSTEM_AND_C_COMPILER_INFO_FILE', 'CMAKE_SYSTEM_AND_CXX_COMPILER_INFO_FILE',
  'CMAKE_SYSTEM_APPBUNDLE_PATH', 'CMAKE_SYSTEM_FRAMEWORK_PATH', 'CMAKE_SYSTEM_INCLUDE_PATH',
  'CMAKE_SYSTEM_INFO_FILE', 'CMAKE_SYSTEM_LIBRARY_PATH', 'CMAKE_SYSTEM_LOADED', 'CMAKE_SYSTEM_NAME',
  'CMAKE_SYSTEM_PROCESSOR', 'CMAKE_SYSTEM_PROGRAM_PATH', 'CMAKE_SYSTEM_SPECIFIC_INFORMATION_LOADED',
  'CMAKE_SYSTEM_VERSION', 'CMAKE_UNAME', 'CMAKE_USE_RELATIVE_PATHS', 'CMAKE_VERBOSE_MAKEFILE',
  'CYGWIN', 'EXECUTABLE_OUTPUT_PATH', 'FORCE', 'HAVE_CMAKE_SIZEOF_VOID_P', 'LIBRARY_OUTPUT_PATH',
  'LOCATION', 'MACOSX_BUNDLE', 'MINGW', 'MSVC', 'MSVC60', 'MSVC70', 'MSVC71', 'MSVC80', 'MSVC_IDE',
  'POST_BUILD', 'PRE_BUILD', 'PROJECT_BINARY_DIR', 'PROJECT_NAME', 'PROJECT_SOURCE_DIR',
  'RUN_CONFIGURE', 'TARGET', 'UNIX', 'WIN32'
} + P('$') * lexer.range('{', '}')))

-- Operators.
lex:add_rule('operator', token(lexer.OPERATOR, word_match{
  'AND', 'COMMAND', 'DEFINED', 'DOC', 'EQUAL', 'EXISTS', 'GREATER', 'INTERNAL', 'LESS', 'MATCHES',
  'NAME', 'NAMES', 'NAME_WE', 'NOT', 'OR', 'PATH', 'PATHS', 'PROGRAM', 'STREQUAL', 'STRGREATER',
  'STRINGS', 'STRLESS'
} + S('=(){}')))

-- Identifiers.
lex:add_rule('identifier', token(lexer.IDENTIFIER, lexer.word))

-- Strings.
lex:add_rule('string', token(lexer.STRING, lexer.range('"')))

-- Comments.
lex:add_rule('comment', token(lexer.COMMENT, lexer.to_eol('#')))

-- Fold points.
lex:add_fold_point(lexer.KEYWORD, 'IF', 'ENDIF')
lex:add_fold_point(lexer.KEYWORD, 'FOREACH', 'ENDFOREACH')
lex:add_fold_point(lexer.KEYWORD, 'WHILE', 'ENDWHILE')
lex:add_fold_point(lexer.FUNCTION, 'MACRO', 'ENDMACRO')
lex:add_fold_point(lexer.OPERATOR, '(', ')')
lex:add_fold_point(lexer.OPERATOR, '{', '}')
lex:add_fold_point(lexer.COMMENT, lexer.fold_consecutive_lines('#'))

return lex
