pragma Singleton

import QtQuick

QtObject{
    property ListModel _2DCarouselModel : ListModel{
        ListElement{
            imgUrl:"qrc:/res/webp/frontpage-placeholder-columns1.webp"
            keywords: "DEVELOP & CODE"
            title: "Be productive and speed up development"
            content: "Qt is full of tools to simplify developers' lives and help with not just coding but also tasks like building, compiling, localization, and more."
        }
       ListElement{
            imgUrl:"qrc:/res/webp/frontpage-placeholder-columns2.webp"
            keywords: "DEPLOY & MAINTAIN"
            title: "Create beautiful user interfaces"
            content: "Easily create connected devices, UIs and applications with native C++ performance. It's powerful, yet compact, has intuitive tools, and libraries and will blow your mind!"
        }
        ListElement{
            imgUrl:"qrc:/res/webp/frontpage-placeholder-columns3.webp"
            keywords: "DESIGN & PROTOTYPE"
            title: "Ship and maintain multiple platforms"
            content: "Qt Design Studio closes the gap between designers and developers. Now they can work simultaneously with one unifying framework, one common language, fewer feedback loops, and faster iterations."
        }
    }
    property ListModel _3DCarouselModel : ListModel{
        ListElement{
             imgUrl: "qrc:/res/svg/logo-cpp.svg"
             title: "C++"
        }
        ListElement{
             imgUrl: "qrc:/res/svg/logo-java.svg"
             title: "Java"
        }
        ListElement{
             imgUrl: "qrc:/res/svg/logo-javascript.svg"
             title: "JavaScript"
        }
        ListElement{
             imgUrl: "qrc:/res/svg/logo-kotlin.svg"
             title: "Kotlin"
        }
        ListElement{
             imgUrl: "qrc:/res/svg/logo-python.svg"
             title: "Python"
        }
        ListElement{
             imgUrl: "qrc:/res/svg/logo-php.svg"
             title: "PHP"
        }
        ListElement{
             imgUrl: "qrc:/res/svg/logo-rust.svg"
             title: "Rust"
        }
    }
}
