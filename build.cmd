@echo off
REM
REM ELMAH - Error Logging Modules and Handlers for ASP.NET
REM Copyright (c) 2004-9 Atif Aziz. All rights reserved.
REM
REM  Author(s):
REM
REM      Atif Aziz, http://www.raboof.com
REM
REM Licensed under the Apache License, Version 2.0 (the "License");
REM you may not use this file except in compliance with the License.
REM You may obtain a copy of the License at
REM
REM    http://www.apache.org/licenses/LICENSE-2.0
REM
REM Unless required by applicable law or agreed to in writing, software
REM distributed under the License is distributed on an "AS IS" BASIS,
REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM See the License for the specific language governing permissions and
REM limitations under the License.
REM
REM -------------------------------------------------------------------------
REM
setlocal enableextensions
pushd "%~dp0"
call :main %*
popd
goto :EOF

:main
for %%c in (Debug Release) do call :msbuild %%c %* || exit /b 1
goto :EOF

:msbuild
echo =========================================================================
echo msbuild "/p:Configuration=%~1;AspNetConfiguration=%~1" /v:m %2 %3 %4 %5 %6 %7 %8 %9
echo -------------------------------------------------------------------------
call msbuild "/p:Configuration=%~1;AspNetConfiguration=%~1" /v:m %2 %3 %4 %5 %6 %7 %8 %9
goto :EOF
