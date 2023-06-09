@echo off
rem -------------------------------------------------------------
rem PyCrysFML08
rem -------------------------------------------------------------
rem This file is part of PyCrysFML08
rem
rem The PyCrysFML08 is distributed under LGPL. In agreement with the
rem Intergovernmental Convention of the ILL, this software cannot be used
rem in military applications.
rem
rem PyCrysFML08 is based on Elias Rabel work for Forpy, see <https://github.com/ylikx/forpy>.
rem
rem Copyright (C) 2020-2022  Institut Laue-Langevin (ILL), Grenoble, FRANCE
rem
rem Authors: ILL Scientific Computing Group
rem
rem This library is free software; you can redistribute it and/or
rem modify it under the terms of the GNU Lesser General Public
rem License as published by the Free Software Foundation; either
rem version 3.0 of the License, or (at your option) any later version.
rem
rem This library is distributed in the hope that it will be useful,
rem but WITHOUT ANY WARRANTY; without even the implied warranty of
rem MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
rem Lesser General Public License for more details.
rem
rem You should have received a copy of the GNU Lesser General Public
rem License along with this library; if not, see <http://www.gnu.org/licenses/>.
rem
rem -------------------------------------------------------------

rem CFML_Sxtal_Geom
echo Building py_cfml_sxtal_geom.pyd
ifort /c /fpp /check /nologo ..\..\src\py_cfml_sxtal_geom.f90 /I%CRYSFML08_INSTALL%\libC
link py_cfml_sxtal_geom.obj /out:"py_cfml_sxtal_geom.dll" /libpath:%CRYSFML08_INSTALL%\libC /dll %LIBPYTHON% libCrysFML08.a
move py_cfml_sxtal_geom.dll ..\..\pycrysfml08\py_cfml_sxtal_geom.pyd

rem CFML_DiffPatt
echo Building py_cfml_diffpatt.pyd
ifort /c /fpp /nologo /Warn ..\..\src\py_extension_cfml_diffpatt.f90 /I%CRYSFML08_INSTALL%\libC
ifort /c /fpp /nologo /Warn ..\..\src\py_cfml_diffpatt.f90 /I%CRYSFML08_INSTALL%\libC
link py_extension_cfml_diffpatt.obj py_cfml_diffpatt.obj /out:"py_cfml_diffpatt.dll" /libpath:%CRYSFML08_INSTALL%\libC /dll %LIBPYTHON% libCrysFML08.a
move py_cfml_diffpatt.dll ..\..\pycrysfml08\py_cfml_diffpatt.pyd

rem CFML_Reflections
echo Building py_cfml_reflections.pyd
ifort /c /fpp /nologo /Warn ..\..\src\py_extension_cfml_reflections.f90 /I%CRYSFML08_INSTALL%\libC
ifort /c /fpp /nologo /Warn ..\..\src\py_cfml_reflections.f90 /I%CRYSFML08_INSTALL%\libC
link py_extension_cfml_reflections.obj py_cfml_reflections.obj /out:"py_cfml_reflections.dll" /libpath:%CRYSFML08_INSTALL%\libC /dll %LIBPYTHON% libCrysFML08.a
move py_cfml_reflections.dll ..\..\pycrysfml08\py_cfml_reflections.pyd

rem CFML_VTK
echo Building py_cfml_vtk.pyd
ifort /c /fpp /nologo /Warn ..\..\src\py_cfml_vtk.f90 /I%CRYSFML08_INSTALL%\libC
link py_cfml_vtk.obj /out:"py_cfml_vtk.dll" /libpath:%CRYSFML08_INSTALL%\libC /dll %LIBPYTHON% libCrysFML08.a
move py_cfml_vtk.dll ..\..\pycrysfml08\py_cfml_vtk.pyd

del *.obj *.mod *.exp *.lib
