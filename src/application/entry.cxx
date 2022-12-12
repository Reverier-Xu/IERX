/**
 * @file entry.cxx
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief
 * @version 0.1.0
 * @date 2022-09-06
 *
 * @copyright 2022 Woo Tech
 */

#include <QApplication>
#include <QCommandLineParser>
#include <QFontDatabase>
#include <QIcon>
#include "application.h"


int main(int argc, char* argv[]) {
    QApplication _app(argc, argv);
    QApplication::setApplicationDisplayName("IERX");
    QApplication::setApplicationName("IERX");
    QApplication::setOrganizationName("Wootec");
    QApplication::setOrganizationDomain("woooo.tech");
    QApplication::setWindowIcon(QIcon(":/assets/logo.svg"));

    QFontDatabase::addApplicationFont(":/fonts/sarasa-mono-sc-regular.ttf");
    auto defaultFont = QFont("Sarasa Mono SC");
    QApplication::setFont(defaultFont);

    QCommandLineParser parser;
    parser.setApplicationDescription("A reverse-engineering and digital forensic tool.");
    parser.addHelpOption();
    parser.addVersionOption();
    parser.process(_app);

    IERX::Application app;
    app.initialize();

    return QApplication::exec();
}
