/**
 * @file platform.cxx
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief 
 * @version 0.1.0
 * @date 2022-09-07
 *
 * @copyright 2022 Woo Tech
 */

#include "platform.h"
#include <QApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQmlComponent>
#include <QQuickWindow>
#include <QThread>

#include "project.h"

namespace IERX {
void PlatformDataPrivate_::requestQuit() {
    emit quitRequested();
}

Platform::Platform(QObject* parent) : QObject(parent) {
    mData = new PlatformDataPrivate_();
    mData->setParent(this);
    m_project = new Project(this);
    mUiEngine = new QQmlEngine(this);
    mUiEngine->rootContext()->setContextProperty("platform", mData);
    mUiEngine->rootContext()->setContextProperty("project", m_project);
    mUiEngine->retranslate();
    mUiComponent = new QQmlComponent(mUiEngine, this);
    mUiComponent->loadUrl(QUrl(QStringLiteral("qrc:/platform/ui/Platform.qml")));
    mWindow = qobject_cast<QQuickWindow*>(mUiComponent->create());
    mWindow->hide();

    connect(mData, &PlatformDataPrivate_::quitRequested, this, [=]() {
        handleQuit();
    });
}

Platform::~Platform() = default;

void Platform::initialize() {
    QThread::sleep(1);
    emit initStateChanged(tr("Initializing..."), 5);
    QThread::sleep(2);
    emit initStateChanged(tr("Loading Platform..."), 25);
    QThread::sleep(1);
    emit initStateChanged(tr("Loading Plugins..."), 40);
    QThread::msleep(500);
    emit initStateChanged(tr("Loading Plugins..."), 55);
    QThread::msleep(500);
    emit initStateChanged(tr("Loading Plugins..."), 70);
    QThread::msleep(500);
    emit initStateChanged(tr("Cleaning up..."), 95);
    QThread::msleep(500);
    emit initStateChanged(tr("Welcome to IERX!"), 100);
    QThread::sleep(1);
}

void Platform::show() {
    mWindow->show();
}

void Platform::handleQuit() {
    mWindow->close();
    mWindow->deleteLater();
    mUiComponent->deleteLater();
    mUiEngine->deleteLater();
    QApplication::exit(0);
}

}
