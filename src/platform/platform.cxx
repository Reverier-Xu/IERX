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
#include <QTimer>

#include "project.h"
#include "systeminfo.h"


namespace IERX {
void PlatformDataPrivate_::requestQuit() {
    emit quitRequested();
}

#pragma clang diagnostic push
#pragma ide diagnostic ignored "readability-convert-member-functions-to-static"
quint64 PlatformDataPrivate_::memoryUsed() const {
    return SystemInfo::totalMemory() - SystemInfo::availableMemory();
}
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma ide diagnostic ignored "readability-convert-member-functions-to-static"
quint64 PlatformDataPrivate_::memoryTotal() const {
    return SystemInfo::totalMemory();
}
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma ide diagnostic ignored "readability-convert-member-functions-to-static"
quint64 PlatformDataPrivate_::diskUsed() const {
    return SystemInfo::totalDiskSpace() - SystemInfo::availableDiskSpace();
}
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma ide diagnostic ignored "readability-convert-member-functions-to-static"
quint64 PlatformDataPrivate_::diskTotal() const {
    return SystemInfo::totalDiskSpace();
}
#pragma clang diagnostic pop

void PlatformDataPrivate_::setMemoryUsed(quint64 n) {
    Q_UNUSED(n)
    emit memoryUsedChanged(memoryUsed());
}

void PlatformDataPrivate_::setMemoryTotal(quint64 n) {
    Q_UNUSED(n)
    emit memoryTotalChanged(memoryTotal());
}

void PlatformDataPrivate_::setDiskUsed(quint64 n) {
    Q_UNUSED(n)
    emit diskUsedChanged(diskUsed());
}

void PlatformDataPrivate_::setDiskTotal(quint64 n) {
    Q_UNUSED(n)
    emit diskTotalChanged(diskTotal());
}

quint64 PlatformDataPrivate_::showSideStack() const {
    return m_showSideStack;
}

quint64 PlatformDataPrivate_::showBottomStack() const {
    return m_showBottomStack;
}

void PlatformDataPrivate_::setShowSideStack(bool n) {
    if (m_showSideStack == n) {
        return;
    }
    m_showSideStack = n;
    emit showSideStackChanged(n);

}

void PlatformDataPrivate_::setShowBottomStack(bool n) {
    if (m_showBottomStack == n) {
        return;
    }
    m_showBottomStack = n;
    emit showBottomStackChanged(n);
}

Platform::Platform(QObject* parent) : QObject(parent) {
    m_data = new PlatformDataPrivate_();
    m_data->setParent(this);
    m_project = new Project(this);
    m_uiEngine = new QQmlEngine(this);
    m_uiEngine->rootContext()->setContextProperty("platform", m_data);
    m_uiEngine->rootContext()->setContextProperty("project", m_project);
    m_uiEngine->retranslate();
    m_uiComponent = new QQmlComponent(m_uiEngine, this);
    m_uiComponent->loadUrl(QUrl(QStringLiteral("qrc:/platform/ui/Platform.qml")));
    m_window = qobject_cast<QQuickWindow*>(m_uiComponent->create());
    m_window->hide();
    m_sysinfoTimer = new QTimer(this);
    m_sysinfoTimer->setInterval(5000);
    m_sysinfoTimer->start();

    connect(m_data, &PlatformDataPrivate_::quitRequested, this, [=]() {
        handleQuit();
    });
    connect(m_sysinfoTimer, &QTimer::timeout, this, [=]() {
        m_data->setDiskUsed(0);
        m_data->setMemoryUsed(0);
    });
}

Platform::~Platform() = default;

void Platform::initialize() {
    QThread::msleep(100);
    emit initStateChanged(tr("Initializing..."), 5);
    QThread::msleep(100);
    emit initStateChanged(tr("Checking License..."), 10);
    QThread::msleep(1000);
    emit initStateChanged(tr("Loading Platform..."), 25);
    QThread::msleep(1200);
    emit initStateChanged(tr("Loading Plugins..."), 40);
    QThread::msleep(500);
    emit initStateChanged(tr("Loading Plugins..."), 55);
    QThread::msleep(700);
    emit initStateChanged(tr("Loading Plugins..."), 70);
    QThread::msleep(300);
    emit initStateChanged(tr("Cleaning up..."), 95);
    QThread::msleep(1000);
    emit initStateChanged(tr("Welcome to IERX!"), 100);
    QThread::msleep(1000);
}

void Platform::show() {
    m_window->show();
}

void Platform::handleQuit() {
    m_window->close();
    m_window->deleteLater();
    m_uiComponent->deleteLater();
    m_uiEngine->deleteLater();
    QApplication::exit(0);
}

}
