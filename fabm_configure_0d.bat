@rem Script to configure the fabm0d executable uing CMake

@set old=%cd%
@rem echo %old%

@echo Build directory:
@if "%build_dir%"=="" ( @set build_dir=%UserProfile%\build\fabm ) else ( @echo build_dir is set )
@echo %build_dir%
@if not EXIST "%build_dir%\." ( @mkdir "%build_dir%" )
@chdir "%build_dir%"

@echo Base directories:
@set FABM_BASE=%USERPROFILE%\FABM\code
@set GOTM_BASE=%USERPROFILE%\GOTM\code
@echo %FABM_BASE%
@echo %GOTM_BASE%

@echo Default Fortran compiler is ifort
@set compiler=ifort

@echo Install directory:
@set install_prefix=%APPDATA%\fabm
@echo %install_prefix%

@set host=0d
@if not EXIST "%host%\%compiler%\." ( mkdir "%host%\%compiler%" )
@chdir "%host%\%compiler%"
@echo Ready to configure:
cmake "%FABM_BASE%\src\drivers\0d" ^
      -DFABM_EMBED_VERSION=on ^
      -DGOTM_BASE="%GOTM_BASE%" ^
      -DCMAKE_Fortran_COMPILER=%compiler% ^
      -DCMAKE_INSTALL_PREFIX="%install_prefix%\%compiler%"

@pause

@chdir ..\..
@chdir %old%
