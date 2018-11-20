INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_GNURADIO_OSMOSDR gnuradio-osmosdr)

FIND_PATH(
    GNURADIO_OSMOSDR_INCLUDE_DIRS
    NAMES osmosdr/source.h
    HINTS $ENV{GNURADIO_OSMOSDR_DIR}/include
        ${PC_GNURADIO_OSMOSDR_INCLUDEDIR}
        ${CMAKE_INSTALL_PREFIX}/include/osmosdr
    PATHS /usr/local/include/osmosdr
          /usr/include/osmosdr
          /opt/local/include
)

FIND_LIBRARY(
    GNURADIO_OSMOSDR_LIBRARIES
    NAMES gnuradio-osmosdr
    HINTS $ENV{GNURADIO_OSMOSDR_DIR}/lib
        ${PC_GNURADIO_OSMOSDR_LIBDIR}
        ${CMAKE_INSTALL_PREFIX}/lib
        ${CMAKE_INSTALL_PREFIX}/lib64
    PATHS /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          /opt/local/lib
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GNURADIO_OSMOSDR DEFAULT_MSG GNURADIO_OSMOSDR_LIBRARIES GNURADIO_OSMOSDR_INCLUDE_DIRS)
MARK_AS_ADVANCED(GNURADIO_OSMOSDR_LIBRARIES GNURADIO_OSMOSDR_INCLUDE_DIRS)
