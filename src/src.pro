TARGET = qmsgpack
VER_MAJ = 0
VER_MIN = 1
VER_PAT = 0
CONFIG   -= app_bundle

TEMPLATE = lib
DEFINES += MSGPACK_MAKE_LIB
DESTDIR = $$shadowed($$PWD/../bin)
QMAKE_CXXFLAGS += -fPIC

CONFIG   += debug_and_release
TARGET = $$qtLibraryTarget($$TARGET)
VERSION = $$join($$list($$VER_MAJ $$VER_MIN $$VER_PAT), .)

include(../qmsgpack.pri)

HEADERS_INSTALL = \
    msgpack.h \
    endianhelper.h \
    msgpackcommon.h \
    msgpack_export.h \
    msgpackstream.h \

STREAM_HEADERS_INSTALL = \
    stream/geometry.h \
    stream/time.h

qtHaveModule(location) {
    STREAM_HEADERS_INSTALL += stream/location.h
}

unix {
    header_files.files = $$HEADERS_INSTALL
    header_files.path = /usr/include/qmsgpack
    stream_header_files.files = $$STREAM_HEADERS_INSTALL
    stream_header_files.path = /usr/include/qmsgpack/stream
    target.path = /usr/lib
    INSTALLS += header_files stream_header_files target
}
