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
#include <QFont>
#include <QIcon>
#include "app.h"


int main(int argc, char* argv[]) {
    QApplication _app(argc, argv);
    QApplication::setApplicationDisplayName("IERX");
    QApplication::setApplicationName("IERX");
    QApplication::setOrganizationName("Wootec");
    QApplication::setOrganizationDomain("woooo.tech");
    QApplication::setWindowIcon(QIcon(":/assets/logo.svg"));

    QCommandLineParser parser;
    parser.setApplicationDescription("Interactive Explorer of Reverse-engineering X.");
    parser.addHelpOption();
    parser.addVersionOption();
    parser.process(_app);

    IERX::App app;
    app.initialize();

    return QApplication::exec();
}
