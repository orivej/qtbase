CONFIG += depend_includepath

SKIP_DEPENDS += qconfig.h qmodules.h
DEFINES += QT_NO_TEXTCODEC QT_NO_LIBRARY QT_NO_STL QT_NO_COMPRESS QT_NO_UNICODETABLES \
           QT_NO_GEOM_VARIANT QT_NO_DATASTREAM

#qmake code
SOURCES += project.cpp property.cpp main.cpp generators/makefile.cpp \
           generators/unix/unixmake2.cpp generators/unix/unixmake.cpp meta.cpp \
           option.cpp generators/win32/winmakefile.cpp generators/win32/mingw_make.cpp \
           generators/makefiledeps.cpp generators/metamakefile.cpp generators/mac/pbuilder_pbx.cpp \
           generators/xmloutput.cpp generators/win32/borland_bmake.cpp \
           generators/win32/msvc_nmake.cpp generators/projectgenerator.cpp \
           generators/win32/msvc_vcproj.cpp \
           generators/win32/msvc_vcxproj.cpp \
           generators/win32/msvc_objectmodel.cpp generators/win32/msbuild_objectmodel.cpp \
           generators/integrity/gbuild.cpp

HEADERS += project.h property.h generators/makefile.h \
           generators/unix/unixmake.h meta.h option.h cachekeys.h \
           generators/win32/winmakefile.h generators/win32/mingw_make.h generators/projectgenerator.h \
           generators/makefiledeps.h generators/metamakefile.h generators/mac/pbuilder_pbx.h \
           generators/xmloutput.h generators/win32/borland_bmake.h generators/win32/msvc_nmake.h \
           generators/win32/msvc_vcproj.h \
           generators/win32/msvc_vcxproj.h \
           generators/win32/msvc_objectmodel.h generators/win32/msbuild_objectmodel.h \
           generators/integrity/gbuild.h

contains(QT_EDITION, OpenSource) {
   DEFINES += QMAKE_OPENSOURCE_EDITION
}

bootstrap { #Qt code
   DEFINES+=QT_NODLL QT_NO_THREAD
   SOURCES+= \
        qbitarray.cpp \
        qbuffer.cpp \
        qbytearray.cpp \
        qbytearraymatcher.cpp \
        qcryptographichash.cpp \
        qdatetime.cpp \
        qdir.cpp \
        qdiriterator.cpp \
        qfiledevice.cpp \
        qfile.cpp \
        qabstractfileengine.cpp \
        qfileinfo.cpp \
        qfilesystementry.cpp \
        qfilesystemengine.cpp \
        qfsfileengine.cpp \
        qfsfileengine_iterator.cpp \
        qglobal.cpp \
        qnumeric.cpp \
        qhash.cpp \
        qiodevice.cpp \
        qlist.cpp \
        qlinkedlist.cpp \
        qlocale.cpp \
        qlocale_tools.cpp \
        qmalloc.cpp \
        qmap.cpp \
        qmetatype.cpp \
        qregexp.cpp \
        qtextcodec.cpp \
        qutfcodec.cpp \
        qstring.cpp \
        qstringlist.cpp \
        qtemporaryfile.cpp \
        qtextstream.cpp \
        qurl.cpp \
        quuid.cpp \
        qsettings.cpp \
        qlibraryinfo.cpp \
        qsystemerror.cpp \
        qvariant.cpp \
        qvector.cpp \
        qvsnprintf.cpp \
        qxmlstream.cpp \
        qxmlutils.cpp \
        qlogging.cpp

   HEADERS+= \
        qbitarray.h \
        qbuffer.h \
        qbytearray.h \
        qbytearraymatcher.h \
        qchar.h \
        qcryptographichash.h \
        qdatetime.h \
        qdatetime_p.h \
        qdir.h \
        qdir_p.h \
        qdiriterator.h \
        qfile.h \
        qabstractfileengine_p.h \
        qfileinfo.h \
        qglobal.h \
        qnumeric.h \
        qhash.h \
        qiodevice.h \
        qlist.h \
        qlinkedlist.h \
        qlocale.h \
        qlocale_tools_p.h \
        qmalloc.h \
        qmap.h \
        qmetatype.h \
        qregexp.h \
        qtextcodec.h \
        qutfcodec.h \
        qstring.h \
        qstringlist.h \
        qstringmatcher.h \
        qsystemerror_p.h \
        qtemporaryfile.h \
        qtextstream.h \
        qurl.h \
        quuid.h \
        qvector.h \
        qxmlstream.h \
        qxmlutils.h

    unix {
        SOURCES += qfilesystemengine_unix.cpp qfilesystemiterator_unix.cpp qfsfileengine_unix.cpp
        mac {
          SOURCES += qfilesystemengine_mac.cpp
          SOURCES += qcore_mac.cpp qsettings_mac.cpp
          LIBS += -framework ApplicationServices
        }
    } else:win32 {
        SOURCES += qfilesystemengine_win.cpp qfsfileengine_win.cpp qfilesystemiterator_win.cpp qsettings_win.cpp \
            qsystemlibrary.cpp
        win32-msvc*:LIBS += ole32.lib advapi32.lib
        win32-g++*:LIBS += -lole32 -luuid -ladvapi32 -lkernel32
    }

    qnx {
        CFLAGS += -fhonor-std
        LFLAGS += -lcpp
    }
    DEFINES *= QT_NO_QOBJECT
} else {
    CONFIG += qt 
    QT = core
}
*-g++:profiling {
  QMAKE_CFLAGS = -pg
  QMAKE_CXXFLAGS = -pg
  QMAKE_LFLAGS = -pg
}

PRECOMPILED_HEADER = qmake_pch.h
