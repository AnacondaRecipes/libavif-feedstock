mkdir build
cd build
if errorlevel 1 exit /b 1

:: Other codecs cannot be enabled because they are not on default
cmake .. -G Ninja                                ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%"    ^
  -DCMAKE_INSTALL_LIBDIR=lib                     ^
  -DCMAKE_BUILD_TYPE=Release                     ^
  -DBUILD_SHARED_LIBS=ON                         ^
  -DAVIF_BUILD_TESTS=OFF                         ^
  -DAVIF_CODEC_AOM=ON                            ^
  -DAVIF_CODEC_SVT=OFF                           ^
  -DAVIF_CODEC_DAV1D=ON                          ^
  -DAVIF_CODEC_LIBGAV1=OFF                       ^
  -DAVIF_CODEC_RAV1E=OFF                         ^
  -DAVIF_ENABLE_WERROR=OFF                       ^
  -DAVIF_LIBYUV=OFF
if errorlevel 1 exit /b 1

ninja
if errorlevel 1 exit /b 1

ninja install -j%CPU_COUNT%
if errorlevel 1 exit /b 1
