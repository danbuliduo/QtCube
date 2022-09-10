#include <QTimer>
#include <QFontDatabase>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <CubeAndroid/CubeAndroidManager.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QTimer::singleShot(800, &app, [=] () {
        QNativeInterface::QAndroidApplication::hideSplashScreen(500);
    });

    QFontDatabase::addApplicationFont(QStringLiteral(":/res/font/AgencyFB.ttf"));
    QFontDatabase::addApplicationFont(QStringLiteral(":/res/font/DroidSansFallback.ttf"));

    app.setFont(QFont("DroidSansFallback"));
    app.setApplicationVersion("1.0.0-Alpha");
    app.setApplicationName("QtCube");
    app.setOrganizationName("HUBEI MINZU UNIVERSITY");

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));
    initializeCubeAndroid();

    const QUrl url("qrc:/Application.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
    &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl){ QCoreApplication::exit(-1);}
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
